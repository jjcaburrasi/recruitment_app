class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :job

  def status?(symbol)
    status.to_sym == symbol
  end
end
