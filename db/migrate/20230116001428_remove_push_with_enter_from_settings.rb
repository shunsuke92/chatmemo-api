class RemovePushWithEnterFromSettings < ActiveRecord::Migration[7.0]
  def change
    remove_column :settings, :push_with_enter, :boolean
  end
end
