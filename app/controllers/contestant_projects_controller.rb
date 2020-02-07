class ContestantProjectsController < ApplicationController
  def create
    ContestantProject.create!(c_p_params)
    redirect_to "/projects/#{params[:project_id]}"
  end

  private
    def c_p_params
      params.permit(
        :contestant_id,
        :project_id
      )
    end
end
