CREATE TABLE violation_review (
    record_id SERIAL PRIMARY KEY,
    entity_name VARCHAR(50) NOT NULL,
    violation_count INT NOT NULL CHECK (violation_count >= 0)
);
INSERT INTO violation_review (entity_name, violation_count) VALUES
('Auth_Service', 0),
('Payment_Service', 1),
('Order_Service', 2),
('Audit_Service', 3),
('Admin_Service', 5);

SELECT * FROM violation_review;

-- case statement to classify violaions:
SELECT *, 
CASE WHEN violation_count = 0 THEN 'No Violations'
WHEN violation_count BETWEEN 1 and 2 THEN 'Moderate Violations'
ELSE 'Critical Violations'
END AS violations_level
FROM violation_review;

-- Adding a status column: 
ALTER TABLE violation_review
ADD COLUMN status VARCHAR(20);

-- case statement to update status column: 
UPDATE violation_review
SET status =
	CASE WHEN violation_count = 0 THEN 'Accepted'
		WHEN violation_count BETWEEN 1 AND 2 THEN 'Reveiwing'
		ELSE 'Rejected'
	END
WHERE status IS NULL;

-- If Else: 
DO $$
DECLARE
    v_count INT;
BEGIN
    SELECT violation_count
    INTO v_count
    FROM violation_review
    WHERE entity_name = 'Payment_Service';

    IF v_count = 0 THEN
        RAISE NOTICE 'Payment_Service: Accepted';

    ELSIF v_count = 1 THEN
        RAISE NOTICE 'Payment_Service: Needs Review';

    ELSE
        RAISE NOTICE 'Payment_Service: Rejected';
    END IF;
END $$;
