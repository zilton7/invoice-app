class InvoicesController < ApplicationController
  before_action :set_invoice, only: %i[show edit update destroy]

  # GET /invoices or /invoices.json
  def index
    @invoices = Invoice.all
    respond_to do |format|
      format.html
      format.json do
        render json: Invoice.all.order('created_at DESC').includes(:services).to_json(only: [:id],
                                                                                      include: [services: { only: :name }])
      end
    end
  end

  # GET /invoices/1 or /invoices/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        pdf = ExportInvoice.new(@invoice)
        send_data pdf.render,
                  filename: 'export.pdf',
                  type: 'application/pdf',
                  disposition: 'inline'
      end
    end
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new(services: [Service.new])
  end

  # GET /invoices/1/edit
  def edit; end

  # POST /invoices or /invoices.json
  def create
    @invoice = Invoice.new(invoice_params)

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1 or /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1 or /invoices/1.json
  def destroy
    @invoice.destroy

    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'Invoice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_invoice
    @invoice = Invoice.find(params[:id])
  end

  def set_service
    @service = @invoice.services.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def invoice_params
    params.require(:invoice).permit(:client_id, :creation_date, :pay_until, :include_vat, :discount, :written_by,
                                    :notes, services_attributes: %i[id name price unit amount vat _destroy])
  end
end
