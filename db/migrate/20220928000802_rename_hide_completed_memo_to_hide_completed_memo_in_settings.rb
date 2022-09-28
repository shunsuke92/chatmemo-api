class RenameHideCompletedMemoToHideCompletedMemoInSettings < ActiveRecord::Migration[7.0]
  def up
    rename_column :settings, :hideCompletedMemo, :hide_completed_memo
  end

  def down
    rename_column :settings, :hide_completed_memo, :hideCompletedMemo
  end
end
