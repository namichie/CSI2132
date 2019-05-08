


CREATE FUNCTION unapproved_stamp() RETURNS trigger AS $unapproved_stamp$
    BEGIN
        -- Check that categoryname and salary are given
        IF count(public.orders.order_unapporved=FALSE)>0 THEN
            RAISE EXCEPTION 'there are orders unapproved';
        END IF;
    END;
$unapproved_stamp$ LANGUAGE plpgsql;

CREATE TRIGGER unapproved_stamp AFTER INSERT OR UPDATE ON orders
    FOR EACH ROW EXECUTE PROCEDURE unapproved_stamp();

