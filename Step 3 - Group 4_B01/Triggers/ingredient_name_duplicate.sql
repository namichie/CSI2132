CREATE FUNCTION name_stamp() RETURNS trigger AS $name_stamp$
    BEGIN
        -- Check that categoryname and salary are given
        IF NEW.name=OLD.name THEN
            RAISE EXCEPTION 'ingredient name already exists';
        END IF;
    END;
$name_stamp$ LANGUAGE plpgsql;

CREATE TRIGGER name_stamp AFTER INSERT OR UPDATE ON ingredient
    FOR EACH ROW EXECUTE PROCEDURE name_stamp();