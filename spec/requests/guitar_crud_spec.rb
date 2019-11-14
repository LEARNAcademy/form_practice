require 'rails_helper'

RSpec.describe "GuitarCrud", type: :request do
  let!(:guitar){Guitar.create(model: "Fender", year: 1969)}

  it "should respond with a list of guitars" do
    get guitars_path
    guitars = JSON.parse(response.body)
    expect(guitars.first["model"]).to eq("Fender")
    expect(guitars.first["year"]).to eq(1969)
  end

  it "should create a guitar" do
    headers = { "ACCEPT" => "application/json" }
    body = { guitar: {
      year: 1962,
      model: 'Gibson'
    }}
    post guitars_path, params: body, headers: headers
    expect(response.status).to eq(201)
    parsed_response = JSON.parse(response.body)
    expect(parsed_response['year']).to eq(1962)
  end

  it "should show us errors without year" do
    headers = { "ACCEPT" => "application/json" }
    body = { guitar: {
      model: 'Gibson'
    }}
    post guitars_path, params: body, headers: headers
    expect(response.status).to eq(422)
    parsed_response = JSON.parse(response.body)
    expect(parsed_response.keys.include?("year")).to eq(true)
  end
end
