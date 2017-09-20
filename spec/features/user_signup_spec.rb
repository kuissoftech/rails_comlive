require 'rails_helper'

feature 'User signs up' do

  scenario 'with valid email and password' do
    sign_up_with('user@example.com', 'secretpass')

    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(page).to have_link('Logout', href: destroy_user_session_path)
  end

  scenario 'with invalid email' do
    sign_up_with('invalidemail', 'secretpass')

    expect(page).to have_content('Email is invalid')
  end

  scenario 'with password length less than 6 characters' do
    sign_up_with('user@example.com', '1234')

    expect(page).to have_content('Password is too short (minimum is 6 characters)')
  end

  scenario 'with mismatched password' do
    sign_up_with("user@example.com","123456","12345")

    expect(page).to have_content("Password confirmation doesn't match Password")
  end

  scenario 'with blank password' do
    sign_up_with("user@example.com","")

    expect(page).to have_content("Password can't be blank")
  end
end