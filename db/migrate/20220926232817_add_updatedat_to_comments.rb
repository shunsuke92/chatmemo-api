class AddUpdatedatToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :updatedAt, :string
  end
end
