--innder join item and category

CREATE TABLE ic_w1_bef_bh AS
SELECT *
FROM
    i_w1_bef_bh i INNER JOIN c_w1_bef_bh c
    ON i.item_category = c.item_category;
	