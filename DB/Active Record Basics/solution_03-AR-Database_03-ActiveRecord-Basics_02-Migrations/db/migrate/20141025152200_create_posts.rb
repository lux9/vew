class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :url
      t.timestamps # add 2 columns, `created_at` and `updated_at`
    end
  end
end
