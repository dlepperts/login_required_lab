class SecretsController < ApplicationController
    before_action :require_login

    def show
        @secret = Secret.find(params[:id])
    end

    def index
    end

    def create
        @secret = Secret.create(author_id: user_id)
    end

    private

    def require_login
        return head(:forbidden) unless session.includes? :user_id
    end
end
