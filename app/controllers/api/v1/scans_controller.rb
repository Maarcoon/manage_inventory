module Api
  module V1
    class ScansController < ApplicationController
      skip_before_action :verify_authenticity_token

      def create
        ScanService.new(params).send(params[:tipo])
        render json: {status: 'success'}
        rescue
          render json: {status: 'error', message: message}
      end
    end
  end
end
