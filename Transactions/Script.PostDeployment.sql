/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

IF '$(LoadSampleData)' = 'true'

BEGIN
	
-- ENSURE THERE IS NO DATA IN THE TABLES BEFORE DEPLOYING SAMPLE DATA -- 
DELETE FROM Log;
DELETE FROM Account;

-- INSERT SAMPLE DATA --
INSERT INTO Account (AcctNo, Fname, Lname, CreditLimit, Balance) VALUES
(9633324, 'Richard', 'Sims', -42, 42),
(987654321, 'Drizzt', 'DoUrden', -20, 20),
(123456789, 'Elminster', 'Aumar', -9000, 9001),
(555333555, 'Minsc', 'and Boo', -3, 99);

INSERT INTO Log (OrigAcct, LogDateTime, RecAcct, Amount) VALUES
(9633324, DATEADD(minute, -1, GETUTCDATE()), 555333555, 2),
(987654321, DATEADD(minute, -2, GETUTCDATE()), 123456789, 19),
(123456789, DATEADD(minute, -3, GETUTCDATE()), 9633324, 100),
(555333555, DATEADD(minute, -4, GETUTCDATE()), 9633324, 4.79);

END;