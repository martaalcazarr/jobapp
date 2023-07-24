class OfferController < ApplicationController
    def index
        @offers = Offer.all
        respond_to do |format|
          format.html # Renderizar la vista index.html.erb
        end
    end
    def new
        @offer = Offer.new
    end
    def create
      @offer = current_user.offers.build(offer_params)
    
      if current_user.admin?
        if @offer.save
          redirect_to '/offers', notice: "La oferta ha sido creada exitosamente."
        else
          # Inspeccionar los errores y parámetros para depurar
          puts "Errors: #{offer.errors.full_messages}"
          puts "Params: #{offer_params.inspect}"
          redirect_to '/offers', notice: "La oferta no ha sido creada."
        end
      else
        puts "El usuario no es administrador y no puede crear una oferta."
        # Aquí puedes redirigir a una página de error o realizar otras acciones
      end
    end
    
    private

    def offer_params
    params.require(:offer).permit(:title, :description)
    end
end
