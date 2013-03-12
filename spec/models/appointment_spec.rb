require 'spec_helper'

describe Appointment do
  let(:user) { FactoryGirl.create(:user) }
  before { @appointment = user.appointments.build(starttime: 2.hour.ago,
  								   endtime: 1.hour.ago,
  								   title: "Test appointment",
  								   description: "Just a Test",
  								   place: "Somewhere",
  								   ispublic: false) 
  }

  subject { @appointment }

  it { should respond_to(:starttime) }
  it { should respond_to(:endtime) }
  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should respond_to(:place) }
  it { should respond_to(:owner_id) }
  it { should respond_to(:ispublic) }
  it { should respond_to(:user) }
  its(:user) { should == user }

  it { should be_valid }

  describe "accessible attributes" do
  	it "should not allow access to owner_id" do
  	  expect do
  	  	Appointment.new(owner_id: user.id)
  	  end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end

  describe "when owner_id is not present" do
  	before { @appointment.owner_id = nil }
  	it { should_not be_valid }
  end
end
