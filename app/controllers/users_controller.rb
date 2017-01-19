class UsersController < ApplicationController
  def new
  	User.last.destroy if User.last
  end

  def create
  	if params[:user_info].nil?
  		flash[:alert] = "Ops! No file found! Please upload a JSON file"

			redirect_to '/'
  	elsif is_json?(user_params[:file].tempfile)
  		json = JSON.parse(user_params[:file].read)
  		
  		@user = User.new

  		@user.name = json["name"]
  		@user.phone = json["phone"]
	    @user.email = json["email"]
	    @user.street = json["address"]["street"] unless json["address"]["street"].nil?
	    @user.city = json["address"]["city"] unless json["address"]["city"].nil?
	    @user.zip = json["address"]["zip"] unless json["address"]["zip"].nil?
	    @user.state = json["address"]["state"] unless json["address"]["state"].nil?
	    @user.image = json["image"] unless json["image"].nil?
	    @user.others = json["others"] unless json["others"].nil?
	    @user.about = json["about"]
	    @user.languages = json["languages"]
	    
	    if @user.save
	    	json["awards"].each {|award| @user.awards.create(award)} unless json["awards"].nil?

	    	json["educations"].each {|education| @user.educations.create(education)} unless json["educations"].nil?

	    	json["projects"].each {|project| @user.projects.create(project)} unless json["projects"].nil?

	    	json["recommendations"].each {|recommendation| @user.recommendations.create(recommendation)} unless json["recommendations"].nil?

	    	json["skills"].each {|skill| @user.skills.create(skill)} unless json["skills"].nil?

	    	json["workExperiences"].each {|experience| @user.work_experiences.create(experience)} unless json["workExperiences"].nil?

	    	redirect_to @user
	    else
	    	flash[:alert] = "Ops!! Something wrong with your JSON format. Please upload a properly formatted resume JSON."

				redirect_to '/'
	    end
  	else
  		flash[:alert] = "Ops!! Something wrong with your JSON format. Please upload a properly formatted resume JSON."

			redirect_to '/'
  	end
  end

  def show
  	if User.last
  		@user = User.last
  	else
  		flash[:alert] = "Ops!!! You should not be here. Please upload your resume JSON first"

			redirect_to '/'
  	end
  end

  private

  def user_params
  	params.require(:user_info).permit(:file)
  end
end
