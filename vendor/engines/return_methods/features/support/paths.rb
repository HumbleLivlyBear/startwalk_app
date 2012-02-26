module NavigationHelpers
  module Refinery
    module ReturnMethods
      def path_to(page_name)
        case page_name
        when /the list of return_methods/
          admin_return_methods_path

         when /the new return_method form/
          new_admin_return_method_path
        else
          nil
        end
      end
    end
  end
end
