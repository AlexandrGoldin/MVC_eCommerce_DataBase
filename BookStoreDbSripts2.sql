USE [master]
GO
/****** Object:  Database [BookStoreDb]    Script Date: 22.05.2023 20:00:28 ******/
CREATE DATABASE [BookStoreDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookStoreDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BookStoreDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BookStoreDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BookStoreDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BookStoreDb] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookStoreDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookStoreDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookStoreDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookStoreDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookStoreDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookStoreDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookStoreDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BookStoreDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookStoreDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookStoreDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookStoreDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookStoreDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookStoreDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookStoreDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookStoreDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookStoreDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BookStoreDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookStoreDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookStoreDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookStoreDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookStoreDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookStoreDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookStoreDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookStoreDb] SET RECOVERY FULL 
GO
ALTER DATABASE [BookStoreDb] SET  MULTI_USER 
GO
ALTER DATABASE [BookStoreDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookStoreDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookStoreDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookStoreDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BookStoreDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BookStoreDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BookStoreDb', N'ON'
GO
ALTER DATABASE [BookStoreDb] SET QUERY_STORE = ON
GO
ALTER DATABASE [BookStoreDb] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BookStoreDb]
GO
/****** Object:  Table [dbo].[CartItems]    Script Date: 22.05.2023 20:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK_CartItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 22.05.2023 20:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[Total] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 22.05.2023 20:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Author] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Genre] [nvarchar](max) NULL,
	[Rating] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CartItems] ON 
GO
INSERT [dbo].[CartItems] ([Id], [OrderId], [ProductId], [Count]) VALUES (1, 1, 11, 2)
GO
INSERT [dbo].[CartItems] ([Id], [OrderId], [ProductId], [Count]) VALUES (2, 2, 1, 2)
GO
INSERT [dbo].[CartItems] ([Id], [OrderId], [ProductId], [Count]) VALUES (3, 2, 8, 2)
GO
INSERT [dbo].[CartItems] ([Id], [OrderId], [ProductId], [Count]) VALUES (4, 3, 7, 1)
GO
INSERT [dbo].[CartItems] ([Id], [OrderId], [ProductId], [Count]) VALUES (5, 3, 20, 1)
GO
INSERT [dbo].[CartItems] ([Id], [OrderId], [ProductId], [Count]) VALUES (6, 3, 2, 1)
GO
SET IDENTITY_INSERT [dbo].[CartItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 
GO
INSERT [dbo].[Orders] ([Id], [Email], [Name], [Address], [OrderDate], [Total]) VALUES (1, N'm.1@mail.com', N'test_1', N'Somewhere 1', CAST(N'2022-04-11T19:53:09.6008235' AS DateTime2), CAST(798.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Orders] ([Id], [Email], [Name], [Address], [OrderDate], [Total]) VALUES (2, N'm.2@mail.com', N'test_2', N'Somewhere 2', CAST(N'2022-04-11T19:54:03.9315196' AS DateTime2), CAST(2250.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Orders] ([Id], [Email], [Name], [Address], [OrderDate], [Total]) VALUES (3, N'm.3@mail.com', N'test_3', N'Somewhere 3', CAST(N'2022-04-11T19:55:54.2104799' AS DateTime2), CAST(1229.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (1, N'Происхождение', N'Дэн Браун', N'https://cv9.litres.ru/pub/c/elektronnaya-kniga/cover_330/27624091-den-braun-proishozhdenie.jpg', CAST(710.00 AS Decimal(18, 2)), N'Детектив', 3, N'Роберт Лэнгдон прибывает в музей Гуггенхайма в Бильбао по приглашению друга и бывшего студента Эдмонда Кирша. Миллиардер и компьютерный гуру, он известен своими удивительными открытиями и предсказаниями. И этим вечером Кирш собирается «перевернуть все современные научные представления о мире», дав ответ на два главных вопроса, волнующих человечество на протяжении всей истории:Откуда мы? Что нас ждет?')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (2, N'Чудовище Карнохельма', N'Марина Суржевская', N'https://cv9.litres.ru/pub/c/elektronnaya-kniga/cover_330/48827396-marina-surzhevskaya-22364624-chudovische-karnohelma.jpg', CAST(399.00 AS Decimal(18, 2)), N'Фэнтези', 5, N'Тысячелетие назад Великий Туман разделил наш мир на цивилизованную Конфедерацию и дикие фьорды. В загадочные земли теперь можно попасть лишь одним способом – стать невестой для ильха-варвара. И я, Энни Вилсон, с удовольствием воспользовалась этой возможностью! Ведь все, чего я хотела – это обрести счастье с добрым и сильным мужем, пекарем из далекого Варисфольда. Вот только мечтам не суждено сбыться, ведь меня украли с собственного обручения! Так я узнала страшную тайну фьордов и оказалась в пугающем Карнохельме, где обитает чудовище… Книга третья из цикла ''Мир за Великим Туманом''')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (3, N'Онлайн-влияние', N'Бас Вютерс, Жорис Гроэн', N'https://cv0.litres.ru/pub/c/elektronnaya-kniga/cover_330/65551802-bas-vuters-onlayn-vliyanie-kak-upravlyat-povedeniem-ludey-chtoby-oni-sover.jpg', CAST(499.00 AS Decimal(18, 2)), N'Личная эффективность', 5, N'Как превратить посетителей сайта в покупателей, а случайных интернет-серферов в зарегистрированных пользователей? Грамотное применение поведенческой психологии значительно повышает результативность сайта, приложения или онлайн-кампании. Психолог и веб-дизайнер Жорис Гроэн и гуру убеждения Бас Вютерс подробно объясняют, какие приемы работают, а какие нет и почему. Книга содержит конкретные и легко применимые рекомендации, которые основаны на сорокалетнем практическом опыте работы с онлайн-аудиторией и знаниях наиболее известных современных ученых-бихевиористов, таких как Фогг, Чалдини и Канеман. Это самое полное практическое руководство по проектированию пути онлайн-клиентов к поставленной вами цели, подкрепленное множеством реальных примеров и иллюстраций того, что нужно делать и чего делать не следует.')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (4, N'Подсознание может всё!', N'Джон Кехо', N'https://cv4.litres.ru/pub/c/audiokniga/cover_330/19571848-dzhon-keho-podsoznanie-mozhet-vse-19571848.jpg', CAST(399.00 AS Decimal(18, 2)), N'Личная эффективность', 5, N'Использование огромных резервов, скрытых в подсознании каждого человека, позволяет решать самые сложные повседневные проблемы, когда логика оказывается бессильной. Разработанная автором этой книги программа поможет вам активизировать безграничные ресурсы собственного головного мозга, чтобы изменить свою жизнь к лучшему раз и навсегда. Для широкого круга читателей.')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (5, N'Пищеблок', N'Алексей Иванов', N'https://cv4.litres.ru/pub/c/elektronnaya-kniga/cover_330/39435346-aleksey-ivanov-pischeblok.jpg', CAST(469.00 AS Decimal(18, 2)), N'Современная проза', 4, N'«Жаркое лето 1980 года. Столицу сотрясает Олимпиада, а в небольшом пионерском лагере на берегу Волги всё тихо и спокойно. Пионеры маршируют на линейках, играют в футбол и по ночам рассказывают страшные истории; молодые вожатые влюбляются друг в друга; речной трамвайчик привозит бидоны с молоком, и у пищеблока вертятся деревенские собаки. Но жизнь пионерлагеря, на первый взгляд безмятежная, имеет свою тайную и тёмную сторону. Среди пионеров прячутся вампиры. Их воля и определяет то, что происходит у всех на виду.')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (6, N'Просто Маса', N'Борис Акунин', N'https://cv9.litres.ru/pub/c/elektronnaya-kniga/cover_330/63028197-fredrik-bakman-trevozhnye-ludi.jpg', CAST(549.00 AS Decimal(18, 2)), N'Детектив', 5, N'Похоже, Эраста Фандорина, легендарного сыщика, больше нет в живых. Это значит лишь одно – Масахиро Сибата должен вернуться на родину. Ждала ли его Япония? Сложно сказать. Слишком сильно изменилась Страна Восходящего Солнца. И все же осталась собой, как принцип ваби-саби и «сливовые» дожди в конце мая. Как бы то ни было, Маса вернулся домой. Он оставил в далекой Европе вдову и сына погибшего господина и приехал в Японию, чтобы открыть собственное сыскное агентство, несмотря на почтенный возраст.')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (7, N'Метро 2033', N'Дмитрий Глуховский', N'https://cv9.litres.ru/pub/c/elektronnaya-kniga/cover_330/128391-dmitriy-gluhovskiy-metro-2033.jpg', CAST(415.00 AS Decimal(18, 2)), N'Фантастика', 5, N'Двадцать лет спустя Третьей мировой войны последние выжившие люди прячутся на станциях и в туннелях московского метро, самого большого на Земле противоатомного бомбоубежища. Поверхность планеты заражена и непригодна для обитания, и станции метро становятся последним пристанищем для человека. Они превращаются в независимые города-государства, которые соперничают и воюют друг с другом. Они не готовы примириться даже перед лицом новой страшной опасности, которая угрожает всем людям окончательным истреблением. Артем, двадцатилетний парень со станции ВДНХ, должен пройти через все метро, чтобы спасти свой единственный дом – и все человечество.')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (8, N'Предел', N'Сергей Лукьяненко', N'https://cv1.litres.ru/pub/c/elektronnaya-kniga/cover_330/65061217-sergey-lukyanenko-predel.jpg', CAST(415.00 AS Decimal(18, 2)), N'Фантастика', 5, N'Глубокий космос приоткрыл для человечества завесу своих тайн, а вместе с тем подтвердил давнюю догадку – конечно, во Вселенной есть и другие разумные создания. Просто на разных планетах эволюция выбирала различных существ, чтобы озарить их темные души непрошенной искрой сознания. Вместе с этим потрясающим открытием люди сделали еще одно, ужасающее. Какая-то неведомая сила провоцирует уничтожение развитых цивилизаций. Причины всегда разные – от диких экспериментов до кровопролитных войн. Результат один – гибель миллионов невинных. Чтобы разобраться в происходящем, в отдаленную планетную систему отправляется исследовательский корабль «Твен». Управляет корветом искин Марк, на борту – команда, собранная из разных представителей разумных рас. Делегаты от разных космических цивилизаций объединили усилия, чтобы спасти от разрушения еще одну планету.')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (9, N'Исчезнувшая', N'Гиллиан Флинн', N'https://cv0.litres.ru/pub/c/elektronnaya-kniga/cover_330/6028900-gillian-flinn-ischeznuvshaya.jpg', CAST(249.00 AS Decimal(18, 2)), N'Детектив', 4, N'Все было готово для празднования пятилетнего юбилея супружеской жизни, когда вдруг необъяснимо пропал один из виновников торжества. Остались следы борьбы в доме, кровь, которую явно пытались стереть, – и цепочка «ключей» в игре под названием «охота за сокровищами»; красивая, умная и невероятно изобретательная жена ежегодно устраивала ее для своего обожаемого мужа. И похоже, что эти «ключи» – размещенные ею тут и там странные записки и не менее странные безделушки – дают единственный шанс пролить свет на судьбу исчезнувшей. Вот только не придется ли «охотнику» в процессе поиска раскрыть миру и пару-тройку собственных малосимпатичных тайн?')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (10, N'Цена вопроса. Том 1', N'Александра Маринина', N'https://cv6.litres.ru/pub/c/elektronnaya-kniga/cover_330/22638660-aleksandra-marinina-cena-voprosa-tom-1.jpg', CAST(664.00 AS Decimal(18, 2)), N'Детектив', 4, N'Программа против Cистемы. Системы всесильной и насквозь коррумпированной, на все имеющей цену и при этом ничего неспособной ценить по-настоящему. Возможно ли такое? Генерал МВД Шарков твердо верил, что управляемая им Программа – последний шанс навести порядок в правоохранительных органах. Так было до тех пор, пока не исчез один из ее участников, одержимый радикальными идеями. А затем начались эти странные «парные» убийства… И стало понятно, что если сегодня не остановить убийцу-фанатика, то завтра Программе придет конец. Но какую цену готов заплатить генерал Шарков за дело всей своей жизни? И чего это будет стоить полковнику Большакову и капитану Дзюбе, уже подключившимся к расследованию?')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (11, N'Атлант расправил плечи', N'Айн Рэнд', N'https://cv7.litres.ru/pub/c/elektronnaya-kniga/cover_330/4236675-ayn-rend-atlant-raspravil-plechi.jpg', CAST(399.00 AS Decimal(18, 2)), N'Современная проза', 2, N'К власти в США приходят социалисты и правительство берет курс на «равные возможности», считая справедливым за счет талантливых и состоятельных сделать богатыми никчемных и бесталанных. Гонения на бизнес приводят к разрушению экономики, к тому же один за другим при загадочных обстоятельствах начинают исчезать талантливые люди и лучшие предприниматели. Главные герои романа стальной король Хэнк Риарден и вице-президент железнодорожной компании Дагни Таггерт тщетно пытаются противостоять трагическим событиям. Вместо всеобщего процветания общество погружается в апатию и хаос.')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (12, N'Вторая жизнь Уве', N'Фредрик Бакман', N'https://cv8.litres.ru/pub/c/elektronnaya-kniga/cover_330/20690188-fredrik-bakman-vtoraya-zhizn-uve.jpg', CAST(335.00 AS Decimal(18, 2)), N'Современная проза', 4, N'На первый взгляд Уве – самый угрюмый человек на свете. Он, как и многие из нас, полагает, что его окружают преимущественно идиоты – соседи, которые неправильно паркуют свои машины; продавцы в магазине, говорящие на птичьем языке; бюрократы, портящие жизнь нормальным людям… Но у угрюмого ворчливого педанта – большое доброе сердце. И когда молодая семья новых соседей случайно повреждает его почтовый ящик, это становится началом невероятно трогательной истории об утраченной любви, неожиданной дружбе, бездомных котах и древнем искусстве сдавать назад на автомобиле с прицепом. Истории о том, как сильно жизнь одного человека может повлиять на жизни многих других.')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (13, N'Ведьмак', N'Анджей Сапковский', N'https://cv6.litres.ru/pub/c/elektronnaya-kniga/cover_330/6375365-andzhey-sapkovskiy-vedmak.jpg', CAST(424.00 AS Decimal(18, 2)), N'Фэнтези', 4, N'Перед читателем буквально оживает необычный, прекрасный и жестокий мир литературной легенда, в котором обитают эльфы и гномы, оборотни, вампиры и «низушки»-хоббиты, драконы и монстры, – но прежде всего люди. Очень близкие нам, понятные и человечные люди – такие как мастер меча ведьмак Геральт, его друг, беспутный менестрель Лютик, его возлюбленная, прекрасная чародейка Йеннифэр, и приемная дочь – безрассудно отважная юная Цири…')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (14, N'Девушка во льду', N'Роберт Брындза', N'https://cv3.litres.ru/pub/c/elektronnaya-kniga/cover_330/27351732-robert-bryndza-12646976-devushka-vo-ldu.jpg', CAST(209.00 AS Decimal(18, 2)), N'Детектив', 4, N'В озере одного из парков Лондона, под слоем льда, найдено тело женщины. У жертвы, молодой светской львицы, была, казалось, идеальная жизнь. За расследование берется детектив Эрика Фостер. Она обнаруживает, что убийство связано с похожими преступлениями, где жертвами оказывались молодые девушки, которые были задушены и оставлены в воде.Пока Эрика пытается разобраться в этом странном деле, к ней все ближе и ближе подбирается безжалостный убийца. Для неё стало настоящим испытанием недавняя гибель мужа. Теперь придётся сражаться не только со своими демонами, но и с преступником, более опасным, чем все, с кем она сталкивалась раньше. Сумеет ли она остановить его, прежде чем он нанесет новый удар?')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (15, N'7 навыков высокоэффективных людей', N'Стивен Кови', N'https://cv8.litres.ru/pub/c/elektronnaya-kniga/cover_330/4239285--.jpg', CAST(415.00 AS Decimal(18, 2)), N'Личная эффективность', 5, N'Во-первых, эта книга излагает системный подход к определению жизненных целей, приоритетов человека. Эти цели у всех разные, но книга помогает понять себя и четко сформулировать жизненные цели. Во-вторых, книга показывает, как достигать этих целей. И в-третьих, книга показывает, как каждый человек может стать лучше. Причем речь идет не об изменении имиджа, а о настоящих изменениях, самосовершенствовании. Книга не дает простых решений и не обещает мгновенных чудес. Любые позитивные изменения требуют времени, работы и упорства. Но для людей, стремящихся максимально реализовать потенциал, заложенный в них природой, эта книга – дорожная карта.')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (16, N'iPhuck 10', N'Виктор Пелевин', N'https://cv0.litres.ru/pub/c/elektronnaya-kniga/cover_330/25564903-viktor-pelevin-iphuck-10.jpg', CAST(349.00 AS Decimal(18, 2)), N'Современная проза', 4, N'Порфирий Петрович – литературно-полицейский алгоритм. Он расследует преступления и одновременно пишет об этом детективные романы, зарабатывая средства для Полицейского Управления.Маруха Чо – искусствовед с большими деньгами и баба с яйцами по официальному гендеру. Ее специальность – так называемый «гипс», искусство первой четверти XXI века. Ей нужен помощник для анализа рынка. Им становится взятый в аренду Порфирий.«iPhuck 10» – самый дорогой любовный гаджет на рынке и одновременно самый знаменитый из 244 детективов Порфирия Петровича. Это настоящий шедевр алгоритмической полицейской прозы конца века – энциклопедический роман о будущем любви, искусства и всего остального.')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (17, N'Очаровательный кишечник', N'Джулия Эндерс', N'https://cv7.litres.ru/pub/c/elektronnaya-kniga/cover_extra/72060786-dzhuliya-enders-ocharovatelnyy-kishechnik-kak-samyy-moguschestvennyy-organ.gif', CAST(415.00 AS Decimal(18, 2)), N'Медицина и здоровье', 5, N'Многие стесняются говорить о кишечнике вслух. Может быть, именно поэтому мы так мало знаем о самом могущественном органе, который управляет нашим организмом? Кого-то, возможно, шокирует столь откровенное обращение исследователя к «запретным» темам; кому-то, может быть, покажутся слишком экстремальными опыты на мышах и на пациентах-добровольцах, описанные в книге. Кто-то усомнится во всемогуществе крошечных организмов, контролирующих нашу жизнь. А кому-то предположение, что у кишечника есть свои собственные «мозг» и «нервная система», вообще покажется абсурдным и антинаучным.')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (18, N'Зулейха открывает глаза', N'Гузель Яхина', N'https://cv8.litres.ru/pub/c/elektronnaya-kniga/cover_330/9527389-guzel-yahina-zuleyha-otkryvaet-glaza-9527389.jpg', CAST(349.00 AS Decimal(18, 2)), N'Современная проза', 5, N'Роман «Зулейха открывает глаза» начинается зимой 1930 года в глухой татарской деревне. Крестьянку Зулейху вместе с сотнями других переселенцев отправляют в вагоне-теплушке по извечному каторжному маршруту в Сибирь.Дремучие крестьяне и ленинградские интеллигенты, деклассированный элемент и уголовники, мусульмане и христиане, язычники и атеисты, русские, татары, немцы, чуваши – все встретятся на берегах Ангары, ежедневно отстаивая у тайги и безжалостного государства свое право на жизнь.')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (19, N'Девушка в тумане', N'Донато Карризи', N'https://cv2.litres.ru/pub/c/elektronnaya-kniga/cover_330/27066425-donato-karrizi-devushka-v-tumane.jpg', CAST(249.00 AS Decimal(18, 2)), N'Детектив', 4, N'Затерянный в Альпах сонный городок, рождественский вечер, туман. От дома, где сияют огни елки и лежат подарки, до празднично украшенной местной церкви всего триста метров, но в церкви юная Анна Лу так и не появилась… Вездесущие журналисты, фоторепортеры и телевизионщики осаждают городок. Каждый из них жаждет первым сообщить сенсационные новости о ходе расследования.')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (20, N'1984', N'Джордж Оруэлл', N'https://cv5.litres.ru/pub/c/elektronnaya-kniga/cover_330/50397852--.jpg', CAST(415.00 AS Decimal(18, 2)), N'Фантастика', 5, N'Своеобразный антипод второй великой антиутопии XX века – «О дивный новый мир» Олдоса Хаксли. Что, в сущности, страшнее: доведенное до абсурда «общество потребления» – или доведенное до абсолюта «общество идеи»? По Оруэллу, нет и не может быть ничего ужаснее тотальной несвободы…')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (21, N'Безупречная репутация. Том 1', N'Александра Маринина', N'https://cv6.litres.ru/pub/c/elektronnaya-kniga/cover_330/57306965-aleksandra-marinina-bezuprechnaya-reputaciya-tom-1.jpg', CAST(379.00 AS Decimal(18, 2)), N'Детектив', 5, N'Такого странного дела в практике Анастасии Каменской не было давно. Неизвестному писателю Андрею Кислову крупно повезло. По его единственному роману, изданному за свой счет, хотят снять сериал и предлагают солидный гонорар. Разумеется, тот с радостью соглашается. А потом внезапно объявляет, что не подпишет договор ни на каких условиях. На кону большие деньги, и к выяснению причин столь загадочного отказа привлекают сотрудника частного детективного агентства – Настю Каменскую. Но вскоре та становится главным подозреваемым в деле об убийстве. Конечно, ну а кто же еще! Ведь это она, Настя, грязно домогалась потерпевшего, угрожала ему… Он сам рассказывал об этом перед смертью, да и другие свидетели имеются…')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (22, N'iPhuck 10', N'Виктор Пелевин', N'https://cv0.litres.ru/pub/c/elektronnaya-kniga/cover_330/25564903-viktor-pelevin-iphuck-10.jpg', CAST(349.00 AS Decimal(18, 2)), N'Современная проза', 4, N'Порфирий Петрович – литературно-полицейский алгоритм. Он расследует преступления и одновременно пишет об этом детективные романы, зарабатывая средства для Полицейского Управления.Маруха Чо – искусствовед с большими деньгами и баба с яйцами по официальному гендеру. Ее специальность – так называемый «гипс», искусство первой четверти XXI века. Ей нужен помощник для анализа рынка. Им становится взятый в аренду Порфирий.«iPhuck 10» – самый дорогой любовный гаджет на рынке и одновременно самый знаменитый из 244 детективов Порфирия Петровича. Это настоящий шедевр алгоритмической полицейской прозы конца века – энциклопедический роман о будущем любви, искусства и всего остального.')
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
/****** Object:  Index [IX_CartItems_OrderId]    Script Date: 22.05.2023 20:00:28 ******/
CREATE NONCLUSTERED INDEX [IX_CartItems_OrderId] ON [dbo].[CartItems]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CartItems_ProductId]    Script Date: 22.05.2023 20:00:28 ******/
CREATE NONCLUSTERED INDEX [IX_CartItems_ProductId] ON [dbo].[CartItems]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItems_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItems_Orders_OrderId]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItems_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItems_Products_ProductId]
GO
USE [master]
GO
ALTER DATABASE [BookStoreDb] SET  READ_WRITE 
GO
