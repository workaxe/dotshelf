class AddLanguageToEndings < ActiveRecord::Migration
  def change
    add_column :endings, :language, :string
  end
end
