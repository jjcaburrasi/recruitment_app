class Application < ApplicationRecord
  belongs_to :user
  belongs_to :job
  belongs_to :stage
end
