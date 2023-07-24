class Offer < ApplicationRecord
    has_many :job_applications
    belongs_to :user
  end