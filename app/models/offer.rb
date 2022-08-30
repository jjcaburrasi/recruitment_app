class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :job

  def status?(symbol)
    status.to_sym == symbol
  end

  def reject
    update_attribute(:status, "rejected")
  end

  def accept
    update_attribute(:status, "accepted")
  end
end
