class UsedTechnologiesController < ApplicationController

  before_filter :find_project

  def index
    @used_technologies = @project.used_technologies
  end

  def create
    technology = Technology.find_or_create_by(title: params[:title])
    @used_technology = @project.used_technologies.new(technology: technology)

    unless @used_technology.save
      render json: used_technology.errors, :status => 422
    end
  end

  def sort
    params[:order].each_with_index do |id, order|
      used_technology = @project.used_technologies.find(id)
      used_technology.update_attributes(sort_order: order)
    end

    render json: { success: true }
  end

  def destroy
    @project.used_technologies.where(id: params[:id]).first.destroy

    render json: { success: true }
  end

  private

  def find_project
    @project = Project.find(params[:project_id])
  end
end
