class CreateReplies < ActiveRecord::Migration[7.0]
  def change
    create_table :replies do |t|
      t.text :body
      t.references :memo, null: false, foreign_key: true

      t.timestamps
    end
  end
end
