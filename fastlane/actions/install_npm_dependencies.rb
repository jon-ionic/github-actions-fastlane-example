module Fastlane
  module Actions
    module SharedValues
      INSTALL_NPM_DEPENDENCIES_CUSTOM_VALUE = :INSTALL_NPM_DEPENDENCIES_CUSTOM_VALUE
    end

    class InstallNpmDependenciesAction < Action
      def self.run(params)
        begin
          sh("npm", "ci")
        rescue StandardError
          UI.important "Failed to run `npm ci`, falling back to `npm install`"
          sh("npm", "install")
        end
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        'installs dependencies using npm'
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end
