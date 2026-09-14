# Strengthening SAP MDG Validation: Business-Driven Master Data Rules | Enhancing Record Accuracy Through Structured Checks | Building Trusted & Consistent Enterprise Data

Validate master data entries against business rules to ensure they are accurate, complete, and consistent. 

![alt text](MahindraboopathiS--SAP-MDG-Master-Data-Validation-Governance.png)
<h5><font face="andale mono,times">Overview</font></h5>
<p><font face="andale mono,times">Working with SAP MDG (Master Data Governance) often means balancing two realities: robust governance and agile adaptability. One of the common we face during MDG implementation is managing field validations with user-friendly alerts.</font></p>
<p><font face="andale mono,times">Whether a field should be hidden, mandatory or optional often depends on multiple factors like CR type, entity, company code or user role etc. Traditionally, these validations are implemented via BRF+ expressions, Enhancements in feeder classes, Hard-coded logic in the UI layer/BAdIs.</font></p>
<h5><font face="andale mono,times">The Problem: Code Dependency in Field Validation</font></h5>
<p><font face="andale mono,times">MDG validations are crucial for maintaining clean and consistent master data. However, the standard methods come with limitations &amp; most teams rely on:</font></p>
<ul class="lia-list-style-type-square">
<li><font face="andale mono,times">Feeder class logic: Feeder class enhancements require ABAP expertise and testing cycles.</font></li>
<li><font face="andale mono,times">UI rule maintenance is scattered and often difficult to track.</font></li>
<li><font face="andale mono,times">BRF+ rules or hardcoded validations code: Every new business scenario (e.g. different behaviour based on company code or region) means new logic and testing.</font></li>
<li><font face="andale mono,times">No centralized view of how validations are controlled across the application.</font></li>
</ul>
<p><font face="andale mono,times">- While these are functional, they&rsquo;re rigid, developer-dependent, and non-scalable. This complexity makes it difficult for functional/ business teams to adapt validations quickly and every change creates a dependency on development teams reducing agility.</font></p>
<h5><font face="andale mono,times">Challenges: Too Much Code, Too Little Agility</font></h5>
<ul class="lia-list-style-type-square">
<li><font face="andale mono,times">Hide/Show fields based on Role UI logic&nbsp; is non-transparent.</font></li>
<li><font face="andale mono,times">Maintain field rules over time - Static logic -No visibility for business teams.</font></li>
<li><font face="andale mono,times">The key pain point: Every small validation change turns into a development cycle.</font></li>
</ul>
<p><font face="andale mono,times">- But what if we could avoid coding and development cycle every time specially for simple level properties or validations, yet still provide fully dynamic, context-sensitive field behaviour.</font></p>
<h5><font face="andale mono,times"><strong>Solution: </strong>Rule the <strong>Config-Driven Field Validation Framework </strong>[ All In One Place]</font></h5>
<p><font face="andale mono,times">To address these challenges, a custom configuration table was designed to serve as a central validation engine covers easy level validations. Field behaviour across various MDG entities and scenarios was defined through this table eliminating the need for code changes every time.</font></p>
<p><font face="andale mono,times">- These rules are consumed at runtime ensuring the UI responds dynamically based on master data context.</font></p>
<p><font face="andale mono,times">- <strong>Validation Types</strong> : M = Mandatory, O = Optional, H = Hidden, R = Read Only</font></p>
<p><font face="andale mono,times">- This table is maintained via a simple maintenance view or SM30 transaction/T-Code assigned to TMG accessible to key users or functional consultants.</font></p>

<!--<img align = "center"  src="https://github.com/nimi-soni/SAP-MDG-Dynamic-Validation/blob/main/MDG_Dynamic_Validation/MDG2.png">-->

<p><font face="andale mono,times">All this happens without modifying feeder classes or enhancing the UI every time.</font></p>
<h5><font face="andale mono,times">Benefits of This Approach</font></h5>
<ul class="lia-list-style-type-square">
<li><font face="andale mono,times">No More Coding: New validation rules don&rsquo;t require any ABAP changes at-least for simple validations.</font></li>
<li><font face="andale mono,times">Business Empowerment: Functional/Business teams can maintain rules via a user-friendly view.</font></li>
<li><font face="andale mono,times">Central Governance: One place to view and manage all field control rules along with by whom &amp; when it&rsquo;s added or changed.</font></li>
<li><font face="andale mono,times">Audit-friendly: clearly see why and when a rule applies.</font></li>
<li><font face="andale mono,times">No BRF+ overload: clean separation of decision logic.</font></li>
<li><font face="andale mono,times">Faster Change Cycles: No transports or regression testing required for every new validation rule.</font></li>
<li><font face="andale mono,times">Scalable to all MDG domains MDG &ndash; S,M,C (Supplier, Material, Customer)</font></li>
</ul>
<img align = "right" width="400" src="https://github.com/nimi-soni/SAP-MDG-Dynamic-Validation/blob/main/MDG_Dynamic_Validation/MDG.jpg">
<h5 align = "left"><font face="andale mono,times">Real Impact</font></h5>
<ul>
<li><font face="andale mono,times">After rollout: Reduced ~70% of validation-related change requests.</font></li>
<li><font face="andale mono,times">Built an enterprise-grade, reusable framework used across modules.</font></li>
<li><font face="andale mono,times">Delivered faster time-to-compliance for changing regulatory/market needs.</font></li>
<li><font face="andale mono,times">It's a shift from &ldquo;write code to validate&rdquo; ➝ to &ldquo;configure to adapt&rdquo;</font></li>
</ul>
<h5><font face="andale mono,times">How It Works: Plug-In Logic, Zero Enhancement for later changes</font></h5>
<ol class="lia-list-style-type-upper-roman">
<li><font face="andale mono,times">Custom Table is maintained in SM30 or Z/Y T-code (or via custom UI).</font></li>
<li><font face="andale mono,times">Lightweight enhancement logic is added once to retrieve rules based on runtime values.</font></li>
<li><font face="andale mono,times">The UI behaviour adjusts: field becomes hidden, read-only mandatory or optional.</font></li>
<li><font face="andale mono,times">No need to t<font size="3">ouch feeder classes again &amp; ever.</font></font></li>
</ol>
<h5><font face="andale mono,times" size="3">You can even combine this with:</font></h5>
<ul class="lia-list-style-type-square">
<li><font face="andale mono,times">Workflow context (field is mandatory only in approval steps)</font></li>
<li><font face="andale mono,times">User or Role-level personalization (validation based on user group)</font></li>
<li><font face="andale mono,times">For multiple conditions can add different Sr. No conditions. E.g. Department is mandatory for Company Code =  ‘0001’  & '0005', So Can add two records with different Sr. No.</font></li>    
</ul>
<h5><font face="andale mono,times"><strong>Requirement - For CR Type:&nbsp;ZCCT1P2:&nbsp;Create Cost Center with Hry. Assignments:</strong></font></h5>
<ol class="lia-list-style-type-upper-roman">
<li><font face="andale mono,times" size="3">&nbsp; &nbsp;Business Area to be hidden.</font></li>
<li><font face="andale mono,times" size="3">&nbsp; &nbsp;Profit Center is mandatory.</font></li>
<li><font face="andale mono,times" size="3">&nbsp; &nbsp;Department is mandatory for Company Code =&nbsp; &lsquo;0001&rsquo;</font></li>
<li><font face="andale mono,times" size="3">&nbsp; &nbsp;User Responsible is mandatory for cost center category = &lsquo;%&rsquo;.</font></li>
</ol>
<h5><font face="andale mono,times"><strong>Implementation</strong></font></h5>
<p><font face="andale mono,times"><img src="https://github.com/nimi-soni/SAP-MDG-Dynamic-Validation/blob/main/MDG_Dynamic_Validation/Nimii_0-1749533166874.png"></img></font></p>
<p align = "center"><font face="andale mono,times" size="2">[ Fig. 1.0. Table Contents ]</font></p>
<ul class="lia-list-style-type-square">
<li><font face="andale mono,times">ZCCT1P2: Create Cost Center with Hry. Assignments.</font></li>
<li><font face="andale mono,times">Step &lsquo;0&rsquo; defines Requestor Level.</font></li>
<li><font face="andale mono,times">Tech Property&nbsp; &amp; Conditional Tech-Property stores technical attributes.</font></li>
<li><font face="andale mono,times">Table also contains audit columns to track changes.</font></li>
</ul>
<ol>
<li>
<h5><font face="andale mono,times"><strong>BAdI: USMD_ACC_FLD_PROP_CUST_DEP_SET</strong></font></h5>
</li>
</ol>
<ul class="lia-list-style-type-square">
<li><font face="andale mono,times">EI: ZFI_ES_MDG_FLD_PROP</font></li>
<li><font face="andale mono,times">BAdI Implementation: ZFI_MDG_FLD_PROP</font></li>
<li><font face="andale mono,times">Class: ZCL_FI_MDG_FLD_PROP</font></li>
<li><font face="andale mono,times">Method: IF_EX_USMD_ACC_FLD_PROP_CDS~MODIFY_FLD_PROP_ATTR</font></li>
</ul>

```abap
METHOD if_ex_usmd_acc_fld_prop_cds~modify_fld_prop_attr.

    DATA:lr_model TYPE REF TO if_usmd_app_context.
    CALL METHOD cl_usmd_app_context=>get_context
      RECEIVING
        eo_context = lr_model.
    IF lr_model IS BOUND.
      CALL METHOD lr_model->get_attributes
        IMPORTING
          ev_crequest_type = DATA(lv_cr_type)
          ev_crequest_step = DATA(lv_cr_step).
    ENDIF.

    DATA: go_tab_descr   TYPE REF TO cl_abap_tabledescr,
          go_struc_descr TYPE REF TO cl_abap_structdescr,
          lt_components  TYPE abap_component_tab.
    DATA: name_range TYPE RANGE OF zfi_mdg_valt-condition_tech.

    "Pre-Exception Handling To Get Valid Fields For it_data As not-valid entry entered in Condition Property
    go_tab_descr ?= cl_abap_tabledescr=>describe_by_data( it_data ).
    CHECK sy-subrc = 0.
    go_struc_descr ?= go_tab_descr->get_table_line_type( ). "Get the structure of your internal table
    lt_components  = go_struc_descr->get_components( ).
    REFRESH name_range.
    name_range = VALUE #( FOR wa IN lt_components ( sign = 'I' option = 'EQ' low = wa-name ) ).

    "Check Mandatory(*)/Hide/Read Only/Optional Attribute Property
    SELECT * FROM zfi_mdg_valt INTO TABLE (it_mdg_val)
          WHERE cr_type = _cr_type AND cr_step = _cr_step AND entity_type = _entity
          AND zmodule = '0G' AND active = 'X'.
    IF sy-subrc = 0.

      LOOP AT ct_fld_prop ASSIGNING FIELD-SYMBOL(<fs_data_2>).
        ASSIGN COMPONENT 'USMD_FP' OF STRUCTURE <fs_data_2> TO FIELD-SYMBOL(<fs_fld_prop_2>).

        LOOP AT it_mdg_val INTO DATA(wa_val) WHERE entity_type = iv_entity. "Traverse Custom Defined Properties

          IF wa_val-condition_tech IS NOT INITIAL. "Check If Condition maintained or free of any condition
            IF  wa_val-condition_tech IN name_range.    "Preventive Action
              READ TABLE it_data ASSIGNING FIELD-SYMBOL(<fs_data_con>)
              WITH KEY (wa_val-condition_tech) = wa_val-condition_val.
              "Condition is not matching, continue with next iteration of properties of it_mdg_val
              IF sy-subrc NE 0.
                CONTINUE.
              ENDIF.
            ELSE.
              CONTINUE.   "Not Valid Condition Attribute/Property
            ENDIF.
          ENDIF.

          "Check for further tech property
          ASSIGN COMPONENT wa_val-tech_name OF STRUCTURE <fs_fld_prop_2> TO FIELD-SYMBOL(<ls_field_2>).
          IF <ls_field_2> IS ASSIGNED.
            <ls_field_2> = wa_val-property.
          ENDIF.
          UNASSIGN  <ls_field_2>.
        ENDLOOP.

        UNASSIGN <fs_fld_prop_2>.
      ENDLOOP.
    ENDIF.

  ENDMETHOD.
```

<h5><font face="andale mono,times">&nbsp; &nbsp; &nbsp; &nbsp;2.&nbsp; BAdI: USMD_RULE_SERVICE</font></h5>
<ul class="lia-list-style-type-square">
<li><font face="andale mono,times">EI: ZFI_ES_MDG_VAL</font></li>
<li><font face="andale mono,times">BAdI Implementation: ZFI_MDG_VAL</font></li>
<li><font face="andale mono,times">Class: ZCL_FI_MDG_VAL</font></li>
<li><font face="andale mono,times">Method: IF_EX_USMD_RULE_SERVICE~CHECK_ENTITY</font></li>
</ul>

```abap  
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
```

<h5><font face="andale mono,times">Output</font></h5>
<ol>
<li>
<h5><font face="andale mono,times">Scenario I</font></h5>
</li>
</ol>
<p><font face="andale mono,times">&nbsp; &nbsp; &nbsp; &nbsp;1.1.&nbsp;With Loading, Business area is hidden, Profit Center is mandatory, Department &amp; User Responsible are not mandatory.</font></p>
<p><font face="andale mono,times"><img src="https://github.com/nimi-soni/SAP-MDG-Dynamic-Validation/blob/main/MDG_Dynamic_Validation/Nimii_0-1749533769528.png"></img></font></p>
<p align = "center"><font face="andale mono,times" size="2">[ Fig 1.1 : Initial Screen ]</font></p>
<p class="lia-align-left"><font face="andale mono,times"><font size="2">1.2.&nbsp;&nbsp;</font>With entering Company code = &lsquo;0001&rsquo;, Department becomes mandatory (*).</font></p>
<p><font face="andale mono,times"><img src="https://github.com/nimi-soni/SAP-MDG-Dynamic-Validation/blob/main/MDG_Dynamic_Validation/Nimii_1-1749533919996.png"></img></font></p>
<p align = "center"><font face="andale mono,times" size="2">[ Fig 1.2 : Department is mandatory ]</font></p>
<h5><font face="andale mono,times">2. Scenario II</font></h5>
<p class="lia-align-left"><font face="andale mono,times">2.1. For Company code = &lsquo;0003&rsquo;, Department is not mandatory</font></p>
<p><font face="andale mono,times"><img src="https://github.com/nimi-soni/SAP-MDG-Dynamic-Validation/blob/main/MDG_Dynamic_Validation/Nimii_2-1749533973480.png"></img></font></p>
<p align = "center"><font face="andale mono,times" size="2">[ Fig 2.1 : Department not mandatory ]</font></p>
<h5><font face="andale mono,times">3. Scenario III</font></h5>
<p class="lia-align-left"><font face="andale mono,times">3.1. With loading, User Responsible is not mandatory by default.</font></p>
<p><font face="andale mono,times"><img src="https://github.com/nimi-soni/SAP-MDG-Dynamic-Validation/blob/main/MDG_Dynamic_Validation/Nimii_3-1749533997551.png"></img></font></p>
<p align = "center"><font face="andale mono,times" size="2">[ Fig 3.1 : User Responsible not mandatory ]</font></p>
<p class="lia-align-left"><font face="andale mono,times">3.2. With Cost center category = &lsquo;%&rsquo;, User Responsible becomes mandatory.</font></p>
<p><font face="andale mono,times"><img src="https://github.com/nimi-soni/SAP-MDG-Dynamic-Validation/blob/main/MDG_Dynamic_Validation/Nimii_4-1749534027291.png"></img></font></p>
<p align = "center"><font face="andale mono,times" size="2">[ Fig 3.2 : User Responsible mandatory ]</font></p>
<p align = "center"><font face="andale mono,times">3.3. Click on Check: As Profit Center &amp; User Responsible are blank, we got error messages defined in our Z table.</font></p>
<p><font face="andale mono,times"><img src="https://github.com/nimi-soni/SAP-MDG-Dynamic-Validation/blob/main/MDG_Dynamic_Validation/Nimii_5-1749534051467.png"></img></font></p>
<p align = "center"><font face="andale mono,times" size="2">[ Fig 3.3 : Messages ]</font></p>
<p class="lia-align-left"><font face="andale mono,times">3.4.Errors on Check</font></p>
<p><font face="andale mono,times"><img src="https://github.com/nimi-soni/SAP-MDG-Dynamic-Validation/blob/main/MDG_Dynamic_Validation/Nimii_6-1749534084656.png"></img></font></p>
<p align = "center"><font face="andale mono,times" size="2">[ Fig 3.4 : Messages ]</font></p>
<h5><font face="andale mono,times"><strong>4. Additional Sanity Check</strong>: </font></h5>
<p class="lia-align-left"><font face="andale mono,times">To troubleshoot scenario where user has maintained conditional-tech-property/attribute as not-valid property value ( By mistake ; ) So below error will appear on hitting Check.</font></p>
<p class="lia-align-left"><font face="andale mono,times">As we are using this conditional-tech-property to read IT_DATA, it&rsquo;s safe idea to check pre-hand whether the property is valid and actually present in IT_DATA to refrain from last moment surprises. (or technically a dump ; )</font></p>
<p><font face="andale mono,times"><img src="https://github.com/nimi-soni/SAP-MDG-Dynamic-Validation/blob/main/MDG_Dynamic_Validation/Nimii_7-1749534121014.png"></img></font></p>
<p align = "center"><font face="andale mono,times" size="2">[ Fig. 4.1. Preventive Code ]</font></p>
<p><font face="andale mono,times"><img src="https://github.com/nimi-soni/SAP-MDG-Dynamic-Validation/blob/main/MDG_Dynamic_Validation/Nimii_8-1749534164052.png"></img></font></p>
<p align = "center"><font face="andale mono,times" size="2">[ Fig : 4.2. conditional tech attribute = &lsquo;CCODECCTR1&rsquo; is not valid attribute of data model ]</font></p>
<h5><font face="andale mono,times">5. Message Class: Generic 000, So No transport required every time for new messages.</font></h5>
<p><font face="andale mono,times"><img src="https://github.com/nimi-soni/SAP-MDG-Dynamic-Validation/blob/main/MDG_Dynamic_Validation/Nimii_9-1749534184200.png"></img></font></p>
<p align = "center"><font face="andale mono,times" size="2">[ Fig : 5 Message Class ]</font></p>
<h5><font face="andale mono,times"><strong>Conclusion</strong></font></h5>
<p class="lia-align-justify"><font face="andale mono,times">- SAP MDG is built to empower governed, agile master data. But flexibility shouldn&rsquo;t mean fragility. With a configurable validation engine, we&rsquo;ve transformed how we think about field behavior turning a developer-led task into a business-led control mechanism and maximum governance.</font></p>
<div><div>👉 Read my full article on&nbsp;<a href="https://community.sap.com/t5/technology-blog-posts-by-members/reimagining-sap-mdg-field-validations-low-code-approach-ui-field-control/ba-p/14122121" target="_blank">Reimagining SAP MDG Field Validations</a>&nbsp;here.</div></div><div><br /></div><div>
<p class="lia-align-justify"><font face="andale mono,times"><strong>Thanks !&nbsp; &nbsp;</strong></font></p>
