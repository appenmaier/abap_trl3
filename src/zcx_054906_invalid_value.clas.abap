CLASS zcx_054906_invalid_value DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_t100_message.
    INTERFACES if_t100_dyn_msg.

    METHODS constructor
      IMPORTING !previous LIKE previous OPTIONAL
                !value    TYPE string
                attribute TYPE string.

    CONSTANTS:
      BEGIN OF co_invalid_value,
        msgid TYPE symsgid      VALUE 'Z054906',
        msgno TYPE symsgno      VALUE '000',
        attr1 TYPE scx_attrname VALUE 'VALUE',
        attr2 TYPE scx_attrname VALUE 'ATTRIBUTE',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF co_invalid_value.

    DATA value     TYPE string.
    DATA attribute TYPE string.

  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.


CLASS zcx_054906_invalid_value IMPLEMENTATION.
  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor( previous = previous ).
    me->value     = value.
    me->attribute = attribute.
    if_t100_message~t100key = co_invalid_value.
  ENDMETHOD.
ENDCLASS.
