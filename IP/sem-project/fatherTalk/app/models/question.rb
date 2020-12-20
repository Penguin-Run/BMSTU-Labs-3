class Question < ApplicationRecord
	validates :title, presence: true
	validates :text, presence: true
	validates :user_id, presence: true
end
