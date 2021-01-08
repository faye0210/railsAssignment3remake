class CreatePostingPages < ActiveRecord::Migration[5.2]
  def change
    create_table :posting_pages do |t|
      t.text :content

      t.timestamps
    end
  end
end
