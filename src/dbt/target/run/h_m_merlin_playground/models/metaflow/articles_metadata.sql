
  
    

        create or replace transient table HM_MLOPS.HM_POST.articles_metadata  as
        (SELECT 
    i_s.S3_URL AS S3_URL,
    cd.*
FROM 
    HM_MLOPS.HM_POST.articles_staging as cd
LEFT JOIN
    HM_MLOPS.HM_POST.images_staging AS i_s
    ON i_s.ARTICLE_ID=cd.ARTICLE_ID
        );
      
  