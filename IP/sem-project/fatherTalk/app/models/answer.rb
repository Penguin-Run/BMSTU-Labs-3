class Answer < ApplicationRecord
	validates :text, presence: true
	validates :user_id, presence: true
	validates :question_id, presence: true
end
