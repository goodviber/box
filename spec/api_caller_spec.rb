require 'spec_helper'

RSpec.describe ApiCaller do
  subject { ApiCaller.new('goodviber') }

  describe "#api_call" do
    context "with a valid username" do
      it "makes a successfull api call" do
        expect(subject.api_call.code).to be(200)
      end
    end

    context "with no username" do
      subject { ApiCaller.new('') }

      it "raises an error" do
        expect{subject.api_call}.to raise_error('Username not found')
      end
    end

  end
end
