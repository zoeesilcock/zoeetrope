class ProjectsController < ApplicationController
  def index
    @projects = Project.order(:created_at)
  end

  def show
    @project = Project.find(params[:id])
  end
end
