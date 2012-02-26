require 'refinerycms-base'

module Refinery
  module ReturnMethods

    class << self
      attr_accessor :root
      def root
        @root ||= Pathname.new(File.expand_path('../../', __FILE__))
      end
    end

    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "return_methods"
          plugin.pathname = root
          plugin.activity = {
            :class => ReturnMethod,
            :title => 'method1'
          }
        end
      end
    end
  end
end
