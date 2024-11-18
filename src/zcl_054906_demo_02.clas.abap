CLASS zcl_054906_demo_02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_054906_demo_02 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    " Wichtige ABAP/Dictionary-Typen
    DATA i1 TYPE i. " Bsp. 42 (int4)
    DATA p1 TYPE p LENGTH 16 DECIMALS 2. " Bsp. '486.99' (dec, 31, 2)
    DATA c7 TYPE c LENGTH 7. " Bsp. 'ABCDEFG' (char, 7)
    DATA n6 TYPE n LENGTH 6. " Bsp. '054906' (numc, 6)
    DATA d1 TYPE d. " Bsp. '20241114' (dats)
    DATA t1 TYPE t. " Bsp. '100640' (tims)

    " Deklaration
    DATA carrier_id TYPE c LENGTH 3. " per ABAP Standardtyp
    DATA carrier_id2 TYPE /dmo/carrier_id. " per Datenelement

    " Wertzuweisung
    DATA connection_id TYPE /dmo/connection_id VALUE '0400'. " statische Vorbelegung
    carrier_id = 'LH'. " Zuweisungsoperator
    DATA(flight_date) = CONV d( '20241115' ). " Inlinedeklaration

    " Typumwandlung
    i1 = '5.55'.
    p1 = 5.
    n6 = 54906.

    out->write( i1 ).
    out->write( p1 ).
    out->write( n6 ).
  ENDMETHOD.

ENDCLASS.
