require "test_helper"

class ConRegistrationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @con_registration = con_registrations(:one)
  end

  test "should get index" do
    get con_registrations_url
    assert_response :success
  end

  test "should get new" do
    get new_con_registration_url
    assert_response :success
  end

  test "should create con_registration" do
    assert_difference("ConRegistration.count") do
      post con_registrations_url, params: { con_registration: { accepted: @con_registration.accepted, address_line1: @con_registration.address_line1, address_line2: @con_registration.address_line2, city: @con_registration.city, country: @con_registration.country, county: @con_registration.county, date_of_birth: @con_registration.date_of_birth, disability: @con_registration.disability, full_name: @con_registration.full_name, fur_name: @con_registration.fur_name, medical: @con_registration.medical, postcode: @con_registration.postcode, tel: @con_registration.tel, user_id: @con_registration.user_id } }
    end

    assert_redirected_to con_registration_url(ConRegistration.last)
  end

  test "should show con_registration" do
    get con_registration_url(@con_registration)
    assert_response :success
  end

  test "should get edit" do
    get edit_con_registration_url(@con_registration)
    assert_response :success
  end

  test "should update con_registration" do
    patch con_registration_url(@con_registration), params: { con_registration: { accepted: @con_registration.accepted, address_line1: @con_registration.address_line1, address_line2: @con_registration.address_line2, city: @con_registration.city, country: @con_registration.country, county: @con_registration.county, date_of_birth: @con_registration.date_of_birth, disability: @con_registration.disability, full_name: @con_registration.full_name, fur_name: @con_registration.fur_name, medical: @con_registration.medical, postcode: @con_registration.postcode, tel: @con_registration.tel, user_id: @con_registration.user_id } }
    assert_redirected_to con_registration_url(@con_registration)
  end

  test "should destroy con_registration" do
    assert_difference("ConRegistration.count", -1) do
      delete con_registration_url(@con_registration)
    end

    assert_redirected_to con_registrations_url
  end
end
