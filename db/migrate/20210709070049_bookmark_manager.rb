class BookmarkManager < ActiveRecord::Migration[6.1] # this is auto geneated once you run the migration
  def change
    # create a table # below table we created by ourselves
    create_table :users do |t| # this users table will be migrated to dbeaver once it is run 
      t.string :full_name # creates a column called full_name
      t.string :email # creates a column email
      t.timestamps # creates two columns for storing timestamps
    end
  end
end
