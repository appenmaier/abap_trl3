CLASS zcl_054906_demo_05 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_054906_demo_05 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA flight_date TYPE /dmo/flight_date VALUE '20241115'.
    DATA carrier_id  TYPE /dmo/carrier_id  VALUE 'LH'.

    flight_date = 0. " flight_date = '00000000'. CLEAR flight_date.
    carrier_id = ''. " carrier_id = '   '. carrier_id = '           '.

    " Verzweigungen
    " Vergleichsoperatoren: >, >=, <, <=, <>, =
    " Logische Operatoren: AND, OR, NOT
    " Spezielle Operatoren: IS (NOT) INITAL, BETWEEN...AND
    IF NOT ( flight_date BETWEEN '20240101' AND '20241231' ).
      out->write( 'Flug nicht in 2024' ).
    ELSEIF carrier_id = 'LH' AND flight_date IS NOT INITIAL.
      out->write( 'Lufthansaflug mit Flugdatum' ).
    ELSE.
      out->write( 'alles andere' ).
    ENDIF.

    carrier_id = 'LH'.

    DATA(text) = COND #( WHEN carrier_id IS INITIAL  THEN 'Carrier id is initial'
                         WHEN flight_date IS INITIAL THEN 'Flight Date is initial'
                         ELSE                             'alles andere' ).
    out->write( text ).

    " Fallunterscheidungen
    CASE carrier_id.
      WHEN 'LH' OR 'lh' OR 'lH' OR 'Lh'.
        out->write( 'Lufthansa' ).
      WHEN 'BA' OR 'ba' OR 'bA' OR 'Ba'.
        out->write( 'British Airways' ).
      WHEN OTHERS.
        out->write( carrier_id ).
    ENDCASE.

    text = SWITCH #( carrier_id
                     WHEN 'LH' OR 'lh' THEN 'Lufthansa'
                     WHEN 'BA' OR 'ba' THEN 'British Airways'
                     ELSE                   carrier_id ).

    out->write( text ).
  ENDMETHOD.
ENDCLASS.
