/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.5026)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDetails]') AND type in (N'U'))
ALTER TABLE [dbo].[UserDetails] DROP CONSTRAINT IF EXISTS [FK_UserDetails_AspNetUsers]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OpenPositions]') AND type in (N'U'))
ALTER TABLE [dbo].[OpenPositions] DROP CONSTRAINT IF EXISTS [FK_OpenPositions_Positions]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OpenPositions]') AND type in (N'U'))
ALTER TABLE [dbo].[OpenPositions] DROP CONSTRAINT IF EXISTS [FK_OpenPositions_Locations]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Locations]') AND type in (N'U'))
ALTER TABLE [dbo].[Locations] DROP CONSTRAINT IF EXISTS [FK_Locations_UserDetails]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Applications]') AND type in (N'U'))
ALTER TABLE [dbo].[Applications] DROP CONSTRAINT IF EXISTS [FK_Applications_UserDetails]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Applications]') AND type in (N'U'))
ALTER TABLE [dbo].[Applications] DROP CONSTRAINT IF EXISTS [FK_Applications_OpenPositions]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Applications]') AND type in (N'U'))
ALTER TABLE [dbo].[Applications] DROP CONSTRAINT IF EXISTS [FK_Applications_ApplicationStatus]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 10/16/2020 2:40:49 PM ******/
DROP TABLE IF EXISTS [dbo].[UserDetails]
GO
/****** Object:  Table [dbo].[Positions]    Script Date: 10/16/2020 2:40:49 PM ******/
DROP TABLE IF EXISTS [dbo].[Positions]
GO
/****** Object:  Table [dbo].[OpenPositions]    Script Date: 10/16/2020 2:40:49 PM ******/
DROP TABLE IF EXISTS [dbo].[OpenPositions]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 10/16/2020 2:40:49 PM ******/
DROP TABLE IF EXISTS [dbo].[Locations]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 10/16/2020 2:40:49 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 10/16/2020 2:40:49 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 10/16/2020 2:40:49 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 10/16/2020 2:40:49 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 10/16/2020 2:40:49 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[ApplicationStatus]    Script Date: 10/16/2020 2:40:49 PM ******/
DROP TABLE IF EXISTS [dbo].[ApplicationStatus]
GO
/****** Object:  Table [dbo].[Applications]    Script Date: 10/16/2020 2:40:49 PM ******/
DROP TABLE IF EXISTS [dbo].[Applications]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 10/16/2020 2:40:49 PM ******/
DROP TABLE IF EXISTS [dbo].[__MigrationHistory]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 10/16/2020 2:40:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Applications]    Script Date: 10/16/2020 2:40:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Applications]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Applications](
	[ApplicationID] [int] IDENTITY(1,1) NOT NULL,
	[OpenPositionID] [int] NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[ApplicationDate] [date] NOT NULL,
	[ManagerNotes] [varchar](2000) NULL,
	[ApplicationStatus] [int] NOT NULL,
	[ResumeFilename] [varchar](75) NOT NULL,
 CONSTRAINT [PK_Applications] PRIMARY KEY CLUSTERED 
(
	[ApplicationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ApplicationStatus]    Script Date: 10/16/2020 2:40:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ApplicationStatus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ApplicationStatus](
	[ApplicationStatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [varchar](50) NOT NULL,
	[StatusDescription] [varchar](250) NULL,
 CONSTRAINT [PK_ApplicationStatus] PRIMARY KEY CLUSTERED 
(
	[ApplicationStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 10/16/2020 2:40:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 10/16/2020 2:40:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 10/16/2020 2:40:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 10/16/2020 2:40:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 10/16/2020 2:40:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 10/16/2020 2:40:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Locations]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Locations](
	[LocationID] [int] IDENTITY(1,1) NOT NULL,
	[StoreNumber] [varchar](10) NOT NULL,
	[City] [varchar](50) NULL,
	[State] [char](2) NOT NULL,
	[ManagerID] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[OpenPositions]    Script Date: 10/16/2020 2:40:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OpenPositions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OpenPositions](
	[OpenPositionID] [int] IDENTITY(1,1) NOT NULL,
	[PositionID] [int] NOT NULL,
	[LocationID] [int] NOT NULL,
 CONSTRAINT [PK_OpenPositions] PRIMARY KEY CLUSTERED 
(
	[OpenPositionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Positions]    Script Date: 10/16/2020 2:40:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Positions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Positions](
	[PositionID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[JobDescription] [varchar](max) NULL,
 CONSTRAINT [PK_Positions] PRIMARY KEY CLUSTERED 
(
	[PositionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 10/16/2020 2:40:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserDetails](
	[UserID] [nvarchar](128) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[ResumeFilename] [varchar](75) NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202010152048532_InitialCreate', N'FSWD_JobBoard.UI.MVC.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5C5B6FE336167E5F60FF83A0A7DD456AE5D219CC06768B8C13EFA69D5C304E66F72DA025DA1146A254894A1314FD657DE84FEA5FE8A144DD78D1C5566CA71860609187DF393C3C240F0F0FF3C76FBF8FBF7FF63DE30947B11B908979343A340D4CECC071C96A622674F9CD07F3FBEFFEFEB7F185E33F1B5F72BA1346072D493C311F290D4F2D2BB61FB18FE291EFDA5110074B3AB203DF424E601D1F1EFEDB3A3AB2304098806518E3CF09A1AE8FD30FF89C06C4C6214D90771538D88B7939D4CC5354E31AF9380E918D27E66CFEBFF3871F82C5C70045CEE8FE7274F5653ACA9A99C699E72210698EBDA5692042028A28087C7A1FE3398D02B29A875080BCBB971003DD127931E61D392DC9BBF6E9F098F5C92A1BE6507612D3C0EF097874C2956489CDD752B5592811D47801EAA62FACD7A92A27E6A583D3A2CF81070A10199E4EBD88114FCCAB82C5591C5E633ACA1B8E32C85904703F07D1D75115F1C0E8DCEEA030AAE3D121FB77604C138F26119E109CD0087907C66DB2F05CFB47FC72177CC5647272B4589E7C78F71E3927EFBFC527EFAA3D85BE025DAD008A6EA320C411C8869745FF4DC3AAB7B3C48645B34A9B4C2B604B303F4CE30A3D7FC264451F61E61C7F308D99FB8C9DBC841BD73D71613A41231A25F0799D781E5A78B8A8B71A79B2FF1BB81EBF7B3F08D76BF4E4AED2A117F8C3C489605E7DC65E5A1B3FBA6136BD6AE3FDC0C96651E0B3EFBA7D65B50FF320896CD699404B7287A215A675E9C65669BC9D4C9A410D6FD639EAFE9B369354366F2529EBD03A332167B1EDD990CBFBBA7C3B5BDC5918C2E0A5A6C534D264700DBBD64880393054C4A5311D753526029DFC2BAF8D173E72BD0116C70E5CC04159BA918F8B5E7E0CC01411E92DF32D8A63581B9CFFA2F8B14174F83980E8736C271198EC9C223F7C756EB78F01C1D789BF6033617BBC061B9ABB9F8319B269105D10D66A63BC4F81FD3548E80571CE11C5F7D4CE01D9E79DEB770718449C33DBC6713C0363C6CE3400FF3B07BC24F4E4B8371C5BA976ED9C4C3DE4FA6AEF4458531F72D2D2435153485E8A864CE5A93489FA2958B9A49BA839A95ED48CA255544ED6575406D64D524EA9173425689533A31ACCF74B476878E72F85DD7FEF6FB3CD5BB71654D438871512FF07131CC132E6DC224A7144CA11E8B26EECC25948878F317DF5BD29E5F40579C9D0ACD69A0DE92230FC6C4861F77F36A46242F193EB30AFA4C391282706F84EF4EAD356FB9C1324DBF674A87573DBCCB7B306E8A6CB591C07B69BCE0245308C8732EAF2830F67B4C735B2DE88B111E81818BACBB63C2881BE99A251DD9073EC618A8D333B0B164E516C2347562374C8E92158BEA32A042B632475E1FE25F1044BC7116B84D821288699EA122A4F0B97D86E88BC562D092D3B6E61ACEF050FB1E61C87983086AD9AE8C25C1D126102147C844169D3D0D8AA585CB3216ABC56DD98B7B9B0E5B84B918AADD8648BEFACB14BEEBFBD8A61366B6C0BC6D9AC922E0268C37BBB30507E56E96A00E2C165DF0C543831690C94BB545B31D0BAC67660A07595BC3903CD8EA85DC75F38AFEE9B79D60FCADBDFD61BD5B503DBACE963CF4C33F33DA10D85163892CDF37CC12AF133551CCE404E7E3E8BB9AB2B9A08039F635A0FD994FEAED20FB59A4144236A022C0DAD05945F0C4A40D284EA215C1ECB6B948E7B113D60F3B85B232C5FFB05D88A0DC8D8D50BD20AA1FE1A5534CE4EA78FA26785354846DEE9B050C1511884B878D53BDE4129BAB8ACAC982EBE701F6FB8D2313E180D0A6AF15C354ACA3B33B89672D36CD792CA21EBE3926DA425C17DD26829EFCCE05AE236DAAE248553D0C32DD84845F52D7CA0C996473A8ADDA6A81B5B5902152F185B9A4CABF1150A4397AC2A9957BCC498676957D36FE6FDD390FC0CC3B263453652216DC18906115A61A1165883A433378AE939A26881589C67EAF81299726FD52CFF39CBEAF6290F62BE0FE4D4EC77D6A2E93ABFB6E9CA5E09079B41577DE6DAA4F1748521A89B1B2C250E79285284F0A78197F844EF69E95B671779D5F659898C30B604F9254F4A529BE4EFD6C7A0D308C9B363E8D12A3C9AF5474C0FA1D37BEE8F5635AFF351F52879C8AA8AA20B63ED6C0475AECD7AA326BA8FFD07AD15E175661ACF59A902F0A29E1895B40709AC52D71DB59E9952C5ACD7744714D24FAA9042550F29AB49263521AB156BE16934AAA6E8CE414E2BA9A2CBB5DD91150926556845F51AD80A99C5BAEEA88A1C942AB0A2BA3B76999022AEA67BBC97690F359B6F66D90178B3DD4C83F13A4BE3309B61E59EBF0A5429EE89C56FF225305EBE9766A53D056E6E5659006433B3D260E8D7A2DA55797D296ABCDFD763D6EEBF6BCB7DD3FDBF1EAF9FF1BEAA8948A74191A4E05E9C0A85D3DF989FC4DA1FE34847B38CC4347235C256FF1253EC8F18C168FE9337F55CCC16F69CE00A117789639AE57C98C78747C7C2339EFD795263C5B1E3294EB2BA7735F531DB42FA16794291FD882239996283672725A814A7BE240E7E9E98BFA4AD4ED39007FB95161F1897F13D717F4AA0E22E4AB0F1AB9C1C3A4C1A7E87871F85A0BFBE891715DD557EF9FF87ACE9817113C1743A350E0545AF33FCF57716BDA4C99A6E20CDDAAF2FDEEE6CAB3D6450A20AB365FD770B0B970EF2662197F21F3E7AFE675FD194EF12364254BC3D180A6F1015EADE16AC83A57D57E0C0274DDF15F4EBACFA9DC13AA269DF18B8A43F98F8C2A0FB3294B7DCE13EA438396D63494AF5DC9AA1BD51BAE6AEF72629917BA3892E276BF7801B34217B3317E58D253A0FB6752AF29807C3DEA5DDBF7AF2F2BEE42B974EFB6ED394B79999DC70D7F4974A48DE83143A454AD0EED38EB76D6BBA50F09EE76EF64B2EDE3363E3DBFCEE5388B76D6CBA00F19E1B5BAF44E13DB3B55DED9F3BB6B4CE5BE8CED37EE50C26CD958E2A8ADC96D69B85DCE1F8BF08C008328F327B8DA9CE236BCA816D615892E899EA13D844C6D2C491F84A14CD6CFBF5956FF88D9DE534CD6C35699F4DBCF9FADFC89BD334F3D62453EE22215999CEA84A126F59C79A32ABDE520272AD272DF9EE6D3E6BE3FDFC5BCA371E4429B5D9A3B95D7E3BE9C583A864C8A9D3239D58BE2886BDB3F2B71D61FF8EDD5509C1FED223C1766DD72C682EC932C8376F41A29C4488D05C618A1CD852CF22EA2E914DA19A05A0D3E7E469508F5D832CB073496E121A2614BA8CFD85570B783127A0897F9A335D97797C13B2AF78882E80982E0BDCDF908F89EB3985DC33454C4803C1BC0B1EEE65634959D877F552205D07A42310575FE114DD613FF4002CBE2173F484D7910DCCEF135E21FBA58C00EA40DA07A2AEF6F1B98B5611F2638E51B6874FB061C77FFEEE4FCE747654E2540000, N'6.2.0-61023')
SET IDENTITY_INSERT [dbo].[ApplicationStatus] ON 

INSERT [dbo].[ApplicationStatus] ([ApplicationStatusID], [StatusName], [StatusDescription]) VALUES (1, N'Received', N'Your application has been received for processing.')
INSERT [dbo].[ApplicationStatus] ([ApplicationStatusID], [StatusName], [StatusDescription]) VALUES (2, N'Referred', N'You are among the best qualified candidates and have been referred for the next step in the selection process.')
INSERT [dbo].[ApplicationStatus] ([ApplicationStatusID], [StatusName], [StatusDescription]) VALUES (3, N'Not Referred', N'Sorry, you were not among the best qualified candidates and have not been referred for consideration.')
INSERT [dbo].[ApplicationStatus] ([ApplicationStatusID], [StatusName], [StatusDescription]) VALUES (4, N'Incomplete', N'Your application was rejected as incomplete. You may not have included all of the necessary documents.')
SET IDENTITY_INSERT [dbo].[ApplicationStatus] OFF
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'80a554d4-317b-446b-b589-69b9946f8693', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'72e42254-5e52-412e-b18f-28a9fea412c3', N'Employee')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'0d653a19-8916-4069-9fc0-3b7f60208a77', N'Manager')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'096712a1-6695-4865-867c-22c2742fe868', N'72e42254-5e52-412e-b18f-28a9fea412c3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0ffae5b0-75c4-4101-908b-f2fc78f03d03', N'72e42254-5e52-412e-b18f-28a9fea412c3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'4ee04657-1518-4ea8-968a-4edb8346b69a', N'72e42254-5e52-412e-b18f-28a9fea412c3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3edfcbc0-8533-45a8-867a-00d48c917e57', N'80a554d4-317b-446b-b589-69b9946f8693')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'096712a1-6695-4865-867c-22c2742fe868', N'employee02@example.com', 0, N'AH8JeKPXvY1thtZ52fsCc/7+LirowUiC/9MgFA/9byFBCN8rc1t+fm+3dc+zr8n12w==', N'451198bf-828a-46db-8e05-6aca056341c5', NULL, 0, 0, NULL, 1, 0, N'employee02@example.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'0ffae5b0-75c4-4101-908b-f2fc78f03d03', N'employee3@example.com', 0, N'ACRftm+6n2oDAomvrsIqK7exTpqzUNUInuma6Hjs7q28GLEMdfcW9euG26+9VBoznA==', N'c9d8d3a9-4ae8-449f-a3ee-c1cca843b6b7', NULL, 0, 0, NULL, 1, 0, N'employee3@example.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'3edfcbc0-8533-45a8-867a-00d48c917e57', N'admin@example.com', 0, N'AHVpzPpn7BhtW1LmUba7pHb/3g7X4NdrEKSCwAdCEAYEvv1jFEnx2524/wHIHjBFgQ==', N'29cf1658-1029-4911-96d4-96a4f0438b87', NULL, 0, 0, NULL, 0, 0, N'admin@example.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'4ee04657-1518-4ea8-968a-4edb8346b69a', N'employee01@example.com', 0, N'AFisAiQkAXRX7AxVRRMB2yGF+ux2KmLHh5LdqUgJKdbrtPQna1ShhesyCKxoznJ0jQ==', N'3da1ea1a-ebdc-4f31-a3df-c6b8b0a7acc0', NULL, 0, 0, NULL, 1, 0, N'employee01@example.com')
SET IDENTITY_INSERT [dbo].[Positions] ON 

INSERT [dbo].[Positions] ([PositionID], [Title], [JobDescription]) VALUES (1, N'Call Center Representative', N'Answering or making calls to clients to learn about and address their needs, complaints, or other issues with products or services. Responding efficiently and accurately to callers, explaining possible solutions, and ensuring that clients feel supported and valued.')
INSERT [dbo].[Positions] ([PositionID], [Title], [JobDescription]) VALUES (2, N'Call Center Supervisor', N'Hires, trains, and prepares call center representatives to respond to customer questions and complaints and troubleshoot problems with services or products. Ensuring agents understand and comply with all call center objectives, performance standards, and policies.')
INSERT [dbo].[Positions] ([PositionID], [Title], [JobDescription]) VALUES (3, N'Junior Developer', N'Works on a development team writing and maintaining code for computer applications. Attending and contributing to development team meetings, troubleshooting, patching computer code, and collaborating with other developers to create applications.')
INSERT [dbo].[Positions] ([PositionID], [Title], [JobDescription]) VALUES (4, N'Senior Developer', N'Identifies user and system requirements for new websites and applications. Prioritizes software development projects, sets timelines and assigns tasks to team members. Creates wireframes to decide on layout. Writes or reviews code for various applications.')
INSERT [dbo].[Positions] ([PositionID], [Title], [JobDescription]) VALUES (5, N'HR Assistant', N'Assists HR managers with recruitment, records maintenance and payroll processing, and provides clerical support to all employees.')
INSERT [dbo].[Positions] ([PositionID], [Title], [JobDescription]) VALUES (6, N'HR Manager', N'Leads and directs the routine functions of the Human Resources (HR) department including hiring and interviewing staff, administering pay, benefits, and leave, and enforcing company policies and practices.')
SET IDENTITY_INSERT [dbo].[Positions] OFF
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName], [ResumeFilename]) VALUES (N'096712a1-6695-4865-867c-22c2742fe868', N'Employee', N'02', N'41192146-99de-4032-9082-8e0ecfec3cac.pdf')
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName], [ResumeFilename]) VALUES (N'0ffae5b0-75c4-4101-908b-f2fc78f03d03', N'Employee', N'03', N'28caa9b6-09ef-423f-b84d-f2568263947a.pdf')
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName], [ResumeFilename]) VALUES (N'3edfcbc0-8533-45a8-867a-00d48c917e57', N'Anthony', N'Evans', N'anthonysresume.pdf')
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName], [ResumeFilename]) VALUES (N'4ee04657-1518-4ea8-968a-4edb8346b69a', N'Employee', N'01', N'89615f18-0b26-4cfb-8ad6-c61a15445d95.pdf')
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Applications_ApplicationStatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[Applications]'))
ALTER TABLE [dbo].[Applications]  WITH CHECK ADD  CONSTRAINT [FK_Applications_ApplicationStatus] FOREIGN KEY([ApplicationStatus])
REFERENCES [dbo].[ApplicationStatus] ([ApplicationStatusID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Applications_ApplicationStatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[Applications]'))
ALTER TABLE [dbo].[Applications] CHECK CONSTRAINT [FK_Applications_ApplicationStatus]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Applications_OpenPositions]') AND parent_object_id = OBJECT_ID(N'[dbo].[Applications]'))
ALTER TABLE [dbo].[Applications]  WITH CHECK ADD  CONSTRAINT [FK_Applications_OpenPositions] FOREIGN KEY([OpenPositionID])
REFERENCES [dbo].[OpenPositions] ([OpenPositionID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Applications_OpenPositions]') AND parent_object_id = OBJECT_ID(N'[dbo].[Applications]'))
ALTER TABLE [dbo].[Applications] CHECK CONSTRAINT [FK_Applications_OpenPositions]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Applications_UserDetails]') AND parent_object_id = OBJECT_ID(N'[dbo].[Applications]'))
ALTER TABLE [dbo].[Applications]  WITH CHECK ADD  CONSTRAINT [FK_Applications_UserDetails] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserDetails] ([UserID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Applications_UserDetails]') AND parent_object_id = OBJECT_ID(N'[dbo].[Applications]'))
ALTER TABLE [dbo].[Applications] CHECK CONSTRAINT [FK_Applications_UserDetails]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Locations_UserDetails]') AND parent_object_id = OBJECT_ID(N'[dbo].[Locations]'))
ALTER TABLE [dbo].[Locations]  WITH CHECK ADD  CONSTRAINT [FK_Locations_UserDetails] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[UserDetails] ([UserID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Locations_UserDetails]') AND parent_object_id = OBJECT_ID(N'[dbo].[Locations]'))
ALTER TABLE [dbo].[Locations] CHECK CONSTRAINT [FK_Locations_UserDetails]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OpenPositions_Locations]') AND parent_object_id = OBJECT_ID(N'[dbo].[OpenPositions]'))
ALTER TABLE [dbo].[OpenPositions]  WITH CHECK ADD  CONSTRAINT [FK_OpenPositions_Locations] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Locations] ([LocationID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OpenPositions_Locations]') AND parent_object_id = OBJECT_ID(N'[dbo].[OpenPositions]'))
ALTER TABLE [dbo].[OpenPositions] CHECK CONSTRAINT [FK_OpenPositions_Locations]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OpenPositions_Positions]') AND parent_object_id = OBJECT_ID(N'[dbo].[OpenPositions]'))
ALTER TABLE [dbo].[OpenPositions]  WITH CHECK ADD  CONSTRAINT [FK_OpenPositions_Positions] FOREIGN KEY([PositionID])
REFERENCES [dbo].[Positions] ([PositionID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OpenPositions_Positions]') AND parent_object_id = OBJECT_ID(N'[dbo].[OpenPositions]'))
ALTER TABLE [dbo].[OpenPositions] CHECK CONSTRAINT [FK_OpenPositions_Positions]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserDetails_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserDetails]'))
ALTER TABLE [dbo].[UserDetails]  WITH CHECK ADD  CONSTRAINT [FK_UserDetails_AspNetUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserDetails_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserDetails]'))
ALTER TABLE [dbo].[UserDetails] CHECK CONSTRAINT [FK_UserDetails_AspNetUsers]
GO
