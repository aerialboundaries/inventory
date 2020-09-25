SELECT
    tda.inv_month,
    tda.inv_model_digest,
    tda.business_unit,
    sum(inv_qty) as inv_qty,
    sum(inv_KMXN) as inv_KMXN,
    sum(inv_qty) as inv_n1_Q,
    sum(sn0.sales_qty) as sales_n0_Q,
    sum(sn0.sales_amt) / 1000 as sales_n0_KMXN,

    sum(sn1.sales_qty) as sales_n1_Q,
    sum(sn1.sales_amt) / 1000 as sales_n1_KMXN,

    sum(sn2.sales_qty) as sales_n2_Q,
    sum(sn2.sales_amt) / 1000 as sales_n2_KMXN,

    sum(sn3.sales_qty) as sales_n3_Q,
    sum(sn3.sales_amt) / 1000 as sales_n3_KMXN,

    sum(sn4.sales_qty) as sales_n4_Q,
    sum(sn4.sales_amt) / 1000 as sales_n4_KMXN,

    sum(sn5.sales_qty) as sales_n5_Q,
    sum(sn5.sales_amt) / 1000 as sales_n5_KMXN,

    sum(sn6.sales_qty) as sales_n6_Q,
    sum(sn6.sales_amt) / 1000 as sales_n6_KMXN,

    sum(sn7.sales_qty) as sales_n7_Q,
    sum(sn7.sales_amt) / 1000 as sales_n7_KMXN,

    sum(sn8.sales_qty) as sales_n8_Q,
    sum(sn8.sales_amt) / 1000 as sales_n8_KMXN,

    sum(sn9.sales_qty) as sales_n9_Q,
    sum(sn9.sales_amt) / 1000 as sales_n9_KMXN,

    sum(sn10.sales_qty) as sales_n10_Q,
    sum(sn10.sales_amt) / 1000 as sales_n10_KMXN,

    sum(sn11.sales_qty) as sales_n11_Q,
    sum(sn11.sales_amt) / 1000 as sales_n11_KMXN,

    sum(sn12.sales_qty) as sales_n12_Q,
    sum(sn12.sales_amt) / 1000 as sales_n12_KMXN,

FROM
    t_digest_actage tda
    left outer join t_guilty_base tg on tda.inv_month = tg.inv_month
    and tda.inv_model = tg.inv_model
    left outer join t_sales sn0 on tda.inv_month = sn0.sales_month
    and tda.inv_model = sn0.sales_model
    left outer join t_sales sn1 on datetime(tda.inv_month, '-1 months') = sn1.sales_month
    and tda.inv_model = sn1.sales_model
    left outer join t_sales sn2 on datetime(tda.inv_month, '-2 months') = sn2.sales_month
    and tda.inv_model = sn2.sales_model
    left outer join t_sales sn3 on datetime(tda.inv_month, '-3 months') = sn3.sales_month
    and tda.inv_model = sn3.sales_model
    left outer join t_sales sn4 on datetime(tda.inv_month, '-4 months') = sn4.sales_month
    and tda.inv_model = sn4.sales_model
    left outer join t_sales sn5 on datetime(tda.inv_month, '-5 months') = sn5.sales_month
    and tda.inv_model = sn5.sales_model
    left outer join t_sales sn6 on datetime(tda.inv_month, '-6 months') = sn6.sales_month
    and tda.inv_model = sn6.sales_model
    left outer join t_sales sn7 on datetime(tda.inv_month, '-7 months') = sn7.sales_month
    and tda.inv_model = sn7.sales_model
    left outer join t_sales sn8 on datetime(tda.inv_month, '-8 months') = sn8.sales_month
    and tda.inv_model = sn8.sales_model
    left outer join t_sales sn9 on datetime(tda.inv_month, '-9 months') = sn9.sales_month
    and tda.inv_model = sn9.sales_model
    left outer join t_sales sn10 on datetime(tda.inv_month, '-10 months') = sn10.sales_month
    and tda.inv_model = sn10.sales_model
    left outer join t_sales sn11 on datetime(tda.inv_month, '-11 months') = sn11.sales_month
    and tda.inv_model = sn11.sales_model
    left outer join t_sales sn12 on datetime(tda.inv_month, '-12 months') = sn12.sales_month
    and tda.inv_model = sn12.sales_model
where
    tg.inv_age > 90
group by
    tda.inv_month,
    tda.inv_model_digest,
    tda.business_unit