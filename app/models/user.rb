class User < ActiveRecord::Base
	def self.sign_in_from_omniauth(auth)
		# either find an existing user by its provider and uid parameters, or create the user from omniauth if user doesn't yet exist
		find_by(provider: auth['provider'], uid: auth['uid']) || create_user_from_omniauth(auth)
	end

	def self.create_user_from_omniauth(auth)
		create(
			provider: auth['provider'],
			uid: auth['uid'],
			name: auth['info']['name']
		)
	end
end
