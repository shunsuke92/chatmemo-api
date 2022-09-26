class AddDeletedatToMemos < ActiveRecord::Migration[7.0]
  def change
    add_column :memos, :deletedAt, :string
  end
end
