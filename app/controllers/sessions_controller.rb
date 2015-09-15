class SessionsController < ApplicationController
	def create
		# when you make request to (e.g. FB), the response is stored in request.env["omniauth.auth"]
		auth = request.env["omniauth.auth"]
		# create session variable called omniauth and assign it to the auth response (the '.except('extra')' just culls the extra stuff in the response that isn't necessary)
		session[:omniauth] = auth.except('extra')
		# user is the user signed in thru omniauth (the sign_in_from_omniauth method will be in the user model)
		user = User.sign_in_from_omniauth(auth)
		# now, assign the session to be that of the user that we've just signed in thru omniauth
		session[:user_id] = user.id
		# finally, redirect to root path
		redirect_to root_url, notice: "SIGNED IN"
	end
	def destroy
		session[:user_id] = nil
		session[:omniauth] = nil
		redirect_to root_url, notice: "SIGNED OUT"
	end
end
