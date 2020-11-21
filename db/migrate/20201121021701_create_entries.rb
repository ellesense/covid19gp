class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.boolean :question_one
      t.boolean :question_two
      t.boolean :question_three
      t.boolean :question_four
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
