CREATE FUNCTION ingredient_stamp() RETURNS trigger AS $ingredient_stamp$
    BEGIN
        -- Check that ingredientname and salary are given
        IF NEW.category IS NULL THEN
            RAISE EXCEPTION 'ingredient category cannot be null';
        END IF;
    END;
$ingredient_stamp$ LANGUAGE plpgsql;

CREATE TRIGGER ingredient_stamp BEFORE INSERT OR UPDATE ON ingredient
    FOR EACH ROW EXECUTE PROCEDURE ingredient_stamp();