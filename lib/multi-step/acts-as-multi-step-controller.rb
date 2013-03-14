module MultiStep
  module ActsAsMultiStepController

    extend ActiveSupport::Concern

    included do
    end

    module ClassMethods
      def multi_step
        puts "multi_step called"
      end
    end

    def index
      binding.pry
    end

    def completed
      "Completed"
    end

    private

    def klass
      self.class
    end

  end
end

ActiveSupport.on_load :action_controller do
  binding.pry
  include MultiStep::ActsAsMultiStepController
end
