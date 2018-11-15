class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :password_digest, full: false
      t.string :session_token, full: false

      t.timestamps
    end
  end
end
