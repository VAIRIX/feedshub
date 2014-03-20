# This migration comes from feedshub (originally 20140318133306)
class CreateFeedshubGithubFeedEntries < ActiveRecord::Migration
  def change
    create_table :feedshub_github_feed_entries do |t|
      t.string :entry_id
      t.datetime :published
      t.datetime :updated
      t.string :url
      t.string :title
      t.string :author
      t.text :content

      t.timestamps
    end
    add_index :feedshub_github_feed_entries, :entry_id
  end
end
