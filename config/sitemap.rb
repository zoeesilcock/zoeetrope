host 'zoeetrope.com'

sitemap :site do
  url root_url, last_mod: Time.now, change_freq: 'daily', priority: 1.0
  url projects_url, priority: 0.9
  url contact_url, priority: 0.8
end

sitemap_for Project.all, name: :projects do |project|
  url project, last_mod: project.updated_at, priority: (project.featured? ? 1.0 : 0.7)
end

ping_with "http://#{host}/sitemap.xml" if Rails.env.production?
