class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer  :user_id
      t.text     :body
      t.string   :status
      t.boolean  :is_deleted
      t.integer  :reputation_point
      t.integer  :category_id
      t.references :thread_forum

      t.timestamps
    end

    add_index :comments, :thread_forum_id
  end
end
