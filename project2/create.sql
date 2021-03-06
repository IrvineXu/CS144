-- create.sql -- 

-- User Table -- 
CREATE TABLE User (
    UserID VARCHAR(75) NOT NULL,
    Rating INTEGER NOT NULL,
    Location VARCHAR(50) DEFAULT NULL,
    Country VARCHAR(30) DEFAULT NULL,
    PRIMARY KEY (UserID)
) ENGINE = MYISAM DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

-- Item Table --
CREATE TABLE Item (
	ItemID INTEGER NOT NULL,
	Name VARCHAR(200) NOT NULL,
	Description VARCHAR(4000),
	Started TIMESTAMP NOT NULL,
	Ends TIMESTAMP NOT NULL,
	Currently DECIMAL(8,2) NOT NULL,
	First_Bid DECIMAL(8,2) NOT NULL,
    Buy_Price DECIMAL(8,2) DEFAULT NULL,
	Number_of_Bids INTEGER,
	Seller VARCHAR(75),
	PRIMARY KEY (ItemID),
	FOREIGN KEY (Seller) REFERENCES User(UserID)
) ENGINE = MYISAM DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

-- Category Table --
CREATE TABLE Category (
    CategoryID INTEGER NOT NULL PRIMARY KEY,
    Category VARCHAR(75) NOT NULL
) ENGINE = MYISAM DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

-- Item_Category Table --
CREATE TABLE Item_Category (
    ItemID INTEGER NOT NULL,
    CategoryID INTEGER NOT NULL,
    PRIMARY KEY (ItemID, CategoryID),
    FOREIGN KEY (ItemID) REFERENCES Item(ItemID),
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
) ENGINE = MYISAM DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

-- Bid Table --
CREATE TABLE Bid (
    UserID VARCHAR(75) NOT NULL,
    Time TIMESTAMP NOT NULL,
    ItemID INTEGER NOT NULL,
    Amount DECIMAL(8,2) NOT NULL,
    PRIMARY KEY (UserID, Time),
    FOREIGN KEY (ItemID) REFERENCES Item(ItemID),
    FOREIGN KEY (UserID) REFERENCES User(UserID)
) ENGINE = MYISAM DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

