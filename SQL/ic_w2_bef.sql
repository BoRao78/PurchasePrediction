--Create ic_w1_bef containing info about item and category

CREATE TABLE ic_w2 AS
SELECT item_id, item_category
FROM user_week2
GROUP BY item_id, item_category;

CREATE TABLE i_ic_w2 AS
SELECT *
FROM
    i_w2_bef_bh i INNER JOIN ic_w2 ic
    ON i.item_id = ic.item_id;
    
CREATE TABLE ic_w2_bef AS
SELECT *
FROM
    i_ic_w2 i INNER JOIN c_w2_bef_bh c
    ON i.item_category = c.item_category;

