CLASS zcl_054906_demo_08 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_054906_demo_08 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    " SELECT <Spalten>
    " FROM <Tabelle/View>
    " WHERE <Bedingung>

    DATA connection TYPE /dmo/connection.
    DATA connections TYPE TABLE OF /dmo/connection.
    DATA connections3 TYPE TABLE OF z054906_flight_connection.
    DATA carrier_id TYPE /dmo/carrier_id VALUE 'LH'.
    DATA connection_id TYPE /dmo/connection_id VALUE '0400'.

    " Lesen einer Zeile
    SELECT SINGLE FROM /dmo/connection
     FIELDS *
     WHERE carrier_id = @carrier_id AND connection_id = @connection_id
     INTO @connection.

    out->write( connection ).

    " Lesen mehrerer Zeilen
    SELECT FROM /dmo/connection
     FIELDS *
     WHERE carrier_id = @carrier_id
     INTO TABLE @connections.

    IF sy-subrc <> 0.
      out->write( |Nix gefunden| ).
    ENDIF.

    out->write( sy-dbcnt ).
    out->write( connections ).

    " Lesen mehrerer Zeilen in Form einer Schleife
    SELECT FROM /dmo/connection
     FIELDS *
     WHERE carrier_id = @carrier_id
     INTO @connection.
      APPEND connection TO connections.
    ENDSELECT.

    out->write( connections ).

    " Deklaration der Zielvariablen
    SELECT FROM /dmo/connection
     FIELDS airport_from_id, airport_to_id, distance
     WHERE carrier_id = @carrier_id
     INTO CORRESPONDING FIELDS OF TABLE @connections.

    out->write( connections ).

    SELECT FROM /dmo/connection
     FIELDS airport_from_id, airport_to_id, distance
     WHERE carrier_id = @carrier_id
     INTO TABLE @DATA(connections2).

    out->write( connections2 ).

    SELECT FROM /dmo/connection
     FIELDS carrier_id, connection_id, airport_from_id, airport_to_id
     WHERE carrier_id = @carrier_id
     INTO TABLE @connections3.

    out->write( connections3 ).

  ENDMETHOD.

ENDCLASS.
