-- Forever (Classic 1.60): стартовая зона нежити (Могильник), русские тексты, которых не хватало
-- Можно запускать повторно.


-- 1. Имена и подписи существ
INSERT INTO `creature_template_locale` (`entry`, `locale`, `Name`, `NameAlt`, `Title`, `TitleAlt`, `VerifiedBuild`) VALUES
(259377, 'ruRU', 'Израненный страж смерти', NULL, NULL, NULL, 0),
(271968, 'ruRU', 'Отрекшийся искатель приключений', NULL, NULL, NULL, 0),
(271961, 'ruRU', 'Отрекшийся в паутине', NULL, NULL, NULL, 0),
(246143, 'ruRU', 'Испуганный паладин', NULL, NULL, NULL, 0),
(244808, 'ruRU', 'Арамис Хаммерхенд', NULL, 'Наставник паладинов', NULL, 0),
(267323, 'ruRU', 'Кларенс Джиллиан', NULL, NULL, NULL, 0),
(267324, 'ruRU', 'Маргарет Вивер', NULL, 'Учительница основ снятия шкур', NULL, 0),
(267325, 'ruRU', 'Уолтер Мейсон', NULL, 'Учитель основ горного дела', NULL, 0),
(267326, 'ruRU', 'Флоренс Найтшейд', NULL, 'Учительница основ травничества', NULL, 0),
(246152, 'ruRU', 'Шари Стилвелл', NULL, 'Наставница паладинов', NULL, 0),
(265812, 'ruRU', 'Элеанор Шеклтон', NULL, 'Искательница приключений', NULL, 0)
ON DUPLICATE KEY UPDATE `Name` = VALUES(`Name`), `Title` = VALUES(`Title`);

-- 2. Цели и тексты заданий
INSERT INTO `quest_objectives_locale` (`ID`, `locale`, `QuestId`, `StorageIndex`, `Description`, `VerifiedBuild`) VALUES
(462329, 'ruRU', 91209, 0, 'Доложитесь Шари Стилвелл в Брилле', 0)
ON DUPLICATE KEY UPDATE `Description` = VALUES(`Description`);

INSERT INTO `quest_request_items_locale` (`ID`, `locale`, `CompletionText`, `VerifiedBuild`) VALUES
(380, 'ruRU', 'Остерегайся паучьего яда, $n. Если почувствуешь резкое жжение, лучше покажись целителю.', 0),
(3901, 'ruRU', 'Те, кто медлит с этим заданием, рискуют закончить так же, как наши павшие братья и сестры в деревне, – бродить по земле без цели. Будем надеяться, что тебе повезет больше, чем им, верно?', 0),
(6395, 'ruRU', 'Мы должны чтить наших мертвых, $N. Этим мы и отличаемся от Плети…', 0)
ON DUPLICATE KEY UPDATE `CompletionText` = VALUES(`CompletionText`);

-- 3. Реплики существ, у которых нет радиотекста
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(246143, 0, 0, 'ruRU', 'Нет! Нет, нет, нет! Этого не может быть. Я лучше умру, чем стану Отрекшейся!'),
(246143, 1, 0, 'ruRU', '%s поднимает оружие, готовясь к атаке!'),
(259377, 0, 0, 'ruRU', 'Мне не нужна помощь Света. Прочь, паладин.'),
(259377, 0, 1, 'ruRU', 'Я… благодарю тебя, паладин.'),
(271968, 0, 0, 'ruRU', 'Это оказалось мне не по силам!'),
(271968, 0, 1, 'ruRU', 'Ну почему обязательно пауки…'),
(271968, 0, 2, 'ruRU', 'Кто-нибудь видел мое оружие?'),
(271968, 0, 3, 'ruRU', 'Спасибо. Я вернусь в Похоронный Звон.')
ON DUPLICATE KEY UPDATE `Text` = VALUES(`Text`);

-- 4. Пункты диалога
INSERT INTO `gossip_menu_option_locale` (`MenuID`, `OptionID`, `Locale`, `OptionText`, `BoxText`) VALUES
(39644, 0, 'ruRU', 'Пожалуйста, не делай этого…', NULL),
(39645, 0, 'ruRU', 'Приветствую, собрат-паладин. Знаю, это потрясение, но ты восстал из мертвых, и тебе дан еще один шанс послужить Свету. Пойдем со мной, и я помогу тебе привыкнуть к новой реальности.', NULL),
(39905, 1, 'ruRU', 'Мне бы хотелось купить что-нибудь у вас.', NULL),
(44733, 1, 'ruRU', 'Мне бы хотелось купить что-нибудь у вас.', NULL),
(43551, 0, 'ruRU', 'Что такое профессии?', NULL),
(43551, 1, 'ruRU', 'Какие бывают виды профессий?', NULL),
(43551, 2, 'ruRU', 'А где можно найти местного учителя профессий?', NULL),
(43546, 0, 'ruRU', 'Где найти учителя алхимии?', NULL),
(43546, 1, 'ruRU', 'Где найти учителя кузнечного дела?', NULL),
(43546, 2, 'ruRU', 'Где найти учителя кулинарии?', NULL),
(43546, 3, 'ruRU', 'Где найти учителя наложения чар?', NULL),
(43546, 4, 'ruRU', 'Где найти учителя инженерного дела?', NULL),
(43546, 5, 'ruRU', 'Где найти учителя первой помощи?', NULL),
(43546, 6, 'ruRU', 'Где найти учителя рыбной ловли?', NULL),
(43546, 7, 'ruRU', 'Где найти учителя травничества?', NULL),
(43546, 8, 'ruRU', 'Где найти учителя кожевничества?', NULL),
(43546, 9, 'ruRU', 'Где найти учителя горного дела?', NULL),
(43546, 10, 'ruRU', 'Где найти учителя снятия шкур?', NULL),
(43546, 11, 'ruRU', 'Где найти учителя портняжного дела?', NULL)
ON DUPLICATE KEY UPDATE `OptionText` = VALUES(`OptionText`), `BoxText` = VALUES(`BoxText`);

-- Двойная специализация: этот пункт стоит у всех учителей классов
INSERT INTO `gossip_menu_option_locale` (`MenuID`, `OptionID`, `Locale`, `OptionText`, `BoxText`)
SELECT o.`MenuID`, o.`OptionID`, 'ruRU', 'Я хочу приобрести двойную специализацию талантов.', IF(o.`BoxText` IS NULL OR o.`BoxText` = '', NULL, 'Вы действительно хотите приобрести двойную специализацию талантов?')
FROM `gossip_menu_option` o WHERE o.`OptionText` = 'I wish to purchase a Dual Talent Specialization.'
ON DUPLICATE KEY UPDATE `OptionText` = VALUES(`OptionText`), `BoxText` = VALUES(`BoxText`);

INSERT INTO `gossip_menu_option_locale` (`MenuID`, `OptionID`, `Locale`, `OptionText`, `BoxText`)
SELECT o.`MenuID`, o.`OptionID`, 'ruRU', 'Я хочу научиться двойной специализации.', IF(o.`BoxText` IS NULL OR o.`BoxText` = '', NULL, 'Вы действительно хотите приобрести вторую специализацию талантов?')
FROM `gossip_menu_option` o WHERE o.`OptionText` = 'Purchase a Dual Talent Specialization.'
ON DUPLICATE KEY UPDATE `OptionText` = VALUES(`OptionText`), `BoxText` = VALUES(`BoxText`);

INSERT INTO `gossip_menu_option_locale` (`MenuID`, `OptionID`, `Locale`, `OptionText`, `BoxText`)
SELECT o.`MenuID`, o.`OptionID`, 'ruRU', 'Как научиться двойной специализации?', NULL
FROM `gossip_menu_option` o WHERE o.`OptionText` = 'Learn about Dual Talent Specialization.'
ON DUPLICATE KEY UPDATE `OptionText` = VALUES(`OptionText`), `BoxText` = VALUES(`BoxText`);

INSERT INTO `gossip_menu_option_locale` (`MenuID`, `OptionID`, `Locale`, `OptionText`, `BoxText`)
SELECT o.`MenuID`, o.`OptionID`, 'ruRU', 'Я хочу узнать о двойной специализации талантов.', NULL
FROM `gossip_menu_option` o WHERE o.`OptionText` = 'I wish to know about Dual Talent Specialization.'
ON DUPLICATE KEY UPDATE `OptionText` = VALUES(`OptionText`), `BoxText` = VALUES(`BoxText`);

-- 5. Приветствия учителей (почти у всех не было русского)
INSERT INTO `trainer_locale` (`Id`, `locale`, `Greeting_lang`, `VerifiedBuild`)
SELECT `Id`, 'ruRU', 'Хочешь, научу, как устроить из добычи настоящее пиршество?', 0 FROM `trainer` WHERE `Greeting` = 'Can I teach you how to turn the meat you find on beasts into a feast?'
ON DUPLICATE KEY UPDATE `Greeting_lang` = VALUES(`Greeting_lang`);

INSERT INTO `trainer_locale` (`Id`, `locale`, `Greeting_lang`, `VerifiedBuild`)
SELECT `Id`, 'ruRU', 'Хочешь, я научу тебя, как из найденной руды делать оружие и доспехи?', 0 FROM `trainer` WHERE `Greeting` = 'Care to learn how to turn the ore that you find into weapons and metal armor?'
ON DUPLICATE KEY UPDATE `Greeting_lang` = VALUES(`Greeting_lang`);

INSERT INTO `trainer_locale` (`Id`, `locale`, `Greeting_lang`, `VerifiedBuild`)
SELECT `Id`, 'ruRU', 'Хочешь научиться летать?', 0 FROM `trainer` WHERE `Greeting` = 'Do you wish to learn how to fly?'
ON DUPLICATE KEY UPDATE `Greeting_lang` = VALUES(`Greeting_lang`);

INSERT INTO `trainer_locale` (`Id`, `locale`, `Greeting_lang`, `VerifiedBuild`)
SELECT `Id`, 'ruRU', 'Наложение чар – это искусство улучшения материальных объектов с помощью магии.', 0 FROM `trainer` WHERE `Greeting` = 'Enchanting is the art of improving existing items through magic. '
ON DUPLICATE KEY UPDATE `Greeting_lang` = VALUES(`Greeting_lang`);

INSERT INTO `trainer_locale` (`Id`, `locale`, `Greeting_lang`, `VerifiedBuild`)
SELECT `Id`, 'ruRU', 'В инженерном деле главное – понять основы. Остальное само придет.', 0 FROM `trainer` WHERE `Greeting` = 'Engineering is very simple once you grasp the basics.'
ON DUPLICATE KEY UPDATE `Greeting_lang` = VALUES(`Greeting_lang`);

INSERT INTO `trainer_locale` (`Id`, `locale`, `Greeting_lang`, `VerifiedBuild`)
SELECT `Id`, 'ruRU', 'Здравствуй!', 0 FROM `trainer` WHERE `Greeting` = 'Greetings!'
ON DUPLICATE KEY UPDATE `Greeting_lang` = VALUES(`Greeting_lang`);

INSERT INTO `trainer_locale` (`Id`, `locale`, `Greeting_lang`, `VerifiedBuild`)
SELECT `Id`, 'ruRU', 'Здравствуй! Хочешь научиться гранить драгоценные камни и создавать украшения?', 0 FROM `trainer` WHERE `Greeting` = 'Greetings!  Can I teach you how to cut precious gems and craft jewelry?'
ON DUPLICATE KEY UPDATE `Greeting_lang` = VALUES(`Greeting_lang`);

INSERT INTO `trainer_locale` (`Id`, `locale`, `Greeting_lang`, `VerifiedBuild`)
SELECT `Id`, 'ruRU', 'Здравствуй! Хочешь научиться делать доспехи из шкур животных?', 0 FROM `trainer` WHERE `Greeting` = 'Greetings!  Can I teach you how to turn beast hides into armor?'
ON DUPLICATE KEY UPDATE `Greeting_lang` = VALUES(`Greeting_lang`);

INSERT INTO `trainer_locale` (`Id`, `locale`, `Greeting_lang`, `VerifiedBuild`)
SELECT `Id`, 'ruRU', 'Здравствуй! Хочешь, я научу тебя шить доспехи из ткани?', 0 FROM `trainer` WHERE `Greeting` = 'Greetings!  Can I teach you how to turn found cloth into cloth armor?'
ON DUPLICATE KEY UPDATE `Greeting_lang` = VALUES(`Greeting_lang`);

INSERT INTO `trainer_locale` (`Id`, `locale`, `Greeting_lang`, `VerifiedBuild`)
SELECT `Id`, 'ruRU', 'Здравствуй! Хочешь научиться делать доспехи из шкур животных?', 0 FROM `trainer` WHERE `Greeting` = 'Greetings! Can I teach you how to turn beast hides into armor?'
ON DUPLICATE KEY UPDATE `Greeting_lang` = VALUES(`Greeting_lang`);

INSERT INTO `trainer_locale` (`Id`, `locale`, `Greeting_lang`, `VerifiedBuild`)
SELECT `Id`, 'ruRU', 'Здравствуй! Я специализируюсь на изготовлении плащей. Хочешь поучиться?', 0 FROM `trainer` WHERE `Greeting` = 'Greetings! I specialize in cloakweaving. Would you like to train?'
ON DUPLICATE KEY UPDATE `Greeting_lang` = VALUES(`Greeting_lang`);

INSERT INTO `trainer_locale` (`Id`, `locale`, `Greeting_lang`, `VerifiedBuild`)
SELECT `Id`, 'ruRU', 'Приветствую тебя, $gдруг:подруга;.', 0 FROM `trainer` WHERE `Greeting` = 'Greetings, friend.'
ON DUPLICATE KEY UPDATE `Greeting_lang` = VALUES(`Greeting_lang`);

INSERT INTO `trainer_locale` (`Id`, `locale`, `Greeting_lang`, `VerifiedBuild`)
SELECT `Id`, 'ruRU', 'Здравствуй! Хочешь, я тебя кое-чему научу?', 0 FROM `trainer` WHERE `Greeting` = 'Hello!  Can I teach you something?'
ON DUPLICATE KEY UPDATE `Greeting_lang` = VALUES(`Greeting_lang`);

INSERT INTO `trainer_locale` (`Id`, `locale`, `Greeting_lang`, `VerifiedBuild`)
SELECT `Id`, 'ruRU', 'Здравствуй! Хочешь, я тебя кое-чему научу?', 0 FROM `trainer` WHERE `Greeting` = 'Hello! Can I teach you something?'
ON DUPLICATE KEY UPDATE `Greeting_lang` = VALUES(`Greeting_lang`);

INSERT INTO `trainer_locale` (`Id`, `locale`, `Greeting_lang`, `VerifiedBuild`)
SELECT `Id`, 'ruRU', 'Здравствуй, дитя. Ты желаешь постичь тайны друидов?', 0 FROM `trainer` WHERE `Greeting` = 'Hello, child. Do you wish to learn more of the druidic arts?'
ON DUPLICATE KEY UPDATE `Greeting_lang` = VALUES(`Greeting_lang`);

INSERT INTO `trainer_locale` (`Id`, `locale`, `Greeting_lang`, `VerifiedBuild`)
SELECT `Id`, 'ruRU', 'Приветствую тебя, друид! Тебе нужны новые знания?', 0 FROM `trainer` WHERE `Greeting` = 'Hello, druid!  Ready for some training?'
ON DUPLICATE KEY UPDATE `Greeting_lang` = VALUES(`Greeting_lang`);

INSERT INTO `trainer_locale` (`Id`, `locale`, `Greeting_lang`, `VerifiedBuild`)
SELECT `Id`, 'ruRU', 'Здравствуй, $gдруг:подруга;!', 0 FROM `trainer` WHERE `Greeting` = 'Hello, friend!'
ON DUPLICATE KEY UPDATE `Greeting_lang` = VALUES(`Greeting_lang`);

INSERT INTO `trainer_locale` (`Id`, `locale`, `Greeting_lang`, `VerifiedBuild`)
SELECT `Id`, 'ruRU', 'Привет, $gохотник:охотница;! Ну что, будешь учиться?', 0 FROM `trainer` WHERE `Greeting` = 'Hello, hunter!  Ready for some training?'
ON DUPLICATE KEY UPDATE `Greeting_lang` = VALUES(`Greeting_lang`);

INSERT INTO `trainer_locale` (`Id`, `locale`, `Greeting_lang`, `VerifiedBuild`)
SELECT `Id`, 'ruRU', 'Привет тебе, маг! Ты $gпришел:пришла; за знаниями?', 0 FROM `trainer` WHERE `Greeting` = 'Hello, mage!  Ready for some training?'
ON DUPLICATE KEY UPDATE `Greeting_lang` = VALUES(`Greeting_lang`);

INSERT INTO `trainer_locale` (`Id`, `locale`, `Greeting_lang`, `VerifiedBuild`)
SELECT `Id`, 'ruRU', 'Привет тебе, паладин! Ты $gпришел:пришла; за знаниями?', 0 FROM `trainer` WHERE `Greeting` = 'Hello, paladin!  Ready for some training?'
ON DUPLICATE KEY UPDATE `Greeting_lang` = VALUES(`Greeting_lang`);

INSERT INTO `trainer_locale` (`Id`, `locale`, `Greeting_lang`, `VerifiedBuild`)
SELECT `Id`, 'ruRU', 'Привет тебе, $gжрец:жрица;! Ты $gпришел:пришла; за знаниями?', 0 FROM `trainer` WHERE `Greeting` = 'Hello, priest!  Ready for some training?'
ON DUPLICATE KEY UPDATE `Greeting_lang` = VALUES(`Greeting_lang`);

INSERT INTO `trainer_locale` (`Id`, `locale`, `Greeting_lang`, `VerifiedBuild`)
SELECT `Id`, 'ruRU', 'Привет тебе, $gразбойник:разбойница;! Ты $gпришел:пришла; за знаниями?', 0 FROM `trainer` WHERE `Greeting` = 'Hello, rogue!  Ready for some training?'
ON DUPLICATE KEY UPDATE `Greeting_lang` = VALUES(`Greeting_lang`);

INSERT INTO `trainer_locale` (`Id`, `locale`, `Greeting_lang`, `VerifiedBuild`)
SELECT `Id`, 'ruRU', 'Привет тебе, $gшаман:шаманка;! Ты $gпришел:пришла; за знаниями?', 0 FROM `trainer` WHERE `Greeting` = 'Hello, shaman!  Ready for some training?'
ON DUPLICATE KEY UPDATE `Greeting_lang` = VALUES(`Greeting_lang`);

INSERT INTO `trainer_locale` (`Id`, `locale`, `Greeting_lang`, `VerifiedBuild`)
SELECT `Id`, 'ruRU', 'Привет тебе, $gчернокнижник:чернокнижница;! Ты $gпришел:пришла; за знаниями?', 0 FROM `trainer` WHERE `Greeting` = 'Hello, warlock!  Ready for some training?'
ON DUPLICATE KEY UPDATE `Greeting_lang` = VALUES(`Greeting_lang`);

INSERT INTO `trainer_locale` (`Id`, `locale`, `Greeting_lang`, `VerifiedBuild`)
SELECT `Id`, 'ruRU', 'Привет тебе, воин! Ты хочешь учиться?', 0 FROM `trainer` WHERE `Greeting` = 'Hello, warrior!  Ready for some training?'
ON DUPLICATE KEY UPDATE `Greeting_lang` = VALUES(`Greeting_lang`);

INSERT INTO `trainer_locale` (`Id`, `locale`, `Greeting_lang`, `VerifiedBuild`)
SELECT `Id`, 'ruRU', 'Здравствуй, юный $gохотник:охотница;. Ты готов$g::а; к обучению?', 0 FROM `trainer` WHERE `Greeting` = 'Hello, young hunter. Are you ready for some training?'
ON DUPLICATE KEY UPDATE `Greeting_lang` = VALUES(`Greeting_lang`);

INSERT INTO `trainer_locale` (`Id`, `locale`, `Greeting_lang`, `VerifiedBuild`)
SELECT `Id`, 'ruRU', 'Позволь мне показать, как перевязывать раны…', 0 FROM `trainer` WHERE `Greeting` = 'Here, let me show you how to bind those wounds....'
ON DUPLICATE KEY UPDATE `Greeting_lang` = VALUES(`Greeting_lang`);

INSERT INTO `trainer_locale` (`Id`, `locale`, `Greeting_lang`, `VerifiedBuild`)
SELECT `Id`, 'ruRU', 'Привет.', 0 FROM `trainer` WHERE `Greeting` = 'Hi.'
ON DUPLICATE KEY UPDATE `Greeting_lang` = VALUES(`Greeting_lang`);

INSERT INTO `trainer_locale` (`Id`, `locale`, `Greeting_lang`, `VerifiedBuild`)
SELECT `Id`, 'ruRU', 'Я могу научить тебя ловить рыбу.', 0 FROM `trainer` WHERE `Greeting` = 'I can teach you how to use a fishing pole to catch fish.'
ON DUPLICATE KEY UPDATE `Greeting_lang` = VALUES(`Greeting_lang`);

INSERT INTO `trainer_locale` (`Id`, `locale`, `Greeting_lang`, `VerifiedBuild`)
SELECT `Id`, 'ruRU', 'Я могу научить тебя травничеству.', 0 FROM `trainer` WHERE `Greeting` = 'I can train you in Herbalism.'
ON DUPLICATE KEY UPDATE `Greeting_lang` = VALUES(`Greeting_lang`);

INSERT INTO `trainer_locale` (`Id`, `locale`, `Greeting_lang`, `VerifiedBuild`)
SELECT `Id`, 'ruRU', 'Я могу научить тебя горному делу.', 0 FROM `trainer` WHERE `Greeting` = 'I can train you in Mining.'
ON DUPLICATE KEY UPDATE `Greeting_lang` = VALUES(`Greeting_lang`);

INSERT INTO `trainer_locale` (`Id`, `locale`, `Greeting_lang`, `VerifiedBuild`)
SELECT `Id`, 'ruRU', 'Я могу научить тебя снятию шкур.', 0 FROM `trainer` WHERE `Greeting` = 'I can train you in Skinning.'
ON DUPLICATE KEY UPDATE `Greeting_lang` = VALUES(`Greeting_lang`);

INSERT INTO `trainer_locale` (`Id`, `locale`, `Greeting_lang`, `VerifiedBuild`)
SELECT `Id`, 'ruRU', 'Чтобы снять шкуру с убитого животного, нужна твердая рука.', 0 FROM `trainer` WHERE `Greeting` = 'It requires a steady hand to remove the leather from a slain beast.'
ON DUPLICATE KEY UPDATE `Greeting_lang` = VALUES(`Greeting_lang`);

INSERT INTO `trainer_locale` (`Id`, `locale`, `Greeting_lang`, `VerifiedBuild`)
SELECT `Id`, 'ruRU', 'Нужно обучение инженерному делу?', 0 FROM `trainer` WHERE `Greeting` = 'Need training in Engineering?'
ON DUPLICATE KEY UPDATE `Greeting_lang` = VALUES(`Greeting_lang`);

INSERT INTO `trainer_locale` (`Id`, `locale`, `Greeting_lang`, `VerifiedBuild`)
SELECT `Id`, 'ruRU', 'Нужно обучение портняжному делу?', 0 FROM `trainer` WHERE `Greeting` = 'Need training in Tailoring?'
ON DUPLICATE KEY UPDATE `Greeting_lang` = VALUES(`Greeting_lang`);

INSERT INTO `trainer_locale` (`Id`, `locale`, `Greeting_lang`, `VerifiedBuild`)
SELECT `Id`, 'ruRU', 'Здороваться даже и не буду.', 0 FROM `trainer` WHERE `Greeting` = 'No greeting.'
ON DUPLICATE KEY UPDATE `Greeting_lang` = VALUES(`Greeting_lang`);

INSERT INTO `trainer_locale` (`Id`, `locale`, `Greeting_lang`, `VerifiedBuild`)
SELECT `Id`, 'ruRU', 'Чтобы разбираться в травах, нужны и знания, и чутье.', 0 FROM `trainer` WHERE `Greeting` = 'Searching for herbs requires both knowledge and instinct.'
ON DUPLICATE KEY UPDATE `Greeting_lang` = VALUES(`Greeting_lang`);

INSERT INTO `trainer_locale` (`Id`, `locale`, `Greeting_lang`, `VerifiedBuild`)
SELECT `Id`, 'ruRU', 'Прости, $gдруг:подруга;, но я обучаю только разбойников.', 0 FROM `trainer` WHERE `Greeting` = 'Sorry, friend.  I can only train rogues.'
ON DUPLICATE KEY UPDATE `Greeting_lang` = VALUES(`Greeting_lang`);

INSERT INTO `trainer_locale` (`Id`, `locale`, `Greeting_lang`, `VerifiedBuild`)
SELECT `Id`, 'ruRU', 'Из трав этих земель можно сварить мощные зелья.', 0 FROM `trainer` WHERE `Greeting` = 'The herbs of this land can be brewed into powerful potions.'
ON DUPLICATE KEY UPDATE `Greeting_lang` = VALUES(`Greeting_lang`);

INSERT INTO `trainer_locale` (`Id`, `locale`, `Greeting_lang`, `VerifiedBuild`)
SELECT `Id`, 'ruRU', 'Нет лакомства лучше, чем жареное крыло канюка.', 0 FROM `trainer` WHERE `Greeting` = 'There is no treat finer than Barbecued Buzzard Wing.'
ON DUPLICATE KEY UPDATE `Greeting_lang` = VALUES(`Greeting_lang`);

INSERT INTO `trainer_locale` (`Id`, `locale`, `Greeting_lang`, `VerifiedBuild`)
SELECT `Id`, 'ruRU', 'Хочешь научиться готовить?', 0 FROM `trainer` WHERE `Greeting` = 'Want to learn to Cook?'
ON DUPLICATE KEY UPDATE `Greeting_lang` = VALUES(`Greeting_lang`);

INSERT INTO `trainer_locale` (`Id`, `locale`, `Greeting_lang`, `VerifiedBuild`)
SELECT `Id`, 'ruRU', 'Добро пожаловать!', 0 FROM `trainer` WHERE `Greeting` = 'Welcome!'
ON DUPLICATE KEY UPDATE `Greeting_lang` = VALUES(`Greeting_lang`);

INSERT INTO `trainer_locale` (`Id`, `locale`, `Greeting_lang`, `VerifiedBuild`)
SELECT `Id`, 'ruRU', 'Освоив алхимию, ты сможешь варить зелья из найденных растений.', 0 FROM `trainer` WHERE `Greeting` = 'With alchemy you can turn found herbs into healing and other types of potions.'
ON DUPLICATE KEY UPDATE `Greeting_lang` = VALUES(`Greeting_lang`);

INSERT INTO `trainer_locale` (`Id`, `locale`, `Greeting_lang`, `VerifiedBuild`)
SELECT `Id`, 'ruRU', 'Хочешь узнать все тонкости начертания?', 0 FROM `trainer` WHERE `Greeting` = 'Would you like to learn the intricacies of inscription?'
ON DUPLICATE KEY UPDATE `Greeting_lang` = VALUES(`Greeting_lang`);

INSERT INTO `trainer_locale` (`Id`, `locale`, `Greeting_lang`, `VerifiedBuild`)
SELECT `Id`, 'ruRU', 'Кто никогда не рылся в земле, тот, считай, и не жил!', 0 FROM `trainer` WHERE `Greeting` = 'You have not lived until you have dug deep into the earth.'
ON DUPLICATE KEY UPDATE `Greeting_lang` = VALUES(`Greeting_lang`);
