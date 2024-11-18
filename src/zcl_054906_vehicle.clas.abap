CLASS zcl_054906_vehicle DEFINITION
  PUBLIC ABSTRACT
  CREATE PUBLIC.

  " public abstract class Vehicle {
  "   private String make;
  "   private String model;
  "   private int speedInKmh;
  "   private static int numberOfVehicles;
  "   public Vehicle(String make, String model) {
  "     this.make = make;
  "     this.model = model;
  "     numberOfVehicles++;
  "   }
  "   public Vehicle(String make, String model, int speedInKmh) {
  "     this(make, model);
  "     this.speedInKmh = speedInKmh;
  "   }
  "   public String getMake() { return make; }...
  "   public int accelerate(int valueInKmh) throws InvalidValueException {
  "     if (valueInKmh <= 0) {
  "       throw new InvalidValueException("VALUE_IN_KMH", valueInKmh);
  "     }
  "     speedInKmh += valueInKmh;
  "     return speedInKmh;
  "   }
  "   public int brake(int valueInKmh) {
  "     speedInKmh -= valueInKmh;
  "     return speedInKmh;
  "   }
  "   public String toString() {
  "     return make + " " model + "(" + speedInKmh + "kmh )";
  "   }
  " }

  PUBLIC SECTION.
    DATA make         TYPE string READ-ONLY.
    DATA model        TYPE string READ-ONLY.
    DATA speed_in_kmh TYPE i      READ-ONLY.

    CLASS-DATA number_of_vehicles TYPE i READ-ONLY.

    METHODS constructor IMPORTING make         TYPE string
                                  model        TYPE string
                                  speed_in_kmh TYPE i OPTIONAL.

    METHODS accelerate FINAL IMPORTING value_in_kmh        TYPE i
                       RETURNING VALUE(speed_in_kmh) TYPE i
                       RAISING   zcx_054906_invalid_value.

    METHODS brake FINAL IMPORTING value_in_kmh        TYPE i
                  RETURNING VALUE(speed_in_kmh) TYPE i.

    METHODS to_string ABSTRACT RETURNING VALUE(string) TYPE string.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_054906_vehicle IMPLEMENTATION.
  METHOD constructor.
    me->make  = make.
    me->model = model.
    IF speed_in_kmh IS NOT INITIAL.
      me->speed_in_kmh = speed_in_kmh.
    ENDIF.
    number_of_vehicles += 1. " ADD 1 TO number_of_vehicles.
  ENDMETHOD.

  METHOD accelerate.
    IF value_in_kmh <= 0.
      RAISE EXCEPTION NEW zcx_054906_invalid_value( value     = |{ value_in_kmh SIGN = LEFT }| " CONV #( value_in_kmh )
                                                    attribute = 'VALUE_IN_KMH' ).
    ENDIF.

    me->speed_in_kmh += value_in_kmh.
    speed_in_kmh = me->speed_in_kmh. " RETURN me->speed_in_kmh.
  ENDMETHOD.

  METHOD brake.
    me->speed_in_kmh -= value_in_kmh.
    speed_in_kmh = me->speed_in_kmh. " RETURN me->speed_in_kmh.
  ENDMETHOD.
ENDCLASS.
