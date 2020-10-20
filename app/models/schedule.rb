class Schedule < ApplicationRecord
  belongs_to :user

  def generate_schedule
    @user = User.find(params[id])
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
      type: "custom.sw_prgm_topic"
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
      type: "custom.sw_prgm_topic"
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
      type: "custom.sw_prgm_topic"
    )
  end
end
