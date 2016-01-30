class UserPolicy < ApplicationPolicy
    def show?
        scope.where(:id => record.id).exists? && user.present?
    end
end