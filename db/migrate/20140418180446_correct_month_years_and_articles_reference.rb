class CorrectMonthYearsAndArticlesReference < ActiveRecord::Migration
  def change
    change_table :articles do |t|
      t.references :month_year, index: true
    end
  end
end
