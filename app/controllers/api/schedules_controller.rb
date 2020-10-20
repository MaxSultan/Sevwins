class Api::SchedulesController < ApplicationController
    before_action :set_user
    before_action :set_schedule, only: [:show,:update,:destroy]

    def index
        @schedules = @user.schedules
        render json: @schedules
    end 

    def create
        @schedule = @user.schedules.new(schedule_params)
        if @schedule.save
            render json: @schedule
        else 
            render json: {errors: @schedule.errors, status: 422}
        end 
    end 

    def show
    end 

    def update
        if @schedule.save
            render json: @schedule
        else 
            render json: {errors: @schedule.errors, status: 422}
        end 
    end

    def destroy
        @schedule.destroy
        render json: @schedule
    end 

    private

    def schedule_params
        params.require(:schedule).require(
            :active,
            :name,
            :program,
            :start_date,
            :form,
            :start_day_int,
            :weekly_count,
            :hour,
            :category,
            :type
        )
    end 

    def set_user
        @user = User.find(params[user_id])
    end

    def set_schedule
        @schedule = @user.schedules.find(params[id])
    end 
end
