CLASS zcl_054906_demo_01 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_054906_demo_01 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA text TYPE string. " Deklaration

    text = 'Hello World'. " Wertzuweisung
    out->write( text ). " Ausgabe
  ENDMETHOD.
ENDCLASS.
