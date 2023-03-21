WITH frequent_customers AS (
    SELECT 
        CUSTOMER_ID, 
        COUNT(*) AS USER_INTERACTIONS
    FROM 
         HM_MLOPS.HM_POST.joined_dataframe
    WHERE 
        T_DAT < '2020-09-08' -- only check for the training set
    GROUP BY CUSTOMER_ID
    HAVING USER_INTERACTIONS >= 5  -- min K interactions
    ORDER BY 2 ASC -- debug
)
SELECT 
    t_s.*
FROM 
    HM_MLOPS.HM_POST.joined_dataframe  as t_s
JOIN 
    frequent_customers as f_c ON 
    t_s.CUSTOMER_ID = f_c.CUSTOMER_ID