
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/12/2017 15:10:58
-- Generated from EDMX file: C:\Users\Nijraj Gelani\Documents\Visual Studio 2015\Projects\EcomFin\EcomFin\ModelMain.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [ecompub];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Addresses_ToCustomers]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Addresses] DROP CONSTRAINT [FK_Addresses_ToCustomers];
GO
IF OBJECT_ID(N'[dbo].[FK_AttributeValues_ToAttributeNames]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AttributeValues] DROP CONSTRAINT [FK_AttributeValues_ToAttributeNames];
GO
IF OBJECT_ID(N'[dbo].[FK_HasAttribute_ToAttributeValues]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[HasAttribute] DROP CONSTRAINT [FK_HasAttribute_ToAttributeValues];
GO
IF OBJECT_ID(N'[dbo].[FK_HasAttribute_ToProducts]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[HasAttribute] DROP CONSTRAINT [FK_HasAttribute_ToProducts];
GO
IF OBJECT_ID(N'[dbo].[FK_OrderItems_ToOrders]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrderItems] DROP CONSTRAINT [FK_OrderItems_ToOrders];
GO
IF OBJECT_ID(N'[dbo].[FK_OrderItems_ToProducts]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrderItems] DROP CONSTRAINT [FK_OrderItems_ToProducts];
GO
IF OBJECT_ID(N'[dbo].[FK_Orders_ToAddresses]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Orders] DROP CONSTRAINT [FK_Orders_ToAddresses];
GO
IF OBJECT_ID(N'[dbo].[FK_Orders_ToCustomers]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Orders] DROP CONSTRAINT [FK_Orders_ToCustomers];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductImages_ToProducts]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductImages] DROP CONSTRAINT [FK_ProductImages_ToProducts];
GO
IF OBJECT_ID(N'[dbo].[FK_Products_ToCategories]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Products] DROP CONSTRAINT [FK_Products_ToCategories];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Addresses]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Addresses];
GO
IF OBJECT_ID(N'[dbo].[Admins]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Admins];
GO
IF OBJECT_ID(N'[dbo].[AttributeNames]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AttributeNames];
GO
IF OBJECT_ID(N'[dbo].[AttributeValues]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AttributeValues];
GO
IF OBJECT_ID(N'[dbo].[Categories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Categories];
GO
IF OBJECT_ID(N'[dbo].[Configurations]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Configurations];
GO
IF OBJECT_ID(N'[dbo].[Customers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Customers];
GO
IF OBJECT_ID(N'[dbo].[HasAttribute]', 'U') IS NOT NULL
    DROP TABLE [dbo].[HasAttribute];
GO
IF OBJECT_ID(N'[dbo].[OrderItems]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OrderItems];
GO
IF OBJECT_ID(N'[dbo].[Orders]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Orders];
GO
IF OBJECT_ID(N'[dbo].[ProductImages]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductImages];
GO
IF OBJECT_ID(N'[dbo].[Products]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Products];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Addresses'
CREATE TABLE [dbo].[Addresses] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Customer] int  NULL,
    [LineOne] nvarchar(128)  NULL,
    [Street] nvarchar(128)  NULL,
    [City] nvarchar(50)  NULL,
    [State] nvarchar(50)  NULL,
    [Country] nvarchar(50)  NULL,
    [ZIP] nvarchar(8)  NULL
);
GO

-- Creating table 'Admins'
CREATE TABLE [dbo].[Admins] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Username] nvarchar(128)  NULL,
    [Password] nvarchar(128)  NULL
);
GO

-- Creating table 'AttributeNames'
CREATE TABLE [dbo].[AttributeNames] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NULL
);
GO

-- Creating table 'AttributeValues'
CREATE TABLE [dbo].[AttributeValues] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Attribute] int  NULL,
    [Value] nvarchar(128)  NULL
);
GO

-- Creating table 'Categories'
CREATE TABLE [dbo].[Categories] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(128)  NULL
);
GO

-- Creating table 'Configurations'
CREATE TABLE [dbo].[Configurations] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Key] nvarchar(128)  NULL,
    [Value] nvarchar(256)  NULL
);
GO

-- Creating table 'Customers'
CREATE TABLE [dbo].[Customers] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(128)  NULL,
    [Email] nvarchar(256)  NULL,
    [Password] nvarchar(129)  NULL,
    [RegisteredOn] datetime  NULL
);
GO

-- Creating table 'OrderItems'
CREATE TABLE [dbo].[OrderItems] (
    [Order] int  NOT NULL,
    [Product] int  NOT NULL,
    [Quantity] int  NULL,
    [Price] decimal(19,4)  NULL
);
GO

-- Creating table 'Orders'
CREATE TABLE [dbo].[Orders] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Customer] int  NULL,
    [PlacedOn] datetime  NULL,
    [StatusCode] nvarchar(50)  NULL,
    [DeliverTo] int  NULL
);
GO

-- Creating table 'ProductImages'
CREATE TABLE [dbo].[ProductImages] (
    [Product] int  NOT NULL,
    [URL] nvarchar(256)  NOT NULL
);
GO

-- Creating table 'Products'
CREATE TABLE [dbo].[Products] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Category] int  NULL,
    [Name] nvarchar(128)  NULL,
    [Description] nvarchar(512)  NULL,
    [Quantity] int  NULL,
    [MeasuredIn] nvarchar(64)  NULL,
    [Price] decimal(19,4)  NULL
);
GO

-- Creating table 'HasAttribute'
CREATE TABLE [dbo].[HasAttribute] (
    [AttributeValues_Id] int  NOT NULL,
    [Products_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Addresses'
ALTER TABLE [dbo].[Addresses]
ADD CONSTRAINT [PK_Addresses]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Admins'
ALTER TABLE [dbo].[Admins]
ADD CONSTRAINT [PK_Admins]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'AttributeNames'
ALTER TABLE [dbo].[AttributeNames]
ADD CONSTRAINT [PK_AttributeNames]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'AttributeValues'
ALTER TABLE [dbo].[AttributeValues]
ADD CONSTRAINT [PK_AttributeValues]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Categories'
ALTER TABLE [dbo].[Categories]
ADD CONSTRAINT [PK_Categories]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Configurations'
ALTER TABLE [dbo].[Configurations]
ADD CONSTRAINT [PK_Configurations]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Customers'
ALTER TABLE [dbo].[Customers]
ADD CONSTRAINT [PK_Customers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Order], [Product] in table 'OrderItems'
ALTER TABLE [dbo].[OrderItems]
ADD CONSTRAINT [PK_OrderItems]
    PRIMARY KEY CLUSTERED ([Order], [Product] ASC);
GO

-- Creating primary key on [Id] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [PK_Orders]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Product], [URL] in table 'ProductImages'
ALTER TABLE [dbo].[ProductImages]
ADD CONSTRAINT [PK_ProductImages]
    PRIMARY KEY CLUSTERED ([Product], [URL] ASC);
GO

-- Creating primary key on [Id] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [PK_Products]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [AttributeValues_Id], [Products_Id] in table 'HasAttribute'
ALTER TABLE [dbo].[HasAttribute]
ADD CONSTRAINT [PK_HasAttribute]
    PRIMARY KEY CLUSTERED ([AttributeValues_Id], [Products_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Customer] in table 'Addresses'
ALTER TABLE [dbo].[Addresses]
ADD CONSTRAINT [FK_Addresses_ToCustomers]
    FOREIGN KEY ([Customer])
    REFERENCES [dbo].[Customers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Addresses_ToCustomers'
CREATE INDEX [IX_FK_Addresses_ToCustomers]
ON [dbo].[Addresses]
    ([Customer]);
GO

-- Creating foreign key on [DeliverTo] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [FK_Orders_ToAddresses]
    FOREIGN KEY ([DeliverTo])
    REFERENCES [dbo].[Addresses]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Orders_ToAddresses'
CREATE INDEX [IX_FK_Orders_ToAddresses]
ON [dbo].[Orders]
    ([DeliverTo]);
GO

-- Creating foreign key on [Attribute] in table 'AttributeValues'
ALTER TABLE [dbo].[AttributeValues]
ADD CONSTRAINT [FK_AttributeValues_ToAttributeNames]
    FOREIGN KEY ([Attribute])
    REFERENCES [dbo].[AttributeNames]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AttributeValues_ToAttributeNames'
CREATE INDEX [IX_FK_AttributeValues_ToAttributeNames]
ON [dbo].[AttributeValues]
    ([Attribute]);
GO

-- Creating foreign key on [Category] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [FK_Products_ToCategories]
    FOREIGN KEY ([Category])
    REFERENCES [dbo].[Categories]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Products_ToCategories'
CREATE INDEX [IX_FK_Products_ToCategories]
ON [dbo].[Products]
    ([Category]);
GO

-- Creating foreign key on [Customer] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [FK_Orders_ToCustomers]
    FOREIGN KEY ([Customer])
    REFERENCES [dbo].[Customers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Orders_ToCustomers'
CREATE INDEX [IX_FK_Orders_ToCustomers]
ON [dbo].[Orders]
    ([Customer]);
GO

-- Creating foreign key on [Order] in table 'OrderItems'
ALTER TABLE [dbo].[OrderItems]
ADD CONSTRAINT [FK_OrderItems_ToOrders]
    FOREIGN KEY ([Order])
    REFERENCES [dbo].[Orders]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Product] in table 'OrderItems'
ALTER TABLE [dbo].[OrderItems]
ADD CONSTRAINT [FK_OrderItems_ToProducts]
    FOREIGN KEY ([Product])
    REFERENCES [dbo].[Products]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderItems_ToProducts'
CREATE INDEX [IX_FK_OrderItems_ToProducts]
ON [dbo].[OrderItems]
    ([Product]);
GO

-- Creating foreign key on [Product] in table 'ProductImages'
ALTER TABLE [dbo].[ProductImages]
ADD CONSTRAINT [FK_ProductImages_ToProducts]
    FOREIGN KEY ([Product])
    REFERENCES [dbo].[Products]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [AttributeValues_Id] in table 'HasAttribute'
ALTER TABLE [dbo].[HasAttribute]
ADD CONSTRAINT [FK_HasAttribute_AttributeValue]
    FOREIGN KEY ([AttributeValues_Id])
    REFERENCES [dbo].[AttributeValues]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Products_Id] in table 'HasAttribute'
ALTER TABLE [dbo].[HasAttribute]
ADD CONSTRAINT [FK_HasAttribute_Product]
    FOREIGN KEY ([Products_Id])
    REFERENCES [dbo].[Products]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_HasAttribute_Product'
CREATE INDEX [IX_FK_HasAttribute_Product]
ON [dbo].[HasAttribute]
    ([Products_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------