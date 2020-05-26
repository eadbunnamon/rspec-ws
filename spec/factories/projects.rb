# Class for mocking Project model
class Project
    attr_accessor :id, :name, :published
end

FactoryBot.define do
    sequence(:project_name) { |n| "Project #{n}" }
    factory :project, class: 'Project' do
        id    { 1 }
        name  { FactoryBot.generate(:project_name) }
        published   { false }
    end
end
