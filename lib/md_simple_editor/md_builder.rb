# frozen_string_literal: true

class MdBuilder
  attr_accessor :preview_panel, :toolbar, :button_group, :button, :preview_button

  def initialize(options = {})
    self.button = options[:button] || 'btn-outline-secondary btn-sm'
    self.button_group = options[:button_group]
    self.toolbar = options[:toolbar]
    self.preview_button = options[:preview_button] || 'btn-primary'
    self.preview_panel = options[:preview_panel]
  end
end
