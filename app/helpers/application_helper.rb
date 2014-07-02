module ApplicationHelper
  def messages_counter
    count = Contact.count
    
    if count > 0
      " <span class='badge'>#{count}</span>"
    end
  end
end
