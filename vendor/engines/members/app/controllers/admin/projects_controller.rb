module Admin
  class ProjectsController < Admin::BaseController

    crudify :project,
            :title_attribute => 'case_name', :xhr_paging => true

  end
end
