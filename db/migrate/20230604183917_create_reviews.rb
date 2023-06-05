class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :product_id
      t.string :content
      t.belongs_to :product, foreign_key: true
      t.belongs_to :user, foreign_key: true
    end
  end
end
