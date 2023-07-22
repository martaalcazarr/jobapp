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
        
        if @offer.save
          redirect_to '/offers', notice: "La oferta ha sido creada exitosamente."
        else
          redirect_to '/offers', notice: "La oferta no ha sido creada"
        end
      end

    private

    def offer_params
    params.require(:offer).permit(:title, :description)
    end
end
