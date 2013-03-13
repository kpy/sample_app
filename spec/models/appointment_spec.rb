require 'spec_helper'

describe Appointment do
  let(:user) { FactoryGirl.create(:user) }
  before { @appointment = user.appointments.build(starttime: 2.hours.ago,
  								   endtime: 1.hour.ago,
  								   title: "Test appointment",
  								   description: "Just a Test",
  								   place: "Somewhere") 
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

  describe "when starttime is not present" do
  	before { @appointment.starttime = nil }
  	it { should_not be_valid }
  end

  describe "when endtime is not present" do
  	before { @appointment.endtime = nil }
  	it { should_not be_valid }
  end

  describe "valid starttime and endtime" do
  	it "should not allow starttime after endtime" do
  	  aptmnt = FactoryGirl.create(:appointment, owner_id: user.id, starttime: 1.day.ago, endtime: 2.days.ago)
  	  !aptmnt.valid?
  	  aptmnt.errors[:endtime]
  	end
  end

  describe "with blank title" do
    before { @appointment.title = " " }
    it { should_not be_valid }
  end

  describe "with title that is too long" do
    before { @appointment.title = "a" * 141 }
    it { should_not be_valid }
  end

  describe "with description that is too long" do
    before { @appointment.description = "a" * 501 }
    it { should_not be_valid }
  end

  describe "with place that is too long" do
    before { @appointment.place = "a" * 251 }
    it { should_not be_valid }
  end
end
