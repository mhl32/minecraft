/*create table user(
    id int,
    name text,
    primary key (id)
) ;*/

CREATE TABLE Chunks(
   Coordinate INTEGER ARRAY[3],
   Weather CHAR(20),
   PRIMARY KEY Coordinate()
);

CREATE TABLE Blocks(
   CoordinateBlock INTEGER ARRAY[3],
   CoordinateChunk INTEGER ARRAY[3],
   Type CHAR(20),
   PRIMARY KEY (CoordinateBlock, CoordinateChunk, Type),
   FOREIGN KEY(CoordinateChunk) REFERENCES Chunks,
   FOREIGN KEY(Type) REFERENCES Block_Types)
);

CREATE TABLE Block_Types(
   Type CHAR(20),
   Toughness INT,
   State CHAR(20),
   PRIMARY KEY(Type)
);

CREATE TABLE Items(
   ID INT,
   Type   CHAR(20),
   PRIMARY KEY(ID)
);

CREATE TABLE Tools(
   ID INT,
   Durability INT,
   PRIMARY KEY(ID),
   FOREIGN KEY(ID) REFERENCES Items
);

CREATE TABLE Enchantments(
   Type CHAR(20),
   Level INTEGER,
   PRIMARY KEY(Type, Level)
);

CREATE TABLE AppliedTo(
   Type CHAR(20),
   ID INT,
   Level INT,
   PRIMARY KEY(Type, Level, ID),
   FOREIGN KEY(Type, Level) REFERENCES Enchantments,
   FOREIGN KEY(ID) REFERENCES Items)
);
CREATE TABLE User(
   User_ID INT,
   Name CHAR(20),
   Coordinate INT NOTNULL,
   FoodBar INT,
   Health CHAR(20) NOTNULL,
   PRIMARY KEY(USER_ID)
);

CREATE TABLE Host_in(
  Reputation CHAR(20) DELETE ON CASCADE,
  VCoordinate INT,
  UID INT,
  PRIMARY KEY(VCoordinate, UID),
  FOREIGN KEY(VCoordinate) REFERENCES Village,
  FOREIGN KEY(UID) REFERENCES User
);
CREATE TABLE Storage(
  Storage_ID INT,
  PRIMARY KEY Storage_ID
);
CREATE TABLE Items_stored_at(
  Count INT DELETE ON CASCADE,
  Storage_ID INT,
  Items_ID INT,
  PRIMARY KEY(Storage_ID, Items_ID),
  FOREIGN KEY (Storage_ID) REFERENCES Storage,
  FOREIGN KEY (Items_ID) REFERENCES Items
);
CREATE TABLE Blocks_stored_at(
  Count INT DELETE ON CASCADE,
  Storage_ID INT,
  Items_ID INT,
  PRIMARY KEY(Storage_ID, Items_ID),
  FOREIGN KEY(Storage_ID) REFERENCES Storage,
  FOREIGN KEY(Items_ID) REFERENCES Items
);
CREATE TABLE Chest(
  Storage_ID INT,
  Location CHAR(20),
  PRIMARY KEY(Storage_ID)
);
CREATE TABLE Ender_Chest(
  Storage_ID INT,
  PRIMARY KEY(Storage_ID)
);
CREATE TABLE User_storage(
  Storage_ID INT,
  PRIMARY KEY(Storage_ID)
);
CREATE TABLE Villagers(
    ID INT,
    Coordinate INT,
    Health  CHAR(20),
    Occupation CHAR(20),
    PRIMARY KEY(USER_ID),
    FOREIGINKEY (Coordinates) REFERENCES villages
);
CREATE TABLE Villages(
   Coordinates INT,
   ID INT,
   PRIMARY KEY(Coordinates),
   FOREIGNKEY (ID) REFERENCES villages
);
CREATE TABLE Monster(
   ID INT,
   Health CHAR(20) NOTNULL,
   Dmage INT,
   PRIMARY KEY(ID)
);
CREATE TABLE Pillagers(
   ID INT,
   Occupation CHAR(10),
   Location CHAR(10),
   PRIMARY KEY(ID),
   FOREING KEY(Location) REFERNCES Gangs
);
CREATE TABLE Gangs(
   Location CHAR(10),
   ID INT,
   PRIMARY KEY (ID),
   FOREIGNKEY (ID) REFERNCES Pillagers
);
CREATE TABLE Animal(
    ID INT,
    Health CHAR(20),
    Damage INT,
    PRIMARY KEY(ID)
);
