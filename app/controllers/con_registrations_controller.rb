class ConRegistrationsController < ApplicationController
  MAX_REG_TO_DISPLAY = 1 # removes magic number and limits number of registrations on index to the most recent one
  before_action :authenticate_user!
  before_action :set_con_registration, only: %i[ show edit update destroy ]

  # GET /con_registrations or /con_registrations.json
  def index
    @con_registrations = ConRegistration.visible_to_user(current_user) # checks against scope in model to only return most recent reg to normal users
  end

  # GET /con_registrations/1 or /con_registrations/1.json
  def show
    if current_user.admin? # allows admins to edit all
      @con_registration = ConRegistration.find(params[:id])
    else
      @con_registration = ConRegistration.visible_to_user(current_user).first
      if @con_registration.nil? || @con_registration.id.to_s != params[:id] # Check if @con_registration is present and matches the requested id
        head :forbidden
      else
        render :show
      end
    end
  end

  # GET /con_registrations/new
  def new
    @con_registration = ConRegistration.new
  end

  # GET /con_registrations/1/edit
  def edit
    if current_user.admin? # allows admins to edit all
      @con_registration = ConRegistration.find(params[:id])
    else
      @con_registration = ConRegistration.visible_to_user(current_user).first
      if @con_registration.nil? || @con_registration.id.to_s != params[:id] # Check if @con_registration is present and matches the requested id
        head :forbidden
      else
        render :edit
      end
    end
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
      format.html { redirect_to con_registrations_path, status: :see_other, notice: "Con registration was irreversably destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_con_registration
      @con_registration = ConRegistration.visible_to_user(current_user).first

      if @con_registration.nil?
        head :forbidden
      end
    end

    # Only allow a list of trusted parameters through.
    def con_registration_params
      params.require(:con_registration).permit(:user_id, :full_name, :fur_name, :date_of_birth, :address_line1, :address_line2, :postcode, :county, :city, :country, :tel, :disability, :medical, :accepted)
    end
end
