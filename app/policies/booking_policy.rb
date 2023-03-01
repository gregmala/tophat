class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end
  def create?
    true
  end

  def new?
    true
  end

  def accept?
    record.product.owner_id = user.id
  end

  def decline?
    record.product.owner_id = user.id
  end

  def index
    record.product.owner_id = user.id
  end
end
