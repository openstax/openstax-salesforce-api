# This migration comes from openstax_salesforce (originally 0)
# TODO: Remove after all servers have been migrated
class InstallOpenStaxSalesforce < ActiveRecord::Migration[4.2]
  def change
    create_table :openstax_salesforce_users do |t|
      t.string :name
      t.string :uid, null: false
      t.string :oauth_token, null: false
      t.string :refresh_token, null: false
      t.string :instance_url, null: false

      t.timestamps null: false
    end
  end
end
