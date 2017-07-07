class CreateDefaultImages < ActiveRecord::Migration[5.1]
  def change
    create_table :default_images do |t|
      t.string :image

      t.timestamps
    end
  end
end
