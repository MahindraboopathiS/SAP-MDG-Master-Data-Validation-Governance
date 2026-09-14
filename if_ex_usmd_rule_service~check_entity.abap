 METHOD if_ex_usmd_rule_service~check_entity.

    DATA: lr_model   TYPE REF TO if_usmd_app_context.
    DATA: go_tab_descr   TYPE REF TO cl_abap_tabledescr,
          go_struc_descr TYPE REF TO cl_abap_structdescr,
          lt_components  TYPE abap_component_tab.
    DATA: name_range TYPE RANGE OF zfi_mdg_valt-condition_tech.

    CALL METHOD cl_usmd_app_context=>get_context
      RECEIVING
        eo_context = lr_model.
    IF lr_model IS BOUND.
      CALL METHOD lr_model->get_attributes
        IMPORTING
          ev_crequest_type = DATA(lv_cr_type)
          ev_crequest_step = DATA(lv_cr_step).
    ENDIF.

    "Pre-Exception Handling To Get Valid Fields For it_data As not-valid entry entered in Condition Property
    go_tab_descr ?= cl_abap_tabledescr=>describe_by_data( it_data ).
    CHECK sy-subrc = 0.
    go_struc_descr ?= go_tab_descr->get_table_line_type( ). "Get the structure of your internal table
    lt_components  = go_struc_descr->get_components( ).
    REFRESH name_range.
    name_range = VALUE #( FOR wa IN lt_components ( sign = 'I' option = 'EQ' low = wa-name ) ).

    "Mandatory Check Working for FI : GL,CC,PC
    SELECT * FROM zfi_mdg_valt INTO TABLE (it_zfi_mdg_valderv)
      WHERE cr_type = _cr_type AND cr_step = _cr_step
      AND zmodule = '0G' AND property = 'M' AND active = 'X'.

    LOOP AT it_zfi_mdg_valderv INTO DATA(wa_val).
      LOOP AT it_data ASSIGNING FIELD-SYMBOL(<ls_data>).
        IF <ls_data> IS ASSIGNED.

          IF wa_val-condition_tech IS NOT INITIAL. "Check If Condition maintained or free of any condition
            IF  wa_val-condition_tech IN name_range.    "Preventive Action

              ASSIGN COMPONENT wa_val-condition_tech OF STRUCTURE <ls_data> TO FIELD-SYMBOL(<ls_con>).
              IF <ls_con> IS ASSIGNED AND <ls_con> IS NOT INITIAL.
                IF <ls_con> NE wa_val-condition_val.
                  CONTINUE.
                ENDIF.
                UNASSIGN <ls_con>.
              ENDIF.

            ELSE.
              APPEND VALUE #( msgty = 'E' msgv1 = 'Please check entity name' msgv2 = wa_val-condition_tech   ) TO et_message.
              CONTINUE.
              "msgid = 'zfi_mdg_message'  msgno = 000
            ENDIF.
          ENDIF.

          ASSIGN COMPONENT wa_val-tech_name OF STRUCTURE <ls_data> TO FIELD-SYMBOL(<ls_value>).
          IF <ls_value> IS ASSIGNED AND <ls_value> IS INITIAL.
            APPEND VALUE #( msgid = wa_val-msgid msgty = wa_val-msgty
            msgno = wa_val-msgno msgv1 = wa_val-msgv1 msgv2 = wa_val-msgv2 ) TO et_message.
            UNASSIGN <ls_value>.
          ENDIF.
        ENDIF.

      ENDLOOP.
    ENDLOOP.


  ENDMETHOD.