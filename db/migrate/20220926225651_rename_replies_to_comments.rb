class RenameRepliesToComments < ActiveRecord::Migration[7.0]
  def up
    rename_table :replies, :comments
  end

  def down
    rename_table :comments, :replies
  end
end
