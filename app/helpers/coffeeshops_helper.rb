module CoffeeshopsHelper

  # Calculates the number of starts/half starts to print out
  # Based upon rating of coffeeshop
  def calculate_stars(coffeeshop)
    output = ""
    total = coffeeshop.overall_average

    return output if total < 1

    coffeeshop.overall_average.ceil.times do |n|
      if total >= 1
        output += content_tag(:i, "", class: "fa fa-star")
        total -= 1
      else
        output += content_tag(:i, "", class: "fa fa-star-half")
      end
    end
    return output
  end

  # Checks if a user has marked a coffeeshop as a favorite
  def favorited?(user, coffeeshop)
    coffeeshop.users.each do |coffeeshop_user|
      return true if coffeeshop_user == user
    end
    return false
  end
end
