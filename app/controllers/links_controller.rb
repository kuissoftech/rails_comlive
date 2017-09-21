class LinksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_app

  def index
    @links = @app.links
  end

  def show
    @link = @app.links.find(params[:id])
    redirect_to app_commodity_path(@link.commodity_id)
  end

  def new
    @link = Link.new
  end

  def create
    @link = @app.links.create(link_params)
    if @link.save
      redirect_to [@app, @link], notice: "link successfully created"
    else
      render :new
    end
  end

  def edit
    @link = @app.links.find(params[:id])
  end

  def update
    @link = @app.links.find(params[:id])
    if @link.update(link_params)
      redirect_to [@app, @link], notice: "link successfully updated"
    else
      render :edit
    end
  end

  private

  def set_app
    @app = current_user.apps.find(params[:app_id])
  end

  def link_params
    params.require(:link).permit(:url,:description, :commodity_id)
  end
end