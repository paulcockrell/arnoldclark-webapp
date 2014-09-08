require 'spec_helper'

describe "check main menu links go to correct pages" do

  let(:user) { Factory.build(:regular_user, email: "demo@mydriveadvisor.com", password: "password") }

  before do
    visit(MetLife::User::SignInPage) do |page|
      page.login user.email, user.password
    end
  end

  context "primary menu options connect to correct pages" do
    it "should go to dashboard page when you click on 'Dashboard' link" do
      visit(MetLife::User::DashboardPage) do |page|
        page.dashboard_element.click
        expect(on(MetLife::User::DashboardPage).text()).to include "Welcome #{user.email}"
      end
    end

    it "should go to behavior history page when you click on 'Behavior History' link" do
      visit(MetLife::User::DashboardPage) do |page|
        page.behavior_history_element.click
        expect(on(MetLife::User::BehaviorHistoryPage).text()).to include "Follow the My Journey Program to Safety"
      end
    end

    it "should go to trip records page when you click on 'Trip Records' link" do
      visit(MetLife::User::DashboardPage) do |page|
        page.trip_records_element.click
        expect(on(MetLife::User::TripRecordsPage).text()).to include "Explore Your Trips"
      end
    end
  end

  context "secondary menu options connect to correct pages" do
    it "should go to my account page when you click on 'My Account' link" do
      visit(MetLife::User::DashboardPage) do |page|
        page.my_account_element.click
        expect(on(MetLife::User::MyAccountPage).text()).to include "My Account"
      end
    end

    it "should go to help page when you click on 'Help' link" do
      visit(MetLife::User::DashboardPage) do |page|
        page.help_element.click
        expect(on(MetLife::User::HelpPage).text()).to include "Help Overview"
      end
    end

    it "should go to sign in page when you click on 'Logout' link" do
      visit(MetLife::User::DashboardPage) do |page|
        page.logout_element.click
        expect(on(MetLife::User::SignInPage).text()).to include "Customer Login"
      end
    end
  end
end
