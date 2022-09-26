class AddCreatedatToMemos < ActiveRecord::Migration[7.0]
  def change
    add_column :memos, :createdAt, :string
  end
end
