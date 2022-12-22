class TrashcansController < ApplicationController
    skip_before_action :check_user, only: [:index, :show]

    def index
        render json: Trashcan.all
    end

    def show
        trashcan = Trashcan.find(psrams[:id])
        render json:trashcan
    end

    def create
        trashcan = current_user.trashcans.create!(trashcan_params)
        render json: trashcan, status: :created
    end

    def update
        trashcan = current_user.trashcans.find(psrams[:id])
        trashcan.update!(trashcan_params)
        render json: trashcan, status: :accepted
    end

    def destroy
        trashcan = current_user.trashcans.find(psrams[:id])
        trashcan.destroy
        render json: {}
    end

    private

    def trashcan_params
        params.permit(:location, :user_id)
    end

end
