module MultiStep
  module ActsAsMultiStep

    extend ActiveSupport::Concern

    included do
    end

    module ClassMethods
      def multi_step(steps = [], options = {})
        cattr_accessor :form_steps
        self.form_steps = steps
      end
    end

  end
end

ActiveRecord::Base.send :include, MultiStep::ActsAsMultiStep
