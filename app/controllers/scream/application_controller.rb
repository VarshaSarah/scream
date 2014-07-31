module Scream
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :check_headers

    private

    def check_headers
      response.headers.delete("X-Frame-Options")
    end
  end
end
