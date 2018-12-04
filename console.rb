require('pry')
require_relative('models/property_tracker')


    property1 = PropertyTracker.new({
      'address' => "26 Newfields Crescent, Dunfermline",
      'value' => '£200,000',
      'bedrooms' => '4',
      'year_built' => '1984'
      })

    property2 = PropertyTracker.new({
      'address' => "89 High Street, Edinburgh",
      'value' => '£4,000,000',
      'bedrooms' => '6',
      'year_built' => '1876'
      })
    property3 = PropertyTracker.new({
      'address' => "26 Princess Street, Innerleithen",
      'value' => '£40,000',
      'bedrooms' => '2',
      'year_built' => '1926'
      })


      property1.save()
      property2.save()
      property3.save()


      properties = PropertyTracker.all()

      # property2.delete()
      # property1.value = '£150,000'
      # property1.update
      p PropertyTracker.find_id(57)
      binding.pry

      nil
