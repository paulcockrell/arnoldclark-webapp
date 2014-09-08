require 'spec_helper'

describe "Interact with Arnold Clark Image findertron 2000" do

  describe "Check layout of index page" do
    context "visit index page" do
      it "should have header with title, jumbobox, entry form box and gallery box" do
        visit(Home::IndexPage) do |page|
          expect(page.render_successfull?).to eq true
        end
      end
    end

    context "locate car images with valid details" do
      it "should update alert message with 'Loaded 12 of 12 images'" do
        visit(Home::IndexPage) do |page|
          page.search "SK61ZWG", "ARNBCF-U-18233"
          page.wait_until(30, "API call not returned within 30 seconds") do
            page.text.include? "Loaded 12 of 12 images"
          end
        end
      end
    end

    context "locate car images with invalid details" do
      it "should update alert message with 'Loaded 0 of 12 images'" do
        visit(Home::IndexPage) do |page|
          page.search "ABCD", "1234567890"
          page.wait_until(30, "API call not returned within 30 seconds") do
            page.text.include? "Loaded 0 of 12 images"
          end
        end
      end
    end

  end
end
