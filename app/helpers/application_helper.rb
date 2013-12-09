module ApplicationHelper
  def show_alert(alert)
    if alert
      raw "<div class='alert alert-error'>
            <button type='button' class='close' data-dismiss='alert'>×</button>
            <p id='alert'>#{alert}</p>
           </div>" 
    end
  end

  def show_notice(notice)
    if notice
      raw "<div class='alert alert-success'>
            <button type='button' class='close' data-dismiss='alert'>×</button>
            <p id='notice'>#{notice}</p>
           </div>"
    end
  end
end
