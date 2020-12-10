--sum of behavior before 1 day, 3 days and 6 days before prediction day

CREATE TABLE i_w2_bef_bh AS
SELECT item_id,
	sum(case WHEN time <= '2014-12-04 23:00:00' AND time >= '2014-12-04 00:00:00' AND user_id != 0 then 1 else 0 end) i_u_bef1d_tot,
	sum(case WHEN time <= '2014-12-04 23:00:00' AND time >= '2014-12-04 00:00:00' AND behavior_type = 1 then 1 else 0 end) i_bef1d_b1c,
    sum(case WHEN time <= '2014-12-04 23:00:00' AND time >= '2014-12-04 00:00:00' AND behavior_type = 2 then 1 else 0 end) i_bef1d_b2c,
    sum(case WHEN time <= '2014-12-04 23:00:00' AND time >= '2014-12-04 00:00:00' AND behavior_type = 3 then 1 else 0 end) i_bef1d_b3c,
    sum(case WHEN time <= '2014-12-04 23:00:00' AND time >= '2014-12-04 00:00:00' AND behavior_type = 4 then 1 else 0 end) i_bef1d_b4c,
    sum(case WHEN time <= '2014-12-04 23:00:00' AND time >= '2014-12-04 00:00:00' AND behavior_type in(1,2,3,4) then 1 else 0 end) i_bef1d_bc,

	sum(case WHEN time <= '2014-12-04 23:00:00' AND time >= '2014-12-02 00:00:00' AND user_id != 0 then 1 else 0 end) i_u_bef3d_tot,
    sum(case WHEN time <= '2014-12-04 23:00:00' AND time >= '2014-12-02 00:00:00' AND behavior_type = 1 then 1 else 0 end) i_bef3d_b1c,
    sum(case WHEN time <= '2014-12-04 23:00:00' AND time >= '2014-12-02 00:00:00' AND behavior_type = 2 then 1 else 0 end) i_bef3d_b2c,
    sum(case WHEN time <= '2014-12-04 23:00:00' AND time >= '2014-12-02 00:00:00' AND behavior_type = 3 then 1 else 0 end) i_bef3d_b3c,
    sum(case WHEN time <= '2014-12-04 23:00:00' AND time >= '2014-12-02 00:00:00' AND behavior_type = 4 then 1 else 0 end) i_bef3d_b4c,
    sum(case WHEN time <= '2014-12-04 23:00:00' AND time >= '2014-12-02 00:00:00' AND behavior_type in(1,2,3,4) then 1 else 0 end) i_bef3d_bc,
    
	sum(case WHEN time <= '2014-12-04 23:00:00' AND time >= '2014-11-29 00:00:00' AND user_id != 0 then 1 else 0 end) i_u_bef6d_tot,
    sum(case WHEN time <= '2014-12-04 23:00:00' AND time >= '2014-11-29 00:00:00' AND behavior_type = 1 then 1 else 0 end) i_bef6d_b1c,
    sum(case WHEN time <= '2014-12-04 23:00:00' AND time >= '2014-11-29 00:00:00' AND behavior_type = 2 then 1 else 0 end) i_bef6d_b2c,
    sum(case WHEN time <= '2014-12-04 23:00:00' AND time >= '2014-11-29 00:00:00' AND behavior_type = 3 then 1 else 0 end) i_bef6d_b3c,
    sum(case WHEN time <= '2014-12-04 23:00:00' AND time >= '2014-11-29 00:00:00' AND behavior_type = 4 then 1 else 0 end) i_bef6d_b4c,
    sum(case WHEN time <= '2014-12-04 23:00:00' AND time >= '2014-11-29 00:00:00' AND behavior_type in(1,2,3,4) then 1 else 0 end) i_bef6d_bc
	
FROM user_week2
GROUP BY item_id;

ALTER TABLE i_w2_bef_bh
ADD i_bef1d_br INT NOT NULL DEFAULT 0;

ALTER TABLE i_w2_bef_bh
ADD i_bef3d_br INT NOT NULL DEFAULT 0;

ALTER TABLE i_w2_bef_bh
ADD i_bef6d_br INT NOT NULL DEFAULT 0;

UPDATE i_w2_bef_bh
SET i_bef1d_br = ROUND(i_bef1d_b4c*100/i_bef1d_bc, 1)
WHERE  i_bef1d_bc !=0;

UPDATE i_w2_bef_bh
SET i_bef3d_br = ROUND(i_bef3d_b4c*100/i_bef3d_bc, 1)
WHERE  i_bef3d_bc !=0;

UPDATE i_w2_bef_bh
SET i_bef6d_br = ROUND(i_bef6d_b4c*100/i_bef6d_bc, 1)
WHERE  i_bef6d_bc !=0;
