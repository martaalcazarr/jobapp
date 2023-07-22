class JobApplicationsController < ApplicationController
    def new
        @job_application = JobApplication.new
    end
    
    def create
        @job_application = JobApplication.new(job_application_params)
        @job_application.user = current_user
    
        if @job_application.save
        # Lógica para una postulación exitosa
            flash[:notice] = "¡Postulación realizada con éxito!"
            redirect_to @job_application
        else
        # Lógica para el caso de error en la postulación
            flash[:alert] = "Error al realizar la postulación."
            render :new
        end
    end
    
    def show
        @job_application = JobApplication.find(params[:id])
    end
    
    private
    
    def job_application_params
        params.require(:job_application).permit(:job_offer_id)
    end
end
