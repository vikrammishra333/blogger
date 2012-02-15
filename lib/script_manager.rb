# To change this template, choose Tools | Templates
# and open the template in the editor.

class ScriptManager
  
  def self.include_contrib_library library
    include_js_library library, :contrib
  end
  
  def self.include_local_library library
    include_js_library library, :local
  end
  
  def self.include_js_library library, type = :local
    Rails.logger.debug library.inspect
    if library.class == Array
      library.each do |l|
        include_js_library_individual l, type
      end
    else
      include_js_library_individual library, type
    end
  end
  
  
  
  def self.get_libraries
    
    return @@js_includes
    
  end
  
  private 
  @@js_includes = []
  
  def self.include_js_library_individual library, type
    case type
    when :local
      if library.class == Symbol
        @@js_includes << library.to_s + ".js"
      else
        @@js_includes << library
      end
    when :contrib
      @@js_includes << "contrib/" + @@libraries[library]
    end
  end
  
  @@libraries = {
    :date               => "date.js",
    :ajax_submit        => "ajax.submit.js",
    :jquery_combobox    => "jquery.combobox.js",
    :ccvalidate         => "ccvalidate.js",
    :date_format        => "date_format.js",
    :daterangepicker    => "daterangepicker.jQuery.js",
    :documentation      => "documentation.js",
    :fullcalendar       => "fullcalendar.min.js",
    :date_range_slider  => "jQDateRangeSlider.js",
    :range_slider       => "jQRangeSlider.js",
    :multi_date_picker  => "jquery-ui.multidatespicker.js",
    :form               => "jquery.form.js",
    :rating             => "jquery.rating.js",
    :time_picker        => "jquery.timePicker-custom.min.js",
    :jquery_datepicker  => "jquery.ui.datepicker.js",
    :validate           => "jquery.validate.js",
    :validate_additional => "jquery.validate.additional-methods.js",
    :jquery_form        => "jquery_form.js",
    :select_ui_slider   => "selectToUISlider.jQuery.js",
    :fancybox           => "fancybox/jquery.fancybox-1.3.4.js",
    :fancybox_wheel     => "fancybox/jquery.mousewheel-3.0.4.pack.js",
    :clock              => "clock.js",
    :easyPhotoSlider    => "easyPhotoSlider.js",
    :data_table         => "jquery.dataTables.js",
    :selectbox          => "jquery.selectbox-0.5.js",
    :map                => "jquery.ui.map.full.min.js"
  }
  
end
