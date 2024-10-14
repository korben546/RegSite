class ConRegistrationsController < ApplicationController
  before_action :set_con_registration, only: %i[ show edit update destroy ]

  # GET /con_registrations or /con_registrations.json
  def index
    @con_registrations = current_user.con_registrations.order(created_at: :desc).limit(1)
  end

  # GET /con_registrations/1 or /con_registrations/1.json
  def show
  end

  # GET /con_registrations/new
  def new
    @con_registration = ConRegistration.new
  end

  # GET /con_registrations/1/edit
  def edit
  end

  # POST /con_registrations or /con_registrations.json
  def create
    @con_registration = ConRegistration.new(con_registration_params)
    @con_registration.user_id = current_user.id

    respond_to do |format|
      if @con_registration.save
        format.html { redirect_to @con_registration, notice: "Con registration was successfully created." }
        format.json { render :show, status: :created, location: @con_registration }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @con_registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /con_registrations/1 or /con_registrations/1.json
  def update
    respond_to do |format|
      if @con_registration.update(con_registration_params)
        format.html { redirect_to @con_registration, notice: "Con registration was successfully updated." }
        format.json { render :show, status: :ok, location: @con_registration }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @con_registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /con_registrations/1 or /con_registrations/1.json
  def destroy
    @con_registration.destroy!

    respond_to do |format|
      format.html { redirect_to con_registrations_path, status: :see_other, notice: "Con registration was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_con_registration
      begin
        @con_registration = current_user.con_registration.find(params[:id])
      rescue
        head :forbidden
      end
    end

    # Only allow a list of trusted parameters through.
    def con_registration_params
      params.require(:con_registration).permit(:user_id, :full_name, :fur_name, :date_of_birth, :address_line1, :address_line2, :postcode, :county, :city, :country, :tel, :disability, :medical, :accepted)
    end
end
