class AddCreatedatToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :createdAt, :string
  end
end
