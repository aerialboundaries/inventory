UPDATE
    t_guilty_base
SET
    inv_age_mod = (
        SELECT
            CASE
                when sales_n0_Q > 0
                or purchase_n0_Q > 0 then age_n0
                when sales_n1_Q > 0
                or purchase_n1_Q > 0 then age_n1
                when sales_n2_Q > 0
                or purchase_n2_Q > 0 then age_n2
                when sales_n3_Q > 0
                or purchase_n3_Q > 0 then age_n3
                when sales_n4_Q > 0
                or purchase_n4_Q > 0 then age_n4
                when sales_n5_Q > 0
                or purchase_n5_Q > 0 then age_n5
                when sales_n6_Q > 0
                or purchase_n6_Q > 0 then age_n6
                when sales_n7_Q > 0
                or purchase_n7_Q > 0 then age_n7
                when sales_n8_Q > 0
                or purchase_n8_Q > 0 then age_n8
                when sales_n9_Q > 0
                or purchase_n9_Q > 0 then age_n9
                when sales_n10_Q > 0
                or purchase_n10_Q > 0 then age_n10
                when sales_n11_Q > 0
                or purchase_n11_Q > 0 then age_n11
                when sales_n12_Q > 0
                or purchase_n12_Q > 0 then age_n12
                ELSE inv_age
            END
        FROM
            t_aging
        WHERE
            inv_age = age_actual
    )
WHERE
    EXISTS(
        SELECT
            *
        FROM
            t_aging
        WHERE
            inv_age = age_actual
    )