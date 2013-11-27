module ApplicationHelper
  def show_alert(alert)
    if alert
      "<p class='alert'>#{alert}</p>"
    end
  end

  def show_notice(notice)
    if notice
      "<p class='notice'>#{notice}</p>"
    end
  end
end
