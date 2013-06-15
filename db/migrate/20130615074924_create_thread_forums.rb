class CreateThreadForums < ActiveRecord::Migration
  def change
    create_table :thread_forums do |t|
      t.integer  :user_id
      t.string   :title
      t.text     :body
      t.string   :status
      t.boolean  :is_deleted
      t.integer  :reputation_point
      t.integer  :category_id

      t.timestamps
    end
  end
end
