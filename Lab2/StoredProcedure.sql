CREATE PROCEDURE usp_FlyttaBok
    @SourceStoreID INT,
    @DestinationStoreID INT,
    @ISBN CHAR(13),
    @Quantity INT = 1
AS
BEGIN
    BEGIN TRANSACTION;

    -- Ensure enough inventory exists in the source store
    IF EXISTS (
        SELECT 1
        FROM Inventory
        WHERE StoreID = @SourceStoreID AND ISBN = @ISBN AND Quantity >= @Quantity
    )
    BEGIN
        -- Deduct from the source store
        UPDATE Inventory
        SET Quantity = Quantity - @Quantity
        WHERE StoreID = @SourceStoreID AND ISBN = @ISBN;

        -- Add to the destination store
        IF EXISTS (
            SELECT 1
            FROM Inventory
            WHERE StoreID = @DestinationStoreID AND ISBN = @ISBN
        )
        BEGIN
            UPDATE Inventory
            SET Quantity = Quantity + @Quantity
            WHERE StoreID = @DestinationStoreID AND ISBN = @ISBN;
        END
        ELSE
        BEGIN
            INSERT INTO Inventory (StoreID, ISBN, Quantity)
            VALUES (@DestinationStoreID, @ISBN, @Quantity);
        END

        COMMIT TRANSACTION;
    END
    ELSE
    BEGIN
        ROLLBACK TRANSACTION;
        RAISERROR('Not enough inventory in the source store.', 16, 1);
    END
END;
