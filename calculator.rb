Shoes.app :title => "Zoltan's Calculator", :width => 200, :height => 300, do
  background "#388E8E".."#F90",
  :scroll => false
  stack :margin => 20 do
    @output = edit_line width: 140
    
    flow :width => "150", do
      %W(9 8 7 6 5 4 3 2 1 0 + - * \u00F7 = C 2\u207F \u221A log\u2082).each do |op|      
        button op do         
          case op
            when ('0'..'9')
              append(op + ".0") 
            when "="
              eval_expression
            when "C"
              clear_expression
            when "\u00F7"
              append "/"
            when "2\u207F"
              power_of_two
            when "\u221A" 
              square_root
            when "log\u2082"
              log_base_2
            else
              append op
          end
        end
      end
      

    end
  end
  

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

  # Stick a string on the end of our input
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
    @input = @input.to_s
    @output.text = @input
  end

  def log_base_2
    @input = eval(@input)
    @input = Math.log2(@input)
    @input = @input.to_s
    @output.text = @input
  end
  
end
