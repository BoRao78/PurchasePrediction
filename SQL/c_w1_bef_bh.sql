--sum of behavior before 1 day, 3 days and 6 days before prediction day for category

CREATE TABLE c_w1_bef_bh AS
SELECT item_category,
	sum(case WHEN time <= '2014-11-27 23:00:00' AND time >= '2014-11-27 00:00:00' AND user_id != 0 then 1 else 0 end) c_u_bef1d_tot,
	sum(case WHEN time <= '2014-11-27 23:00:00' AND time >= '2014-11-27 00:00:00' AND behavior_type = 1 then 1 else 0 end) c_bef1d_b1c,
    sum(case WHEN time <= '2014-11-27 23:00:00' AND time >= '2014-11-27 00:00:00' AND behavior_type = 2 then 1 else 0 end) c_bef1d_b2c,
    sum(case WHEN time <= '2014-11-27 23:00:00' AND time >= '2014-11-27 00:00:00' AND behavior_type = 3 then 1 else 0 end) c_bef1d_b3c,
    sum(case WHEN time <= '2014-11-27 23:00:00' AND time >= '2014-11-27 00:00:00' AND behavior_type = 4 then 1 else 0 end) c_bef1d_b4c,
    sum(case WHEN time <= '2014-11-27 23:00:00' AND time >= '2014-11-27 00:00:00' AND behavior_type in(1,2,3,4) then 1 else 0 end) c_bef1d_bc,

	sum(case WHEN time <= '2014-11-27 23:00:00' AND time >= '2014-11-25 00:00:00' AND user_id != 0 then 1 else 0 end) c_u_bef3d_tot,
    sum(case WHEN time <= '2014-11-27 23:00:00' AND time >= '2014-11-25 00:00:00' AND behavior_type = 1 then 1 else 0 end) c_bef3d_b1c,
    sum(case WHEN time <= '2014-11-27 23:00:00' AND time >= '2014-11-25 00:00:00' AND behavior_type = 2 then 1 else 0 end) c_bef3d_b2c,
    sum(case WHEN time <= '2014-11-27 23:00:00' AND time >= '2014-11-25 00:00:00' AND behavior_type = 3 then 1 else 0 end) c_bef3d_b3c,
    sum(case WHEN time <= '2014-11-27 23:00:00' AND time >= '2014-11-25 00:00:00' AND behavior_type = 4 then 1 else 0 end) c_bef3d_b4c,
    sum(case WHEN time <= '2014-11-27 23:00:00' AND time >= '2014-11-25 00:00:00' AND behavior_type in(1,2,3,4) then 1 else 0 end) c_bef3d_bc,
    
	sum(case WHEN time <= '2014-11-27 23:00:00' AND time >= '2014-11-22 00:00:00' AND user_id != 0 then 1 else 0 end) c_u_bef6d_tot,
    sum(case WHEN time <= '2014-11-27 23:00:00' AND time >= '2014-11-22 00:00:00' AND behavior_type = 1 then 1 else 0 end) c_bef6d_b1c,
    sum(case WHEN time <= '2014-11-27 23:00:00' AND time >= '2014-11-22 00:00:00' AND behavior_type = 2 then 1 else 0 end) c_bef6d_b2c,
    sum(case WHEN time <= '2014-11-27 23:00:00' AND time >= '2014-11-22 00:00:00' AND behavior_type = 3 then 1 else 0 end) c_bef6d_b3c,
    sum(case WHEN time <= '2014-11-27 23:00:00' AND time >= '2014-11-22 00:00:00' AND behavior_type = 4 then 1 else 0 end) c_bef6d_b4c,
    sum(case WHEN time <= '2014-11-27 23:00:00' AND time >= '2014-11-22 00:00:00' AND behavior_type in(1,2,3,4) then 1 else 0 end) c_bef6d_bc
	
FROM user_week1
GROUP BY item_category;

ALTER TABLE c_w1_bef_bh
ADD c_bef1d_br INT NOT NULL DEFAULT 0;

ALTER TABLE c_w1_bef_bh
ADD c_bef3d_br INT NOT NULL DEFAULT 0;

ALTER TABLE c_w1_bef_bh
ADD c_bef6d_br INT NOT NULL DEFAULT 0;

UPDATE c_w1_bef_bh
SET c_bef1d_br = ROUND(c_bef1d_b4c*100/c_bef1d_bc, 1)
WHERE  c_bef1d_bc !=0;

UPDATE c_w1_bef_bh
SET c_bef3d_br = ROUND(c_bef3d_b4c*100/c_bef3d_bc, 1)
WHERE  c_bef3d_bc !=0;

UPDATE c_w1_bef_bh
SET c_bef6d_br = ROUND(c_bef6d_b4c*100/c_bef6d_bc, 1)
WHERE  c_bef6d_bc !=0;
