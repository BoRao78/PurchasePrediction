--Create ic_w4_bef containing info about item and category

CREATE TABLE ic_w4 AS
SELECT item_id, item_category
FROM user_week4
GROUP BY item_id, item_category;

CREATE TABLE i_ic_w4 AS
SELECT *
FROM
    i_w4_bef_bh i INNER JOIN ic_w4 ic
    ON i.item_id = ic.item_id;
    
CREATE TABLE ic_w4_bef AS
SELECT *
FROM
    i_ic_w4 i INNER JOIN c_w4_bef_bh c
    ON i.item_category = c.item_category;

