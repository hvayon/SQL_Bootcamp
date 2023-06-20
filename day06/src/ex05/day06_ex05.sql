COMMENT ON TABLE person_discounts IS 'Table for storing discounts';
COMMENT ON COLUMN person_discounts.id IS 'The primary key identifier';
COMMENT ON COLUMN person_discounts.person_id IS 'The person identifier';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'The pizzeria identifier';
COMMENT ON COLUMN person_discounts.discount IS 'The size of the discount for a person in a pizzeria';