require 'spec_helper'
#require_relative '../../lib/helpers'
include Helpers

describe "Interact with Arnold Clark Image findertron 2000" do

  describe "Check layout of index page" do
    context "visit index page" do
      it "should have header with title, jumbobox, entry form box and gallery box" do
        visit(IndexPage) do |page|
          expect(page.render_successfull?).to eq true
        end
      end
    end

    # context "sign in to metlife with invalid user account" do
    #   it "should display a invalid email or password message to the user" do
    #     visit(MetLife::User::SignInPage) do |page|
    #       page.login "@#{user.email}", user.password
    #       expect(page.text).to include "Invalid email or password"
    #     end
    #   end
    # end

    # context "sign in to metlife with valid user account" do
    #   it "should display a welcome message to the user" do
    #     visit(MetLife::User::SignInPage) do |page|
    #       page.login user.email, user.password
    #       expect(page.text).to include "Welcome #{user.email}"
    #     end
    #   end
    # end

    # context "compare homepage screen with standard homepage screen image" do
    #   it "the screens should be no more than 5% different" do
    #     visit(MetLife::User::SignInPage).login user.email, user.password
    #     on(MetLife::User::DashboardPage) do |page|
    #       expect(compare(page)).to be <= IMAGE_DIFF_MAX
    #     end
    #   end
    # end

  end
end
