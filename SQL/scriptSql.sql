create database myTask
USE [ myTask]
GO
/****** Object:  Table [dbo].[Task]    Script Date: 10/12/2020 16:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task](
	[code] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](25) NULL,
	[description] [varchar](25) NULL,
	[status] [varchar](25) NULL,
	[startDate] [date] NULL,
	[endDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[addTask]    Script Date: 10/12/2020 16:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[addTask] @code int, @name varchar(100),@description varchar(100),@status varchar(100),@startDate date,@endDate date
AS
BEGIN

insert into Task([name],[description],[status],[startDate],[endDate])
output
inserted.*
values (@name ,@description ,@status ,@startDate, @endDate)
END
GO
/****** Object:  StoredProcedure [dbo].[deletTask]    Script Date: 10/12/2020 16:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deletTask] @code int
AS
BEGIN

delete from [dbo].[Task]
where [code] =  @code
END
GO
/****** Object:  StoredProcedure [dbo].[getallarrTask]    Script Date: 10/12/2020 16:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[getallarrTask]
as
BEGIN
select *
from [dbo].[Task]
end
GO
/****** Object:  StoredProcedure [dbo].[getallarrTaskById]    Script Date: 10/12/2020 16:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[getallarrTaskById] @code int
as
BEGIN
select *
from [dbo].[Task]
where [code]=@code
end
GO
/****** Object:  StoredProcedure [dbo].[update]    Script Date: 10/12/2020 16:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[update] @code int, @name varchar(100),@description varchar(100),@status varchar(100),@startDate date,@endDate date
AS
BEGIN
update [dbo].[Task]
set [name]=@name, [description]=@description,[status]=@status ,[startDate]=@startDate ,[endDate]=@endDate 
where [code]=@code
end
GO
