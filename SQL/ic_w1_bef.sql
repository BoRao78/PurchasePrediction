--Create ic_w1_bef containing info about item and category

CREATE TABLE ic_w1 AS
SELECT item_id, item_category
FROM user_week1
GROUP BY item_id, item_category;

CREATE TABLE i_ic_w1 AS
SELECT *
FROM
    i_w1_bef_bh i INNER JOIN ic_w1 ic
    ON i.item_id = ic.item_id;
    
CREATE TABLE ic_w1_bef AS
SELECT *
FROM
    i_ic_w1 i INNER JOIN c_w1_bef_bh c
    ON i.item_category = c.item_category;

