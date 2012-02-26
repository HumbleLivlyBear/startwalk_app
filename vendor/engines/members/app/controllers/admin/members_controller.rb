module Admin
  class MembersController < Admin::BaseController

    crudify :member,
            :title_attribute => 'member_name', :xhr_paging => true

  end
end
