class AddPushWithEnterToSettings < ActiveRecord::Migration[7.0]
  def change
    add_column :settings, :push_with_enter, :boolean
  end
end
