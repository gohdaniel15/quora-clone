class AnswerVote < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	belongs_to :answer
	belongs_to :user, foreign_key: :user_id

	validates :user_id, uniqueness: {scope: :answer_id}
end
