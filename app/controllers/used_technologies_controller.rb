class UsedTechnologiesController < ApplicationController
  def index
    project = Project.find(params[:project_id])
    render json: project.used_technologies.as_json
  end

  def create
    technology = Technology.find_or_create_by(title: params[:title])
    used_technology = UsedTechnology.new(technology: technology, project_id: params[:project_id])

    if used_technology.save
      render json: used_technology.to_json
    else
      render json: used_technology.errors, :status => 422
    end
  end

  def sort
    project = Project.find(params[:project_id])

    params[:order].each_with_index do |id, order|
      used_technology = project.used_technologies.find(id)
      used_technology.update_attributes(sort_order: order)
    end

    render json: { success: true }
  end

  def destroy
    project = Project.find(params[:project_id])

    project.used_technologies.where(id: params[:id]).first.destroy
    render json: { success: true }
  end
end
