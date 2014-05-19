class PostPolicy < Struct.new(:user, :post)

  def update?
    user.present? && (user.author? || user.editor?)
  end

  def publish?
    user.present? && user.editor?
  end

  def create?
    user.present? && user.author? || user.editor?
  end

  def destroy?
    user.present? && user.editor?
  end

  class Scope < Struct.new(:user, :scope)

    def resolve
      if user.present? && user.editor?
        scope.all
      elsif user.present? && user.author?
        scope.where(author_id: user)
      else
        scope.where(published: true)
      end
    end

 end
end