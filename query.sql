call inc_views(1);
call inc_views(1);
call inc_views(1);
call inc_views(1);
call inc_views(2);
call inc_clicks(1);
call inc_clicks(1);
call inc_clicks(2);

SELECT name FROM advertiser WHERE advertiser_id = 2;

UPDATE advertiser
SET name = 'new name'
WHERE advertiser.advertiser_id = 2;

SELECT name FROM advertiser WHERE advertiser_id = 2;

SELECT clicks FROM ad WHERE ad.ad_id = 1;

SELECT clicks FROM advertiser WHERE advertiser.advertiser_id  = 2;

SELECT SUM(clicks) FROM advertiser;