class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :product_id
      t.integer :user_id
      t.text :description
      t.integer :rating

      t.datetime "created_at",      null: false
      t.datetime "updated_at",      null: false
    end
    add_reference :products, :review, foreign_key: true
    add_reference :users, :review, foreign_key: true
  end
end
