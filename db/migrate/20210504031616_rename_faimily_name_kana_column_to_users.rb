class RenameFaimilyNameKanaColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :faimily_name_kana, :family_name_kana
  end
end
