def create_triggers():
    # Connect to sqlite3
    try:
        conn = sqlite3.connect("guilty_inventory.sqlite3")
        c = conn.cursor()

        # Create triggers
        # trig_generate_guilty_base
        c.execute(
            """
        insert into t_guilty_base
        SELECT 
        inv_month,
        inv_model,
        inv_cat,
        business_unit,
        inv_age,
        inv_age as inv_age_mod,
        rate_yen,
        inv_qty,
        inv_amt / 1000 as inv_KMXN,
        inv_amt * rate_yen as inv_MYEN,

        sn0.sales_qty as sales_n0_Q,
        sn0.sales_amt / 1000 as sales_n0_KMXN,
        sn0.sales_amt * rate_yen / 1000000 as sales_n0_MYEN,

        sn1.sales_qty as sales_n1_Q,
        sn1.sales_amt / 1000 as sales_n1_KMXN,
        sn1.sales_amt * rate_yen / 1000000 as sales_n1_MYEN,

        sn2.sales_qty as sales_n2_Q,
        sn2.sales_amt / 1000 as sales_n2_KMXN,
        sn2.sales_amt * rate_yen / 1000000 as sales_n2_MYEN,

        sn3.sales_qty as sales_n3_Q,
        sn3.sales_amt / 1000 as sales_n3_KMXN,
        sn3.sales_amt * rate_yen / 1000000 as sales_n3_MYEN,

        sn4.sales_qty as sales_n4_Q,
        sn4.sales_amt / 1000 as sales_n4_KMXN,
        sn4.sales_amt * rate_yen / 1000000 as sales_n4_MYEN,

        sn5.sales_qty as sales_n5_Q,
        sn5.sales_amt / 1000 as sales_n5_KMXN,
        sn5.sales_amt * rate_yen / 1000000 as sales_n5_MYEN,

        sn6.sales_qty as sales_n6_Q,
        sn6.sales_amt / 1000 as sales_n6_KMXN,
        sn6.sales_amt * rate_yen / 1000000 as sales_n6_MYEN,

        pn0.purchase_qty as purchase_n0_Q,
        pn1.purchase_qty as purchase_n1_Q,
        pn2.purchase_qty as purchase_n2_Q,
        pn3.purchase_qty as purchase_n3_Q,
        pn4.purchase_qty as purchase_n4_Q,
        pn5.purchase_qty as purchase_n5_Q,
        pn6.purchase_qty as purchase_n6_Q

        FROM t_inv 

        left outer join
        t_business_unit
        on inv_cat = prod_category
        
        left outer join
        t_rate
        on inv_month = rate_month

        left outer join
        t_sales sn0
        on inv_month = sn0.sales_month and inv_model = sn0.sales_model

        left outer join
        t_sales sn1
        on datetime(inv_month, '-1 months') = sn1.sales_month and inv_model = sn1.sales_model

        left outer join
        t_sales sn2
        on datetime(inv_month, '-2 months') = sn2.sales_month and inv_model = sn2.sales_model

        left outer join
        t_sales sn3
        on datetime(inv_month, '-3 months') = sn3.sales_month and inv_model = sn3.sales_model

        left outer join
        t_sales sn4
        on datetime(inv_month, '-4 months') = sn4.sales_month and inv_model = sn4.sales_model

        left outer join
        t_sales sn5
        on datetime(inv_month, '-5 months') = sn5.sales_month and inv_model = sn5.sales_model

        left outer join
        t_sales sn6
        on datetime(inv_month, '-6 months') = sn6.sales_month and inv_model = sn6.sales_model

        left outer join
        t_purchase pn0
        on inv_month = pn0.purchase_month and inv_model = pn0.purchase_model

        left outer join
        t_purchase pn1
        on datetime(inv_month, '-1 months') = pn1.purchase_month and inv_model = pn1.purchase_model

        left outer join
        t_purchase pn2
        on datetime(inv_month, '-2 months') = pn2.purchase_month and inv_model = pn2.purchase_model

        left outer join
        t_purchase pn3
        on datetime(inv_month, '-3 months') = pn3.purchase_month and inv_model = pn3.purchase_model

        left outer join
        t_purchase pn4
        on datetime(inv_month, '-4 months') = pn4.purchase_month and inv_model = pn4.purchase_model

        left outer join
        t_purchase pn5
        on datetime(inv_month, '-5 months') = pn5.purchase_month and inv_model = pn5.purchase_model

        left outer join
        t_purchase pn6
        on datetime(inv_month, '-6 months') = pn6.purchase_month and inv_model = pn6.purchase_model

        """
        )

        # Close connection to sqlite3
        c.close()
        conn.close()

    except Exception as e:
        print(e)

    print("Successfully finished without error")
