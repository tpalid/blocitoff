class ReminderMailer < ApplicationMailer
   def item_expiring_tomorrow(user, item)
       @user = user
       @item = item
       
       mail(to: user.email, subject: "To Do List Task: '#{item.body}' expires tomorrow!")
   end
end
