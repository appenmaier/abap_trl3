CLASS zcl_054906_demo_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_054906_demo_03 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA result TYPE i.
    DATA result_p TYPE p LENGTH 16 DECIMALS 4.

    " Mathematische Operatoren
    result = 5 + 3.
    out->write( result ).
    result = 5 - 3.
    out->write( result ).
    result = 5 * 3.
    out->write( result ).
    result_p = 5 / 3.
    out->write( result_p ).
    result = 5 ** 3.
    out->write( result ).

    " Ganzzahlige Division
    result = 5 DIV 3.
    out->write( result ).
    out->write( result ).

    " Inkrementieren / Dekrementieren
    result = result + 1.
    result -= 1.

    " Mathematische Funktionen
    out->write( sqrt( 5 ) ).
    out->write( round( val = '6274.7639' dec = 3 ) ).

  ENDMETHOD.
ENDCLASS.
