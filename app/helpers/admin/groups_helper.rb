module Admin::GroupsHelper

  def time_to_s(time)
    time.strftime("%l:%M")
  end

  def date_to_s(date)
    date.strftime("%B %d, %Y")
  end

  def arr_to_s(array)
    array.join(", ")
  end
end
