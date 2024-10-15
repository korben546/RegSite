module Admin
  class SearchController < AdminController
    def index
      # Use direct params instead of params[:q]
      attribute = params[:attribute]
      value = params[:value]
      query_type = params[:query_type]
      global_search = params[:global_search]
      accepted = params[:accepted]

      if global_search.present?
        # Global search across all attributes not including id and user_id. with contains
        @registrations = ConRegistration.ransack(
          full_name_or_fur_name_or_tel_or_address_line1_or_address_line2_or_postcode_or_city_or_county_or_country_cont: global_search
        ).result(distinct: true)
      else
        # Search by attribute
        search_key = "#{attribute}_#{query_type}"  # e.g., full_name_cont or tel_eq
        @registrations = ConRegistration.ransack(search_key => value).result(distinct: true)
      end

      # Filter by accepted if the checkbox is checked
      if accepted == "1"
        @registrations = @registrations.where(accepted: false)
      end
    end
  end
end
