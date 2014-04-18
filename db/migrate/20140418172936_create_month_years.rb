class CreateMonthYears < ActiveRecord::Migration
  def change
    create_table :month_years do |t|
      t.integer :month
      t.integer :year
      t.references :article, index: true

      t.timestamps
    end
  end
end
