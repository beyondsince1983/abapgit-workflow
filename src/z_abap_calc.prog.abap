*&---------------------------------------------------------------------*
*& Report  z_abap_calc
*& Changes made in Eclipse
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT z_abap_calc.

PARAMETERS: A_VAR TYPE CHAR10,
            B_VAR TYPE CHAR10,
            DD_VAR TYPE CHAR10 AS LISTBOX VISIBLE LENGTH 10.

DATA: OUTPUT_VAR TYPE CHAR10.

TYPE-POOLS: VRM.

DATA: NAME  TYPE VRM_ID,
      LIST  TYPE VRM_VALUES,
      VALUE LIKE LINE OF LIST.

AT SELECTION-SCREEN OUTPUT.

  NAME = 'DD_VAR'.
  VALUE-KEY = '1'.
  VALUE-TEXT = '+'.
  APPEND VALUE TO LIST.

  VALUE-KEY = '2'.
  VALUE-TEXT = '-'.
  APPEND VALUE TO LIST.

  VALUE-KEY = '3'.
  VALUE-TEXT = '*'.
  APPEND VALUE TO LIST.

  VALUE-KEY = '4'.
  VALUE-TEXT = '/'.
  APPEND VALUE TO LIST.

  CALL FUNCTION 'VRM_SET_VALUES' EXPORTING ID = NAME VALUES = LIST.

START-OF-SELECTION.

IF DD_VAR = '1'.
  OUTPUT_VAR = A_VAR + B_VAR.
  WRITE: 'CALCULATED VALUE IS : ', OUTPUT_VAR.

  ELSEIF DD_VAR = '2'.
  OUTPUT_VAR = A_VAR - B_VAR.
  WRITE: 'CALCULATED VALUE IS : ', OUTPUT_VAR.

  ELSEIF DD_VAR = '3'.
  OUTPUT_VAR = A_VAR * B_VAR.
  WRITE: 'CALCULATED VALUE IS : ', OUTPUT_VAR.

  ELSEIF DD_VAR = '4'.
  OUTPUT_VAR = A_VAR / B_VAR.
  WRITE: 'CALCULATED VALUE IS : ', OUTPUT_VAR.

  ELSE.
  WRITE: 'ONLY + - * / SIGNS ARE ALLOWED'.

ENDIF.
