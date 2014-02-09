class ProjectsController < ApplicationController
  before_filter :require_login, except: [:index, :show]

  def index
    @projects = Project.order(:created_at)
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
  end

  def update
    project = Project.update_attributes project_params
    redirect_to project_path(project)
  end

  def technologies
    project = Project.find(params[:project_id])
    render json: project.technologies.as_json
  end

  def technologies_order
    project = Project.find(params[:project_id])

    params[:order].each_with_index do |id, order|
      used_technology = project.used_technologies.where(technology_id: id).first
      used_technology.update_attributes(sort_order: order)
    end

    render json: { success: true }
  end

  private

  def project_params
    params.require(:project).permit(:title, :intro, :description)
  end
end
