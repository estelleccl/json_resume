class User < ActiveRecord::Base

	validates :name, :phone, :email, :about, :languages, presence: :true

	validates :email, uniqueness: true

	has_many :awards, dependent: :destroy
	has_many :educations, dependent: :destroy
	has_many :projects, dependent: :destroy
	has_many :recommendations, dependent: :destroy
	has_many :skills, dependent: :destroy
	has_many :work_experiences, dependent: :destroy

end
