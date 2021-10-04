-------------------------
----- Create Tables -----
-------------------------

DROP TABLE IF EXISTS ad CASCADE;
DROP TABLE IF EXISTS advertiser CASCADE;


CREATE TABLE advertiser
(
    advertiser_id  SERIAL PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    clicks INT DEFAULT 0,
    views INT DEFAULT 0
);


CREATE TABLE ad
(
    ad_id  SERIAL PRIMARY KEY,
    title VARCHAR(30) NOT NULL,
    img_url  VARCHAR(100) NOT NULL,
    link VARCHAR(100) NOT NULL,
    clicks INT DEFAULT 0,
    views INT DEFAULT 0,
    advertiser_id INT REFERENCES advertiser (advertiser_id) ON DELETE CASCADE
);

-------------------------------------------------------------------
------------------------------ SP ---------------------------------
-------------------------------------------------------------------

DROP PROCEDURE IF EXISTS inc_clicks;
DROP PROCEDURE IF EXISTS inc_views;

CREATE OR REPLACE PROCEDURE inc_clicks(id INT)
    LANGUAGE plpgsql
AS
$$
BEGIN
    UPDATE ad
    SET clicks = clicks + 1
    WHERE ad.ad_id = id;

    UPDATE advertiser
    SET clicks = clicks + 1
    WHERE advertiser.advertiser_id = (SELECT advertiser_id FROM ad WHERE ad.ad_id = id);
    COMMIT;
END;
$$;

CREATE OR REPLACE PROCEDURE inc_views(id INT)
    LANGUAGE plpgsql
AS
$$
BEGIN
    UPDATE ad
    SET views = views + 1
    WHERE ad.ad_id = id;

    UPDATE advertiser
    SET views = views + 1
    WHERE advertiser.advertiser_id = (SELECT advertiser_id FROM ad WHERE ad.ad_id = id);
    COMMIT;
END;
$$;
