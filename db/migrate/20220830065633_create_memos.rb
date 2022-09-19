class CreateMemos < ActiveRecord::Migration[7.0]
  def change
    create_table :memos do |t|
      t.text :body
      t.boolean :completed
      t.string :type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
