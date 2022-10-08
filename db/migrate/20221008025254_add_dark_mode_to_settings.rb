class AddDarkModeToSettings < ActiveRecord::Migration[7.0]
  def change
    add_column :settings, :dark_mode, :string, default: 'os'
  end
end
