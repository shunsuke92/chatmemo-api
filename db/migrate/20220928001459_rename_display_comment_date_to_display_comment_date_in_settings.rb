class RenameDisplayCommentDateToDisplayCommentDateInSettings < ActiveRecord::Migration[7.0]
  def up
    rename_column :settings, :displayCommentDate, :display_comment_date
  end

  def down
    rename_column :settings, :display_comment_date, :displayCommentDate
  end
end
