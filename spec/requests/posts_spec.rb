# frozen_string_literal: true

require "swagger_helper"

RSpec.describe "posts", type: :request do
  path "/posts.json" do
    parameter name: "include", in: :query, type: :string, required: false, description: "Include related resources, e.g. `include=author` or `include=author,channel`"
    parameter name: "page", in: :query, type: :string, required: false, description: "Show a specific page (default: 1)"
    parameter name: "per", in: :query, type: :string, required: false, description: "Show more or less than #{Post.default_per_page} posts"

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

  path "/posts/{slug}.json" do
    parameter name: "slug", in: :path, type: :string, description: "E.g. `5099-i-don-t-know`"
    parameter name: "include", in: :query, type: :string, required: false, description: "Include related resources, e.g. `include=author` or `include=author,channel`"

    get("show post") do
      response(200, "successful") do
        let(:slug) { "5099-i-don-t-know" }

        after do |example|
          example.metadata[:response][:content] = {
            "application/json" => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(404, "not found") do
        let(:slug) { 1234 }
        run_test!
      end
    end
  end

  path "/posts/random.json" do
    get("show a random post") do
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

  path "/channels/{slug}.json" do
    parameter name: "slug", in: :path, type: :string, description: "E.g. `ruby`"
    parameter name: "include", in: :query, type: :string, required: false, description: "include related resources, e.g. `include=author` or `include=author,channel`"
    parameter name: "page", in: :query, type: :string, required: false, description: "Show a specific page (default: 1)"
    parameter name: "per", in: :query, type: :string, required: false, description: "Show more or less than #{Post.default_per_page} posts"

    get("list posts for a given channel") do
      response(200, "successful") do
        let(:slug) { "ruby" }

        after do |example|
          example.metadata[:response][:content] = {
            "application/json" => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(404, "not found") do
        let(:slug) { 1234 }
        run_test!
      end
    end
  end
end
