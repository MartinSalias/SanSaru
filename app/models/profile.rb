class Profile < ApplicationRecord
    belongs_to :size
    belongs_to :gender
    belongs_to :agile
    belongs_to :agileRelation
    validates :residence, presence: true
    validates :expectancy, presence: true
    validates :agile_description, presence: true
    validates :bio, presence: true
end