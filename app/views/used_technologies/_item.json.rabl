object @used_technology

attributes :id, :project_id, :technology_id, :sort_order

glue :technology do
  attributes :title
end
