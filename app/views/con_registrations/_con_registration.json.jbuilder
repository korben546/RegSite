json.extract! con_registration, :id, :user, :full_name, :fur_name, :date_of_birth, :address_line1, :address_line2, :postcode, :county, :city, :country, :tel, :disability, :medical, :accepted, :created_at, :updated_at
json.url con_registration_url(con_registration, format: :json)
