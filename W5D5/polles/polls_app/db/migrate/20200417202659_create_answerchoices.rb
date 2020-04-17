class CreateAnswerchoices < ActiveRecord::Migration[5.2]
  def change
    create_table :answerchoices do |t|
      t.string :choice, null: false
      t.integer :question_id, null: false
    end
    add_index :answerchoices, :question_id
  end
end
