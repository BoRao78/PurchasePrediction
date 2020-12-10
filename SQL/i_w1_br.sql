--Calculate purchase rate

CREATE TABLE i_w1_br AS
SELECT item_id, ROUND(i_bef1d_b4c*100/i_bef1d_bc, 1) AS i_bef1d_br NOT NULL,
       ROUND(i_bef3d_b4c*100/i_bef3d_bc, 1) AS i_bef3d_br NOT NULL, ROUND(i_bef6d_b4c*100/i_bef6d_bc, 1) AS i_bef6d_br NOT NULL
FROM i_w1_bef_bh
GROUP BY item_id;