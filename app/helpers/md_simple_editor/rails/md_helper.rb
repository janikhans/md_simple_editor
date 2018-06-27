# frozen_string_literal: true

module MdSimpleEditor
  module Rails
    module MdHelper
      FontAwesome::Rails::IconHelper

      def md_simple_editor(klass = '')
        @md_builder = MdBuilder.new(klass)
        content_tag(:div, id: 'md-editor') do
          concat(toolbar)
          concat(tag(:br))
          concat(content_tag(:div, id: 'md-text') { yield })
          concat(preview_panel)
        end
      end

      private

      def header_tags
        headers = %w[H1 H2 H3 H4 H5]
        content_tag(:div, class: 'btn-group') do
          headers.each do |header|
            concat(header_button(header))
          end
        end
      end

      def link_and_image_tools
        tools = ['link', 'camera-retro']
        content_tag(:div, class: 'btn-group') do
          tools.each do |tool|
            concat(tool_button(tool))
          end
        end
      end

      def text_tools
        tools = [
          'italic', 'bold', 'list-ul', 'list-ol', 'indent',
          'underline', 'table', 'square', 'minus'
        ]
        content_tag(:div, class: 'btn-group') do
          tools.each do |tool|
            concat(tool_button(tool))
          end
        end
      end

      def tool_button(tool)
        button_tag(type: 'button', class: "#{@md_builder.default_class} md_#{tool}") do
          fa_icon(tool)
        end
      end

      def header_button(header)
        button_tag(type: 'button', class: "#{@md_builder.default_class} md_#{header.downcase}") do
          content_tag(:strong, header)
        end
      end

      def toolbar
        content_tag(:div, class: 'btn-toolbar', role: 'toolbar') do
          concat(header_tags)
          concat(text_tools)
          concat(link_and_image_tools)
          concat(button_tag('Preview', type: 'button', class: 'btn btn-primary preview_md'))
        end
      end

      def preview_panel
        content_tag(:div, class: 'preview-panel', hidden: true) do
          concat(content_tag(:div, 'Preview', class: 'alert alert-info'))
          concat(content_tag(:div, nil, id: 'md-preview', class: 'panel-body'))
        end
      end
    end
  end
end
