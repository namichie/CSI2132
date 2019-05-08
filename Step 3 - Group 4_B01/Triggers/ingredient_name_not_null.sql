CREATE FUNCTION ingredient_stamp() RETURNS trigger AS $ingredient_stamp$
    BEGIN
        -- Check that ingredientname and salary are given
        IF NEW.name IS NULL THEN
            RAISE EXCEPTION 'ingredient name cannot be null';
        END IF;
    END;
$ingredient_stamp$ LANGUAGE plpgsql;

CREATE TRIGGER ingredient_stamp BEFORE INSERT OR UPDATE ON ingredient
    FOR EACH ROW EXECUTE PROCEDURE ingredient_stamp();