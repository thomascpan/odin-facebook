module ApplicationHelper
	def access_level?(viewer, user)
		if user == viewer || user.friend?(viewer)
			familiar = true
		else
			if user.profile.access == "All Users"
				accessible = true
			elsif user.profile.access == "Friends Only"
				accessible = false
			end
		end
		return hash = {:familiar => familiar,
									:accessible => accessible}
  end	
end
