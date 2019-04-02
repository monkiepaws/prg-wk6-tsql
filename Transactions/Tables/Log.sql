CREATE TABLE [dbo].[Log]
(
	[OrigAcct] INT NOT NULL,
	[LogDateTime] DATETIME NOT NULL,
	[RecAcct] INT NULL,
	[Amount] MONEY NOT NULL, 
    CONSTRAINT [FK_Log_To_Account_OrigAcct] FOREIGN KEY ([OrigAcct]) REFERENCES [Account]([AcctNo]),
	CONSTRAINT [FK_Log_To_Account_RecAcct] FOREIGN KEY ([RecAcct]) REFERENCES [Account]([AcctNo]),
	CONSTRAINT [PK_Log] PRIMARY KEY ([OrigAcct], [LogDateTime])
)
