module Fastlane
  module Actions
    module SharedValues
      INSTALL_NPM_DEPENDENCIES_CUSTOM_VALUE = :INSTALL_NPM_DEPENDENCIES_CUSTOM_VALUE
    end

    class InstallNpmDependenciesAction < Action
      def self.run(params)
        sh("npm", "ci")
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
