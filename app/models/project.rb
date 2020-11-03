class Project < ApplicationRecord
    has_many :outcrops
    has_many :users, through: :outcrops
end
