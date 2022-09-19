class RemoveTypeFromMemos < ActiveRecord::Migration[7.0]
  def change
    remove_column :memos, :type, :string
  end
end
