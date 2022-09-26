class AddUpdatedatToMemos < ActiveRecord::Migration[7.0]
  def change
    add_column :memos, :updatedAt, :string
  end
end
