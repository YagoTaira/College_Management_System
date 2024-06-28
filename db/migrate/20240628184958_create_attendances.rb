class CreateAttendances < ActiveRecord::Migration[7.1]
  def change
    create_table :attendances do |t|
      t.references :enrollment, null: false, foreign_key: true
      t.date :date
      t.string :status

      t.timestamps
    end
  end
end
