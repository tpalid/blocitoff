class ItemPolicy < ApplicationPolicy
    class Scope
        attr_reader :user, :scope
        def initialize(user, scope)
            @user = user
            @scope = scope
        end
        
        def resolve
            if user.admin?
                scope
            else
                scope.where("public='t' OR user_id=?", user.id)
            end
        end
    end
end

# ItemPolicy::Scope.new(current_user, @user.items).resolve
# policy_scope(@user.items)