class ChangePasswordConfirmationColumn < ActiveRecord::Migration
	def change
		rename_column :users, :password_digest_confirmation, :password_confirmation
	end
end
