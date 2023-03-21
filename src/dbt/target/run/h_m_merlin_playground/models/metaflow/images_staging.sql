
  
    

        create or replace transient table HM_MLOPS.HM_POST.images_staging  as
        (WITH latest_etl AS (
    SELECT
        "ETL_ID"
    FROM "HM_MLOPS"."HM_RAW"."IMAGES_TO_S3"
    ORDER BY "ETL_TIMESTAMP" DESC
    LIMIT 1
)
SELECT 
    cd."RAW_DATA":"article_id"::INT AS ARTICLE_ID, 
    'https://hm-kaggle-images.s3.us-west-2.amazonaws.com/' || cd."RAW_DATA":"article_id"::VARCHAR || '.jpg' AS S3_URL
FROM 
    "HM_MLOPS"."HM_RAW"."IMAGES_TO_S3" as cd
JOIN 
    latest_etl as le ON le.ETL_ID=cd.ETL_ID
ORDER BY ARTICLE_ID
        );
      
  