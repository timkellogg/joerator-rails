module CoffeeshopsHelper
  
  def calculate_stars(coffeeshop)
    output = ""
    total = coffeeshop.overall_average

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
end
