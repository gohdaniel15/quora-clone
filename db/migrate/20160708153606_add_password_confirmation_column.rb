class AddPasswordConfirmationColumn < ActiveRecord::Migration
	def change
		add_column :users, :encrypted_password_confirmation, :string
	end
end
