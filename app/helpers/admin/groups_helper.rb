module Admin::GroupsHelper

  def time_to_s(time)
    time.strftime("%l:%M")
  end

  def arr_to_s(array)
    array.join(", ")
  end
end
