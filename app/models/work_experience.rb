class WorkExperience < ActiveRecord::Base
	validates :title, :start_date, :end_date, presence: :true

	belongs_to :user
end
