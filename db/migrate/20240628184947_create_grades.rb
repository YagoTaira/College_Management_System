class CreateGrades < ActiveRecord::Migration[7.1]
  def change
    create_table :grades do |t|
      t.references :enrollment, null: false, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end
