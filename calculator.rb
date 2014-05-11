Shoes.app :title => "Zoltan's Calculator", :width => 240, :height => 240, do
  background "#388E8E".."#F90"
  stack :margin => 20 do
    @output = edit_line width: 120
    
    flow :width => "120px" , do
      %w(0 1 2 3 4 5 6 7 8 9 + / * -).each do |op|      
        button op do         
          append op
        end
      end
      
      button "=" do
        eval_expression
      end

      button "C" do
        clear_expression
      end

      button "2\u207f" do
        power_of_two
      end

    end
    
  end
  
  # Stick a string on the end of our input

  def power_of_two
    @input = eval(@input)
    @input = 2**@input
    @input = @input.to_s
    @output.text = @input
  end

  def clear_expression
    @input = eval(@input)
    @input = nil
    @output.text = @input
  end  

  def append(s)
    if @input.nil?
      @input = ""
    end
    @input += s
    @output.text = @input
  end
  
  # Evaluate the input we've got so far
  #
  def eval_expression
    @input = eval(@input).to_s
    @output.text = @input
  end

  # 
  
end
