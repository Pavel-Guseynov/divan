class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.belongs_to :album

      t.string :path

      t.integer :height
      t.integer :width

      t.string :mime

      t.timestamps
    end
  end
end
