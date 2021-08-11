# frozen_string_literal: true

require "swagger_helper"

RSpec.describe "posts", type: :request do
  path "/posts.json" do
    parameter name: "include", in: :query, type: :string, required: false, description: "include"
    parameter name: "page", in: :query, type: :string, required: false, description: "page"
    parameter name: "per", in: :query, type: :string, required: false, description: "per"

    get("list posts") do
      response(200, "successful") do
        after do |example|
          example.metadata[:response][:content] = {
            "application/json" => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path "/posts/{id}.json" do
    parameter name: "id", in: :path, type: :string, description: "id"

    get("show post") do
      response(200, "successful") do
        let(:id) { "123" }

        after do |example|
          example.metadata[:response][:content] = {
            "application/json" => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path "/channels/{channel_id}.json" do
    parameter name: "channel_id", in: :path, type: :string, description: "channel_id"
    parameter name: "include", in: :query, type: :string, required: false, description: "include"
    parameter name: "page", in: :query, type: :string, required: false, description: "page"
    parameter name: "per", in: :query, type: :string, required: false, description: "per"

    get("list posts for a given channel") do
      response(200, "successful") do
        let(:channel_id) { "123" }

        after do |example|
          example.metadata[:response][:content] = {
            "application/json" => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
