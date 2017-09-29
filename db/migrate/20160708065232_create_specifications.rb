class CreateSpecifications < ActiveRecord::Migration[5.0]
  def change
    create_table :specifications do |t|
      t.string :property
      t.decimal :value
      t.string :uom
      t.references :commodity, foreign_key: true

      t.timestamps
    end
  end
end