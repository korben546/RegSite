module Admin
  class AdminController < ApplicationController
    before_action :authenticate_user!
    before_action :has_admin?
    def index
      render "admin/index"
    end

    private

    def has_admin?
      if current_user.try(:admin?)
        logger.info "Admin Page Accessed Successfully"
      else
        logger.info "Attempted Admin Access"
        head :forbidden
      end
    end
  end
end
