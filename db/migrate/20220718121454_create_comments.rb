class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :email
      t.text :comment
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
