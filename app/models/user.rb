class User < ApplicationRecord
    has_many :schedules
    has_many :goals

    def date_of_next(day)
      date  = DateTime.parse(day)
      delta = date > Date.today ? 0 : 7
      date + delta
    end

    def generate_schedules
        @user.schedules.new(
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
        @user.schedules.new(
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
        @user.schedules.new(
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
      end
end
