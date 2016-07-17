class TaskAuthorizer < ApplicationAuthorizer
  def deletable_by?(user)
    resource.author_id == user.id
  end
end
