module NavigationHelpers
  module Refinery
    module Members
      def path_to(page_name)
        case page_name
        when /the list of members/
          admin_members_path

         when /the new member form/
          new_admin_member_path
        when /the list of projects/
          admin_projects_path

         when /the new project form/
          new_admin_project_path
        else
          nil
        end
      end
    end
  end
end
