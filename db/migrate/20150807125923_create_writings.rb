class CreateWritings < ActiveRecord::Migration
  def change
    create_table :writings do |t|
      t.string :title
      t.string :writing_type
      t.text :content
      t.integer :user_id
      t.integer :comments_count

      t.timestamps null: false
    end
  end
end
