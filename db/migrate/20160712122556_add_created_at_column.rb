class AddCreatedAtColumn < ActiveRecord::Migration
	def change
		add_column :questions, :created_at, :integer
		add_column :answers, :created_at, :integer
	end
end
