class Project < ApplicationRecord
    has_many :outcrops
    has_many :users, through: :outcrops
    accepts_nested_attributes_for :outcrops

    scope :alpha, -> {order(:name)}
    scope :project_users, -> {joins(:users).group('projects.id').order('count(projects.id) desc').limit(1)}

    def outcrops_attributes=(outcrop_attributes)
        outcrop_attributes.values.each do |outcrop_attribute|
            outcrop = Outcrop.find_or_create_by(outcrop_attribute)
            self.outcrops << outcrop
        end
    end

end
