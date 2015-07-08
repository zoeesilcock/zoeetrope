class ScreenshotsController < ApplicationController

  before_filter :require_login

  def create
    screenshot = Screenshot.new screenshot_params

    if screenshot.save
      redirect_to edit_project_path(screenshot.project)
    else
      render json: screenshot.errors
    end
  end

  def edit
    @screenshot = Screenshot.find(params[:id])
    @project = @screenshot.project
  end

  def update
    screenshot = Screenshot.find(params[:id])
    screenshot.update_attributes screenshot_params
    redirect_to edit_project_path(screenshot.project)
  end

  def destroy
    screenshot = Screenshot.find(params[:id])
    project = screenshot.project
    screenshot.destroy
    redirect_to edit_project_path(project)
  end

  private

  def screenshot_params
    params.require(:screenshot).permit(:image, :caption, :sort_order, :project_id)
  end

end
