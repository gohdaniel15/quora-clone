class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	has_secure_password

	# Only ensures there is one @ in the email. If more/less, it will not pass.
	validates :email, uniqueness: true, presence: true, format: {
		with: /[^@]+@{1}[^@]+/,
	message: "Invalid email" }
	validates :password, presence: true, length: { minimum: 8 }
	validates :first_name, presence: true
	validates :last_name, presence: true

end
