if defined?(Rails)	  
	begin
		require "rails/console/app"
        	require "rails/console/helpers"
        rescue LoadError => e
		require "console_app"
	        require "console_with_helpers"
        end
end

begin
	  require "awesome_print"
	    Pry.config.print = proc {|output, value| Pry::Helpers::BaseHelpers.stagger_output("=> #{value.ai}", output)}
rescue LoadError => err
	   warn "=> Unable to load awesome_print"
end
