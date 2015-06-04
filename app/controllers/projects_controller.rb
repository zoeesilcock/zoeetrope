class ProjectsController < ApplicationController
  before_filter :require_login, except: [:index, :show]

  def index
    @featured_projects = Project.live.where(featured: true)
    @projects = Project.live.where(featured: false)
    @drafts = Project.where(draft: true)
  end

  def show
    @project = Project.find(params[:id])
  end

  # Admin only

  def new
    @project = Project.new
  end

  def create
    project = Project.create project_params
    redirect_to project_path(project)
  end

  def edit
    @project = Project.find(params[:id])
    @screenshot = Screenshot.new
  end

  def update
    project = Project.find(params[:id])
    project.update_attributes project_params
    redirect_to project_path(project)
  end

  private

  def project_params
    params.require(:project).permit(:title, :intro, :description, :license, :repository, :download_url, :featured, :draft)
  end
end
