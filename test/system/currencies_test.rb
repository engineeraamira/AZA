require "application_system_test_case"

class CurrenciesTest < ApplicationSystemTestCase
  setup do
    @currency = currencies(:one)
  end

  test "visiting the index" do
    visit currencies_url
    assert_selector "h1", text: "Currencies"
  end

  test "creating a Currency" do
    visit currencies_url
    click_on "New Currency"

    fill_in "Code", with: @currency.code
    fill_in "Name", with: @currency.name
    check "Status" if @currency.status
    click_on "Create Currency"

    assert_text "Currency was successfully created"
    click_on "Back"
  end

  test "updating a Currency" do
    visit currencies_url
    click_on "Edit", match: :first

    fill_in "Code", with: @currency.code
    fill_in "Name", with: @currency.name
    check "Status" if @currency.status
    click_on "Update Currency"

    assert_text "Currency was successfully updated"
    click_on "Back"
  end

  test "destroying a Currency" do
    visit currencies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Currency was successfully destroyed"
  end
end
