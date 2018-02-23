class SessionsController < ApplicationController

		def new
			@user = User.new
		end

	def create
		
		@user = User.find_by(email: params[:user][:email])

	if  @user.present?
		if @user.authenticate!(params[:user][:password])
			session[:user_id] = @user.id
			redirect_to root_path, notice: 'Has ingresado con exito'
		else
			redirect_to root_path, alert: 'Tus credenciales no son válidas'
		end
	end		

	end

	def destroy
		
 		reset_session
 		redirect_to root_path, notice: 'Has cerrado sesion con exito'
	end
end
