require 'spec_helper'

RSpec.describe LanguageCalculator do
  let(:response) { ApiCaller.new('goodviber').api_call }
  subject { LanguageCalculator.new(response) }

  describe "#call" do
    it "returns an array of most popular language/s" do
      expect(subject.call).to eq(["Ruby"])
    end

    it "calls the private methods" do
      expect(subject).to receive(:most_popular_language).once
      expect(subject).to receive(:results_hash).once
      subject.call
    end
  end

  describe "#results_hash" do
    context "with no response" do
      it "returns nil" do
        expect(subject.send(:results_hash, nil)).to eq nil
      end
    end

    context "with valid response" do
      it "returns a hash" do
        expect(subject.send(:results_hash, response)).to be_a(Hash)
      end
    end
  end

  describe "#most_popular_language" do
    context "with an empty hash" do
      it "returns nil" do
        expect(subject.send(:most_popular_language, {})).to eq nil
      end
    end

    context "with equal results" do
      it "returns both keys" do
        expect(subject.send(:most_popular_language, { "Ruby" => 95, "Java" => 95})).to eq ["Ruby", "Java"]
      end
    end
  end

end
