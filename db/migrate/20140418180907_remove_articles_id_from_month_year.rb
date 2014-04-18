class RemoveArticlesIdFromMonthYear < ActiveRecord::Migration
  def change
    remove_column :month_years, :article_id, :integer
  end
end
