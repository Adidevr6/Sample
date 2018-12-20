module ApplicationHelper
  def alert_class(type)
    type = :danger if [:error, :alert].include?(type.to_sym)
    type = :success if [:notice].include?(type.to_sym)
    "alert-#{type}"
  end
end
