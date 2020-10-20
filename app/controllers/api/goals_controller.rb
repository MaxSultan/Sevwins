class Api::GoalsController < ApplicationController
    before_action :set_user
    before_action :set_goal, only: [:show,:update,:destroy]

    def index
        @goals = @user.goals
        render json: @goals
    end 

    def create
        @goal = @user.schedules.new(goal_params)
        if @goal.save
            render json: @goal
        else 
            render json: {errors: @goal.errors, status: 422}
        end 
    end 

    def show
    end 

    def update
        if @goal.save
            render json: @goal
        else 
            render json: {errors: @goal.errors, status: 422}
        end 
    end

    def destroy
        @goal.destroy
        render json: @goal
    end 

    private

    def goal_params
        params.require(:goal).require(

        )
    end 

    def set_user
        @user = User.find(params["user_id"])
    end

    def set_goal
        @goal = @user.goals.find(params[id])
    end 
end
