module Admin
  class ReturnMethodsController < Admin::BaseController

    crudify :return_method,
            :title_attribute => 'method1', :xhr_paging => true

  end
end
