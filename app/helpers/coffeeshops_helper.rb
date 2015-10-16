module CoffeeshopsHelper
  def calculate_stars(coffeeshop)
    output = ""
    total = coffeeshop.overall_average

    coffeeshop.overall_average.ceil.times do |n| 
      if total >= 1
        output += content_tag(:i, "<%= fa_icon 'star' %>")
        total -= 1
      else  
        output += content_tag(:i, "<%= fa_icon 'star-half' %>")
      end
    end
    
    return output
  end

end

# module CoffeeshopsHelper
#   def calculate_stars(coffeeshop)
#     output = ""
#     total = coffeeshop.overall_average

#     coffeeshop.overall_average.ceil.times do |n| 
#       if total >= 1
#         output.concat("<%= fa_icon 'star' %>")
#         total -= 1
#       else  
#         output.concat("<%= fa_icon 'star-half %>")
#       end
#     end
    
#     return output.concat("</span>")
#   end
# end
