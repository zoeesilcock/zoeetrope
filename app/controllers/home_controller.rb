class HomeController < ApplicationController
  def index
  end

  def robots
    render 'home/robots.txt.erb', layout: false, content_type: 'text/plain'
  end

  def sitemap
    path = Rails.root.join('public', 'sitemaps', 'sitemap.xml')

    if File.exists?(path)
      render xml: open(path).read
    else
      render text: 'Sitemap not found.', status: :not_found
    end
  end
end
