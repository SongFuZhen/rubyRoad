class UserSessionsController < ApplicationController

	def new
		@user_session = UserSession.new		
	end

	def create
		@user_session = UserSession.new(user_session_params)
		if @user_session.save
			redirect_to welcome_index_path
		else
			render :new
		end
	end

	def destroy
		current_user_session.destroy
		flash[:success] = "GoodBye!"
		redirect_to root_path
	end


	private

	def user_session_params
		params.require(:user_session).permit(:email, :password, :remember_me)
	end
end