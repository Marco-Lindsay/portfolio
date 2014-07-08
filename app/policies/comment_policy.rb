class CommentPolicy < Struct.new(:user, :comment)

  def update?
    user && (user.author? || user.editor?)
  end

  def approve?
    user && user.editor?
  end

  def create?
    user && user.author? || user && user.editor?
  end

  def destroy?
    user && user.editor?
  end

  class Scope < Struct.new(:user, :scope)

    def resolve
      if user.present? && user.editor?
        scope.all
      elsif user.present? && user.author?
        scope.where(author_id: user)
      else
        scope.where(approved: true)
      end
    end

 end
end
