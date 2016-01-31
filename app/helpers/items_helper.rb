module ItemsHelper
    def success_message
      complete = [
        "Great job!",
        "Give yourself a high five!",
        "Task marked as complete!",
        "You did it!",
        "Congrats!",
        "Good work!"
        ]
      quotes = [
  
      "What you do today can improve all your tomorrows. --Ralph Marston",
      
      "Don't watch the clock; do what it does. Keep going. --Sam Levenson",
      
      "Life is 10% what happens to you and 90% how you react to it. --Charles R. Swindoll",
      
      "Accept the challenges so that you can feel the exhilaration of victory. --George S. Patton",
      
      "It does not matter how slowly you go as long as you do not stop. --Confucius",
      
      "You are never too old to set another goal or to dream a new dream. --C. S. Lewis",
      
      "Always do your best. What you plant now, you will harvest later. --Og Mandino",
      
      "The secret of getting ahead is getting started. --Mark Twain",
      
      "Start where you are. Use what you have. Do what you can. --Arthur Ashe",
      
      "Our greatest weakness lies in giving up. The most certain way to succeed is always to try just one more time. --Thomas A. Edison",
      
      "The will to win, the desire to succeed, the urge to reach your full potential... these are the keys that will unlock the door to personal excellence. -Confucius",
      
      "Keep your eyes on the stars, and your feet on the ground. --Theodore Roosevelt",
      
      "Knowing is not enough; we must apply. Willing is not enough; we must do. --Johann Wolfgang von Goethe"
      ]
    "#{complete.sample}  #{quotes.sample}"
  end
end
