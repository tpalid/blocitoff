class UserPolicy < ApplicationPolicy
    def show?
        record.user == current_user || user.admin?
    end
end