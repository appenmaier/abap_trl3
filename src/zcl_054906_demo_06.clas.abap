CLASS zcl_054906_demo_06 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_054906_demo_06 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " Kopfgesteuerte Schleife
    WHILE sy-index <= 10.
      out->write( sy-index ).
    ENDWHILE.

    " Zählschleife
    DO 10 TIMES.
      out->write( sy-index ).
    ENDDO.

    " Endlosschleife
    DO.
      out->write( sy-index ).
      IF sy-index = 10.
        EXIT.
      ENDIF.
    ENDDO.

    " Systemfelder
    out->write( sy-mandt ).
    out->write( sy-uname ).
    out->write( sy-langu ).
    out->write( sy-datum ).
    out->write( cl_abap_context_info=>get_system_date( ) ).
    out->write( sy-datlo ).
    out->write( sy-uzeit ).
    out->write( cl_abap_context_info=>get_system_time( ) ).
    out->write( sy-timlo ).
    out->write( sy-opsys ).
    out->write( cl_abap_context_info=>get_user_time_zone( ) ).
  ENDMETHOD.
ENDCLASS.
