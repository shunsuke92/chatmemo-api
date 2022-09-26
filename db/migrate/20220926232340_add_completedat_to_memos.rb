class AddCompletedatToMemos < ActiveRecord::Migration[7.0]
  def change
    add_column :memos, :completedAt, :string
  end
end
