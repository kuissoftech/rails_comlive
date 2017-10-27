class CreateBarcodes < ActiveRecord::Migration[5.0]
  def change
    create_table :barcodes do |t|
      t.string :format
      t.string :content
      t.string :image
      t.references :barcodeable, polymorphic: true

      t.timestamps
    end
  end
end