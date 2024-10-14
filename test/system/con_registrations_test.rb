require "application_system_test_case"

class ConRegistrationsTest < ApplicationSystemTestCase
  setup do
    @con_registration = con_registrations(:one)
  end

  test "visiting the index" do
    visit con_registrations_url
    assert_selector "h1", text: "Con registrations"
  end

  test "should create con registration" do
    visit con_registrations_url
    click_on "New con registration"

    check "Accepted" if @con_registration.accepted
    fill_in "Address line1", with: @con_registration.address_line1
    fill_in "Address line2", with: @con_registration.address_line2
    fill_in "City", with: @con_registration.city
    fill_in "Country", with: @con_registration.country
    fill_in "County", with: @con_registration.county
    fill_in "Date of birth", with: @con_registration.date_of_birth
    fill_in "Disability", with: @con_registration.disability
    fill_in "Full name", with: @con_registration.full_name
    fill_in "Fur name", with: @con_registration.fur_name
    fill_in "Medical", with: @con_registration.medical
    fill_in "Postcode", with: @con_registration.postcode
    fill_in "Tel", with: @con_registration.tel
    fill_in "User", with: @con_registration.user_id
    click_on "Create Con registration"

    assert_text "Con registration was successfully created"
    click_on "Back"
  end

  test "should update Con registration" do
    visit con_registration_url(@con_registration)
    click_on "Edit this con registration", match: :first

    check "Accepted" if @con_registration.accepted
    fill_in "Address line1", with: @con_registration.address_line1
    fill_in "Address line2", with: @con_registration.address_line2
    fill_in "City", with: @con_registration.city
    fill_in "Country", with: @con_registration.country
    fill_in "County", with: @con_registration.county
    fill_in "Date of birth", with: @con_registration.date_of_birth.to_s
    fill_in "Disability", with: @con_registration.disability
    fill_in "Full name", with: @con_registration.full_name
    fill_in "Fur name", with: @con_registration.fur_name
    fill_in "Medical", with: @con_registration.medical
    fill_in "Postcode", with: @con_registration.postcode
    fill_in "Tel", with: @con_registration.tel
    fill_in "User", with: @con_registration.user_id
    click_on "Update Con registration"

    assert_text "Con registration was successfully updated"
    click_on "Back"
  end

  test "should destroy Con registration" do
    visit con_registration_url(@con_registration)
    click_on "Destroy this con registration", match: :first

    assert_text "Con registration was successfully destroyed"
  end
end
