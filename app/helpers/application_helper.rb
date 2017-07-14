module ApplicationHelper

	# Returns the current logged-in user (if any).
	def current_user
		@current_user ||= User.find_by(id: session[:user_id])
	end

	# Returns true if the given user is the current user.
	def current_user?(user)
		user == current_user
	end

	def menu_has_children?(id)
		flag = false
		testas = Page.where("parent = ?", id)
		if testas.size > 0
			flag = true
	  end
		return flag
	end

	def ap(path)
	  	"active" if current_page?(path)
	end


end
