class ChangePushWithEnterDefaultOnSettings < ActiveRecord::Migration[7.0]
  def change
    change_column_default :settings, :push_with_enter, from: true, to: false
  end
end
