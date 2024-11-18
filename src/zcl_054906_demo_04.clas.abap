CLASS zcl_054906_demo_04 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_054906_demo_04 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA text1 TYPE string VALUE 'Hello'.
    DATA text2 TYPE string VALUE 'World'.

    DATA now TYPE d VALUE '20241114'.

    DATA(text3) = |{ text1 } { text2 }, es ist der { now DATE = ISO }|.

    SPLIT text3 AT ',' INTO text1 text2.
    SPLIT text3 AT ' ' INTO TABLE DATA(tokens).

    out->write( text3 ).
    out->write( to_upper( text3 ) ).
    out->write( text1 ).
    out->write( text2 ).
    out->write( tokens ).

  ENDMETHOD.


ENDCLASS.
