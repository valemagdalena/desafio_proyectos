class ProjectsController < ApplicationController
  def index
    if params[:state].present?
      @project = Project.where('status = ?', params[:state])
    else
      @project = Project.all
    end
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.create(project_params)
    if @project.save
      redirect_to root_path, notice: "Se ha creado el proyecto con éxito"
    else
      redirect_to root_path, alert: "No se ha podido guardar su proyecto"
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :status, :initial_date, :finish_date)
  end

end
