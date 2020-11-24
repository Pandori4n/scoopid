class AddTokenToSearchParties < ActiveRecord::Migration[6.0]
  def change
    add_column :search_parties, :authentication_token, :string
  end
end
