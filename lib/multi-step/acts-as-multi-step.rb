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

      def form_steps_sanitized
        self.form_steps.collect { |s| s.to_s.parameterize }
      end
    end

    def completed
      "Completed"
    end

    def complete?
      step.eql? completed
    end

    def complete!
      update_attribute(:step, completed)
    end

    def current_step
      step || klass.form_steps_sanitized.first
    end

    def on?(step)
      current_step.eql?(step.to_s.parameterize)
    end

    def current_step?(step)
      current_step.eql?(step)
    end

    def first_step?
      current_step? klass.form_steps_sanitized.first
    end

    def last_step?
      current_step? klass.form_steps_sanitized.last
    end

    def next_step!
      if current_step.eql?(klass.form_steps_sanitized.last)
        complete!
      else
        update_attribute(:step, klass.form_steps_sanitized[klass.form_steps_sanitized.find_index(current_step) + 1])
      end
    end

    def previous_step!
      if !current_step.eql?(klass.form_steps_sanitized.first) && !complete?
        update_attribute(:step, klass.form_steps_sanitized[klass.form_steps_sanitized.find_index(current_step) - 1])
      end
    end

    private

    def klass
      self.class
    end

  end
end

ActiveRecord::Base.send :include, MultiStep::ActsAsMultiStep
