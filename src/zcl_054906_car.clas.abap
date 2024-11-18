CLASS zcl_054906_car DEFINITION
  PUBLIC
  INHERITING FROM zcl_054906_vehicle FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    DATA seats TYPE i READ-ONLY.

    METHODS constructor
      IMPORTING make         TYPE string
                model        TYPE string
                speed_in_kmh TYPE i OPTIONAL
                seats        TYPE i.

    METHODS to_string REDEFINITION. " public String toString() {...}

    METHODS do_a_turbo_boost RETURNING VALUE(speed_in_kmh) TYPE i.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_054906_car IMPLEMENTATION.
  METHOD constructor.
    super->constructor( make         = make
                        model        = model
                        speed_in_kmh = speed_in_kmh ). " super(make, model, speedInKmh);
    me->seats = seats.
  ENDMETHOD.

  METHOD to_string.
    string = |{ make } { model } ({ speed_in_kmh } kmh) { seats } Sitzplätze|.
  ENDMETHOD.

  METHOD do_a_turbo_boost.
    me->speed_in_kmh *= 2.
  ENDMETHOD.

ENDCLASS.
