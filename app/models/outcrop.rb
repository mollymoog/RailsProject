class Outcrop < ApplicationRecord
    belongs_to :user
    belongs_to :project, optional: true
    accepts_nested_attributes_for :project

    validates :location, presence: true
    validates :description, presence: true
    validates :latitude, presence: true
    validates :longitude, presence: true
    
    def project_attributes=(project_attributes)
        if !project_attributes
            self.project = Project.find_or_create_by(name: project_attributes[:name])
        end  
    end
end
