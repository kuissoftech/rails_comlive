module MeasurementsHelper
  def options_for_property(app)
    {
        'Custom Units' => app.custom_units.map(&:property),
        'Global Units' => Unitwise::Atom.all.uniq.map {|x| "#{x.property}"}.uniq
    }
  end

  def uoms_for_property(property)
    return [] if property.nil?
    uoms = Unitwise::Atom.all.select{|a| a.property == property }.map {|i| ["#{i.to_s(:names)} (#{i.to_s(:primary_code)})",i.to_s(:primary_code)] }
    custom_units = CustomUnit.where(property: property)
    uoms += custom_units.map{|u| ["#{u.property} (#{u.uom})", u.uom] } if custom_units.any?
    return uoms
  end
end
