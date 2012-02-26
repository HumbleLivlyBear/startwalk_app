if defined?(User)
  User.all.each do |user|
    if user.plugins.where(:name => 'return_methods').blank?
      user.plugins.create(:name => 'return_methods',
                          :position => (user.plugins.maximum(:position) || -1) +1)
    end
  end
end

if defined?(Page)
  page = Page.create(
    :title => 'Return Methods',
    :link_url => '/return_methods',
    :deletable => false,
    :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
    :menu_match => '^/return_methods(\/|\/.+?|)$'
  )
  Page.default_parts.each do |default_page_part|
    page.parts.create(:title => default_page_part, :body => nil)
  end
end