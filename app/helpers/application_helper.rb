module ApplicationHelper


 def liked_by_user?(post)
    post.likes.find_by(user: current_user).present?
 end

end
