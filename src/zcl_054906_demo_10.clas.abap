CLASS zcl_054906_demo_10 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_054906_demo_10 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA rental  TYPE REF TO zcl_054906_rental.
    DATA vehicle TYPE REF TO zcl_054906_vehicle.
    DATA truck   TYPE REF TO zcl_054906_truck.

    rental = NEW #( 'Sixxt' ).

    vehicle = NEW zcl_054906_car( make         = 'Audi'
                                  model        = 'A4'
                                  speed_in_kmh = 50
                                  seats        = 5 ).
    rental->add_vehicle( vehicle ).

    vehicle = NEW zcl_054906_car( make  = 'Porsche'
                                  model = '911'
                                  seats = 2 ).
    rental->add_vehicle( vehicle ).

    truck = NEW zcl_054906_truck( make          = 'MAN'
                                  model         = 'TGX'
                                  speed_in_kmh  = 100
                                  cargo_in_tons = 40 ).
    truck->transform( ).
    rental->add_vehicle( truck ).

    out->write( rental ).
    out->write( rental->get_all_transformed_trucks( ) ).
    out->write( rental->zif_054906_partner~to_string( ) ).
  ENDMETHOD.
ENDCLASS.
