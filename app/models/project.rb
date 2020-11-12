class Project < ApplicationRecord
    has_many :outcrops
    has_many :users, through: :outcrops

    scope :alpha, -> {order(:name)}
    scope :project_users, -> {joins(:users).group('projects.id').order('count(projects.id) desc').limit(1)}

    def self.most_contributors

    end
end
