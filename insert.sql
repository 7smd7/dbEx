TRUNCATE ad CASCADE;
TRUNCATE advertiser CASCADE;

ALTER SEQUENCE ad_ad_id_seq RESTART;
ALTER SEQUENCE advertiser_advertiser_id_seq RESTART;

INSERT INTO advertiser (advertiser_id, name) VALUES (1,'name1'), (2,'name2');

INSERT INTO ad (ad_id, title, img_url, link, advertiser_id) VALUES (1,'title1', 'img-url1', 'link1', 1),
                         (2,'title2', 'img-url2', 'link2', 2);