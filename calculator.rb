Shoes.app :title => "Zoltan's Calculator", :width => 180, :height => 300, do
  background "#388E8E".."#F90",
  :scroll => false
  stack :margin => 20 do
    @output = edit_line width: 120
    
    flow :width => "120px", do
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

      button "\u221a" do
        square_root
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
  def eval_expression
    @input = eval(@input).to_s
    @output.text = @input
  end

  def square_root
    @input = eval(@input)
    @input = Math.sqrt(@input)
    @output.text = @input
  end
  
end
