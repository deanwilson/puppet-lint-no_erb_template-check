PuppetLint.new_check(:no_erb_template) do
  def check
    functions = ['template', 'inline_template']

    tokens.select { |t| t.type == :NAME and functions.include? t.value }.each do |function_token|
      next unless function_token.next_code_token.type == :LPAREN

      key_token = function_token.next_code_token.next_code_token

      # display the new, epp, version of the function
      original_function = function_token.value
      new_func = function_token.value.sub(/template/, 'epp')

      notify :warning, {
        message: "#{original_function}() function call. Use #{new_func}() instead",
        line:    key_token.line,
        column:  key_token.column,
      }
    end
  end
end
