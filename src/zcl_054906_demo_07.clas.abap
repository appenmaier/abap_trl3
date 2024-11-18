CLASS zcl_054906_demo_07 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_054906_demo_07 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " Deklaration einer Struktur

    DATA connection  TYPE z054906_flight_connection.
    " Deklaration einer internen Tabelle
    DATA connections TYPE z054906_flight_connections. " TYPE <Tabellentyp>
    DATA connection3 TYPE REF TO z054906_flight_connection.

    FIELD-SYMBOLS <connection4> TYPE z054906_flight_connection.

    " Befüllen und Kopieren von Strukturen
    connection = VALUE #( airport_from_id = 'FRA'
                          carrier_id      = 'LH'  ).
    " TODO: variable is assigned but never used (ABAP cleaner)
    FINAL(connection2) = CORRESPONDING z054906_flight_connection( connection ).

    " Zugriff auf Strukturkomponenten
    connection-connection_id = '0400'.
    connection-airport_to_id = 'JFK'.

    out->write( connection ).
    out->write( connection-connection_id ).

    " Befüllen einer internen Tabelle
    connections = VALUE #( ( carrier_id = 'LH' )
                           ( )
                           ( connection_id = '0400' airport_to_id = 'JFK' )
                           ( connection )
                           ( connection ) ).

    " Anfügen von Zeilen
    APPEND connection TO connections.
    connections = VALUE #( BASE connections
                           ( connection ) ).

    " Einfügen von Zeilen
    INSERT connection INTO connections INDEX 2.

    " Lesen genau einer Zeile
    TRY.
        connection = connections[ 30 ]. " per Index
        out->write( connection ).
      CATCH cx_sy_itab_line_not_found INTO FINAL(x).
        out->write( x->get_text( ) ).
    ENDTRY.

    IF line_exists( connections[ carrier_id    = 'LH'
                                 airport_to_id = 'XXX' ] ).
      connection = connections[ carrier_id    = 'LH'
                                airport_to_id = 'XXX' ]. " per Komponenten
      out->write( connection ).
    ELSE.
      out->write( 'itab line not found' ).
    ENDIF.

    " Lesen mehrerer Zeilen
    LOOP AT connections INTO connection WHERE carrier_id = 'LH'.
      out->write( |{ sy-tabix }: { connection-carrier_id } { connection-connection_id }| ).
    ENDLOOP.

    " Ändern einer Zeile
    connections[ 2 ]-connection_id = '0401'.

    " Ändern mehrerer Zeilen
    LOOP AT connections REFERENCE INTO connection3.
      connection3->airport_from_id = 'BER'.
    ENDLOOP.

    LOOP AT connections ASSIGNING <connection4>.
      <connection4>-airport_from_id = 'FRA'.
    ENDLOOP.

    " Sortieren
    SORT connections BY carrier_id DESCENDING
                        connection_id ASCENDING
                        airport_to_id DESCENDING.

    " Löschen
    DELETE connections WHERE connection_id IS INITIAL.
  ENDMETHOD.
ENDCLASS.
