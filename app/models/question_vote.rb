class QuestionVote < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	belongs_to :question
	belongs_to :user, foreign_key: :user_id

	validates :user_id, uniqueness: {scope: :question_id}
end
