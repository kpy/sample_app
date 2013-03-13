require 'spec_helper'

describe "Appointment pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "appointment creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create an appointment" do
        expect { click_button "Submit" }.not_to change(Appointment, :count)
      end

      describe "error messages" do
        before { click_button "Submit" }
        it { should have_content('error') } 
      end
    end

    describe "with valid information" do

      before do
      	fill_in "starttime",	  with: Time.now + 1.hour
      	fill_in "endtime",		  with: Time.now + 2.hours
        fill_in "place",        with: "New place"
        fill_in "title",        with: "New Appointment"
        fill_in "description",  with: "Lorem Ipsum"
        fill_in "ispublic",     with: false
      end

      it "should create an appointment" do
        expect { click_button "Submit" }.to change(Appointment, :count).by(1)
      end
    end
  end

  describe "appointment destruction" do
    before { FactoryGirl.create(:appointment, owner_id: user.id) }

    describe "as correct user" do
      before { visit root_path }

      it "should delete an appointment" do
        expect { click_link "delete" }.to change(Appointment, :count).by(-1)
      end
    end
  end
end