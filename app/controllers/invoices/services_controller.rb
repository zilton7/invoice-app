module Invoices
  class ServicesController < ApplicationController
    before_action :set_service, only: %i[edit show update]
    before_action :setup_service, only: %i[new destroy]

    def new; end

    def edit; end

    def update
      respond_to do |format|
        if @service.update(service_params)
          format.html { redirect_to @service.invoice, notice: 'Invoice was successfully updated.' }
          format.json { render :show, status: :ok, location: @invoice }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @invoice.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy; end

    private

    def set_service
      @service = Service.find(params[:id])
    end

    def setup_service
      @invoice = Invoice.new(services: [Service.new])
    end

    def service_params
      params.require(:service).permit(:id, :name, :price, :unit, :amount, :vat, :_destroy)
    end
  end
end
