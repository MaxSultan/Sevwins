class Api::UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]

    def create
        @user = User.create(user_params)
        case @user.timezone
        when "AST"
            Time.zone = "America/Halifax"
        when "EST"
            Time.zone = "America/New_York"
        when "CST"
            Time.zone = "America/Chicago"
        when "MST"
            Time.zone = "America/Denver"
        when "PST"
            Time.zone = "America/Los_Angeles"
        when "ALST"
            Time.zone = "America/Juneau"
        when "HAST"
            Time.zone = "Pacific/Honolulu"
        end 
        if @user.save
            @user.schedules.create(
                active: true,
                name: "Weekly Goals",
                program: "1577400952751x443095658217689900", 
                start_date: "Monday",
                form: "form_goals",
                start_day_int: 0,
                weekly_count: 1,
                hour: 8,
                category: "Goals",
            )
            @user.schedules.create(
                active: true,
                name: "Daily Assesment",
                program: "1577400952751x443095658217689900",
                start_date: "Monday",
                form: "form_assess",
                start_day_int: 0,
                weekly_count: 7,
                hour: 12,
                category: "Assess",
            )
            @user.schedules.create(
                active: true,
                name: "Weekly Reflection",
                program: "1577400952751x443095658217689900",
                start_date: "Sunday",
                form: "form_reflect",
                start_day_int: 6,
                weekly_count: 1,
                hour: 20,
                category: "Reflect",
            )
            @user.goals.create(
               name: "Weekly Goals",
               topic: "1577401157757x608309369383979100",
               status:"Waiting" ,
               date: @user.date_of_next('Monday'),
            )
            days = %w(Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday)
            days.map do |day|  
                @user.goals.create(
                    name: "Daily Assesment",
                topic: "1577401196758x439688071809190660",
                status:"Waiting" ,
                date: @user.date_of_next(day),
            )
            end 
            @user.goals.create(
                name: "Weekly Reflection",
                topic: "1577401272534x606016218540235800",
                status:"Waiting" ,
                date: @user.date_of_next('Sunday'),
            )
            render json: @user
        else 
            render json: {errors: @user.errors, status: 422}
        end 
    end 

    def show
    end 

    def update
        @user.update(user_params)
        if @user.save
            render json: @user
        else 
            render json: {errors: @user.errors, status: 422}
        end 
    end 

    def destroy
        @user.destroy
        render json: @user
    end 

    private

    def user_params
        params.require(:user).permit(:full_name, :Organization, :timezone)
    end 

    def set_user
        @user = User.find(params[id])
    end 
end
