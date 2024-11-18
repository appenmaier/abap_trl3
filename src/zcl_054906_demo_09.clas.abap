CLASS zcl_054906_demo_09 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_054906_demo_09 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA vehicle  TYPE REF TO zcl_054906_vehicle. " Vehicle vehicle;
    DATA vehicles TYPE TABLE OF REF TO zcl_054906_vehicle.                              " List<Vehicle> vehicles = new ArrayList<>();                              " List<Vehicle> vehicles = new ArrayList<>();

    vehicle = NEW zcl_054906_car( make         = 'Audi'
                                  model        = 'A4'
                                  speed_in_kmh = 50
                                  seats        = 5 ). " vehicle = new Car("Audi", "A4", 50, 5);
    APPEND vehicle TO vehicles. " vehicles.add(vehicle);

    vehicle = NEW zcl_054906_car( make  = 'Porsche'
                                  model = '911'
                                  seats = 2 ).
    APPEND vehicle TO vehicles.

    vehicle = NEW zcl_054906_truck( make          = 'MAN'
                                    model         = 'TGX'
                                    speed_in_kmh  = 100
                                    cargo_in_tons = 40 ).
    APPEND vehicle TO vehicles.

    LOOP AT vehicles INTO vehicle. " for (Vehicle vehicle : vehicles) {...}
      out->write( vehicle->to_string( ) ). " System.out.println(vehicle.toString());
      TRY.
          out->write( vehicle->accelerate( -50 ) ).
        CATCH zcx_054906_invalid_value INTO FINAL(x).
          out->write( x->get_text( ) ).
      ENDTRY. " System.out.println(vehicle.accelerate(50));
      out->write( vehicle->model ). " System.out.println(vehicle.getModel());
      IF vehicle IS INSTANCE OF zcl_054906_car.
        FINAL(car) = CAST zcl_054906_car( vehicle ). " Car car = (Car) vehicle;
        car->do_a_turbo_boost( ).
      ENDIF.
      IF vehicle IS INSTANCE OF zcl_054906_truck.
        FINAL(truck) = CAST zcl_054906_truck( vehicle ).
        truck->transform( ).
      ENDIF.
    ENDLOOP.

    out->write( zcl_054906_vehicle=>number_of_vehicles ). " System.out.println(Vehicle.getNumberOfVehicles());

    out->write( vehicles ).
  ENDMETHOD.
ENDCLASS.
