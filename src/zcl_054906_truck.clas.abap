CLASS zcl_054906_truck DEFINITION
  PUBLIC
  INHERITING FROM zcl_054906_vehicle FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    DATA cargo_in_tons  TYPE i          READ-ONLY.
    DATA is_transformed TYPE c LENGTH 1 READ-ONLY. " DATA is_transformed TYPE c LENGTH 1 READ-ONLY.

    METHODS constructor
      IMPORTING make          TYPE string
                model         TYPE string
                speed_in_kmh  TYPE i OPTIONAL
                cargo_in_tons TYPE i.

    METHODS transform.

    METHODS to_string REDEFINITION.

  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_054906_truck IMPLEMENTATION.
  METHOD constructor.
    super->constructor( make         = make
                        model        = model
                        speed_in_kmh = speed_in_kmh ).

    me->cargo_in_tons = cargo_in_tons.
  ENDMETHOD.

  METHOD transform.
    IF is_transformed IS INITIAL.
      is_transformed = abap_true.
    ELSE.
      is_transformed = abap_false.
    ENDIF.
  ENDMETHOD.

  METHOD to_string.
    string = |{ make } { model }, Frachtkapazität: { cargo_in_tons }t, Form: { COND #( WHEN is_transformed = abap_true
                                                                                       THEN 'Autobot'
                                                                                       ELSE 'LKW' ) }|.
  ENDMETHOD.
ENDCLASS.
