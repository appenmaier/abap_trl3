CLASS zcl_054906_rental DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES ty_vehicles TYPE TABLE OF REF TO zcl_054906_vehicle.

    DATA name TYPE string READ-ONLY.
    DATA vehicles TYPE ty_vehicles READ-ONLY.

    INTERFACES zif_054906_partner.

    METHODS constructor
      IMPORTING
        name TYPE string.

    METHODS add_vehicle
      IMPORTING
        vehicle TYPE REF TO zcl_054906_vehicle.

    "! Returns all transformed trucks of this rental
    "!
    "! @parameter trucks | the transformed trucks
    METHODS get_all_transformed_trucks
      RETURNING VALUE(trucks) TYPE z054906_trucks.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_054906_rental IMPLEMENTATION.

  METHOD add_vehicle.
    APPEND vehicle TO vehicles. " vehicles = VALUE #( BASE vehicles ( vehicle ) ).
  ENDMETHOD.

  METHOD constructor.
    me->name = name.
  ENDMETHOD.

  METHOD get_all_transformed_trucks.
    LOOP AT vehicles INTO DATA(vehicle).
      IF vehicle IS INSTANCE OF zcl_054906_truck.
        DATA(truck) = CAST zcl_054906_truck( vehicle ).
        IF truck->is_transformed = abap_true.
          APPEND truck TO trucks.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD zif_054906_partner~to_string.
    string = name && %_cr_lf.
    LOOP AT vehicles INTO DATA(vehicle).
      string &&= vehicle->to_string( ) && %_cr_lf.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
