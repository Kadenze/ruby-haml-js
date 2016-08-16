module RubyHamlJs
  class Engine < Rails::Engine
    initializer "ruby-hamljs.configure_rails_initialization", :after => 'sprockets.environment', :group => :all do |app|
      require 'ruby-haml-js/template'
      Sprockets.module_eval do
        const_get(:Deprecation).silence do
          register_engine '.hamljs', ::RubyHamlJs::Template, mime_type: 'application/javascript', silence_deprecation: true
        end
      end
    end
  end
end

