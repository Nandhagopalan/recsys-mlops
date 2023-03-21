SELECT 
        a_s.*,
        c_s.*,
        t_s.price,
        t_s.sales_channel_id,
        t_s.t_dat
 FROM 
        HM_MLOPS.HM_POST.dedup_transactions as t_s
    JOIN 
        HM_MLOPS.HM_POST.articles_metadata as a_s
    ON 
        a_s.ARTICLE_ID=t_s.ARTICLE_ID
    JOIN 
        HM_MLOPS.HM_POST.customers_staging as c_s
    ON
        c_s.CUSTOMER_ID=t_s.CUSTOMER_ID