USE `BONG_DA`;

-- insert neu Ten_User chua co trong bang
INSERT INTO USER (
  ID_USER,
  PASSWORD,
  EMAIL,
  TEN_USER,
  NGAY_SINH,
  PHONE,
  ROLE
)
  SELECT
    *
  FROM
    (
      SELECT
        3,
        '321',
        'gher.gmail.com',
        'VanA',
        '2002-3-24',
        '97584354931',
        'Quan ly'
    ) AS TMP
  WHERE
    NOT EXISTS (
      SELECT
        TEN_USER
      FROM
        USER
      WHERE
        TEN_USER = 'VanA'
        AND EMAIL = 'gher.gmail.com'
    );

SELECT
  EXISTS(
    SELECT
      1
    FROM
      USER
    WHERE
      TEN_USER = 'VanA'
      OR EMAIL = 'gher.gmail.com'
  ) AS TEMP;

SELECT
  *
FROM
  USER;

-- bang xep hang theo thu tu tang dan
SELECT
  *
FROM
  BANG_XEP_HANG
ORDER BY
  TONG_DIEM;

-- tim id doi bong khi co ten doi bong

SELECT
  ID_DOI_BONG
FROM
  DOI_BONG
WHERE
  TEN_DB = 'Fulham';

-- tim id,San_Nha doi bong khi co ten doi bong
SELECT
  ID_DOI_BONG,
  SAN_NHA
FROM
  DOI_BONG
WHERE
  TEN_DB = 'Fulham';

-- select san khi co id doi bong trong table doi_bong
SELECT
  TEN_DB,
  SAN_NHA
FROM
  DOI_BONG
WHERE
  ID_DOI_BONG='';

-- insert kiem tra xem neu 2 doi da gap nhau chua
INSERT INTO "TRAN_DAU" (
  ID_TRAN_DAU,
  DOI_BONG_ID_DOI_BONG_1,
  DOI_BONG_ID_DOI_BONG_2,
  VONG_DAU,
  GIAI_DAU_ID_GIAI_DAU,
  SAN,
  LICH_THI_DAU
)
  SELECT
    *
  FROM
    (
      SELECT
        11,
        101,
        106,
        2,
        1,
        'Old Trafford',
        '2020-11-4 20:00:00'
    ) AS TMP
  WHERE
    EXISTS (
      SELECT
        DOI_BONG_ID_DOI_BONG_1,
        DOI_BONG_ID_DOI_BONG_2
      FROM
        TRAN_DAU
      WHERE
        DOI_BONG_ID_DOI_BONG_1 = 106
        AND DOI_BONG_ID_DOI_BONG_2 = 101
    );

SELECT
  *
FROM
  TRAN_DAU;

-- cach 2
SELECT
  2
WHERE
  EXISTS (
    SELECT
      DOI_BONG_ID_DOI_BONG_1,
      DOI_BONG_ID_DOI_BONG_2
    FROM
      TRAN_DAU
    WHERE
      DOI_BONG_ID_DOI_BONG_1 = 106
      AND DOI_BONG_ID_DOI_BONG_2 = 101
  );

-- cach 3
-- SELECT EXISTS(  select 1
--   from tran_dau
--   where DOI_BONG_ID_Doi_Bong_1 = 106 and DOI_BONG_ID_Doi_Bong_2 = 104) as temp;

--   -- truy van so cau thu nuoc ngoai trong 1 doi bong

-- -- select count(*) as So_Cau_Thu_Nuoc_Ngoai
-- -- from cau_thu
-- -- where DOI_BONG_ID_Doi_Bong = 101 and Loai_CT = 'NN';

-- -- -- truy van tong so ban thang cau cau thu
-- -- select count(*) AS So_Ban_Thang
-- -- from ghi_ban
-- -- where CAU_THU_ID_Cau_thu = 1100
-- -- group by CAU_THU_ID_Cau_thu;



-- tra ve so ban thang cua tung cau thu
SELECT
  CAU_THU_ID_CAU_THU,
  CAU_THU_DOI_BONG_ID_DOI_BONG,
  COUNT(*)                     AS SO_BAN_THANG
FROM
  GHI_BAN
GROUP BY
  CAU_THU_ID_CAU_THU,
  CAU_THU_DOI_BONG_ID_DOI_BONG
ORDER BY
  SO_BAN_THANG DESC;

-- update id doi_bong cua table cau_thu =0

UPDATE CAU_THU
SET
  DOI_BONG_ID_DOI_BONG = 1
WHERE
  ID_CAU_THU = 1100;

SELECT
  *
FROM
  CAU_THU
WHERE
  DOI_BONG_ID_DOI_BONG = 120;

-- set logo for clubs
UPDATE DOI_BONG
SET
  LOGO ="https://upload.wikimedia.org/wikipedia/vi/thumb/a/a1/Man_Utd_FC_.svg/1200px-Man_Utd_FC_.svg.png"
WHERE
  ID_DOI_BONG=101;

UPDATE DOI_BONG
SET
  LOGO ="https://upload.wikimedia.org/wikipedia/vi/1/1d/Manchester_City_FC_logo.svg"
WHERE
  ID_DOI_BONG=102;

UPDATE DOI_BONG
SET
  LOGO ="https://upload.wikimedia.org/wikipedia/vi/thumb/5/5c/Chelsea_crest.svg/1200px-Chelsea_crest.svg.png"
WHERE
  ID_DOI_BONG=103;

UPDATE DOI_BONG
SET
  LOGO ="https://upload.wikimedia.org/wikipedia/vi/thumb/5/53/Arsenal_FC.svg/1200px-Arsenal_FC.svg.png"
WHERE
  ID_DOI_BONG=104;

UPDATE DOI_BONG
SET
  LOGO ="https://cdne-totv8-prod.azureedge.net/media/40307/spurs-blue-compressed.png"
WHERE
  ID_DOI_BONG=105;

UPDATE DOI_BONG
SET
  LOGO ="https://upload.wikimedia.org/wikipedia/vi/thumb/7/7c/Everton_FC_logo.svg/1200px-Everton_FC_logo.svg.png"
WHERE
  ID_DOI_BONG=106;

UPDATE DOI_BONG
SET
  LOGO ="https://upload.wikimedia.org/wikipedia/vi/thumb/0/0c/Liverpool_FC.svg/1200px-Liverpool_FC.svg.png"
WHERE
  ID_DOI_BONG=107;

UPDATE DOI_BONG
SET
  LOGO ="https://upload.wikimedia.org/wikipedia/en/thumb/8/8b/West_Bromwich_Albion.svg/1200px-West_Bromwich_Albion.svg.png"
WHERE
  ID_DOI_BONG=108;

UPDATE DOI_BONG
SET
  LOGO ="https://upload.wikimedia.org/wikipedia/en/thumb/1/16/Swansea_City_AFC_logo.png/180px-Swansea_City_AFC_logo.png"
WHERE
  ID_DOI_BONG=109;

UPDATE DOI_BONG
SET
  LOGO ="https://upload.wikimedia.org/wikipedia/vi/b/b1/WestHam.png"
WHERE
  ID_DOI_BONG=110;

UPDATE DOI_BONG
SET
  LOGO ="https://upload.wikimedia.org/wikipedia/en/thumb/1/17/Norwich_City_FC_logo.svg/640px-Norwich_City_FC_logo.svg.png"
WHERE
  ID_DOI_BONG=111;

UPDATE DOI_BONG
SET
  LOGO ="https://upload.wikimedia.org/wikipedia/vi/8/8d/Fulham_FC.png"
WHERE
  ID_DOI_BONG=112;

UPDATE DOI_BONG
SET
  LOGO ="https://upload.wikimedia.org/wikipedia/en/thumb/2/29/Stoke_City_FC.svg/800px-Stoke_City_FC.svg.png"
WHERE
  ID_DOI_BONG=113;

UPDATE DOI_BONG
SET
  LOGO ="https://upload.wikimedia.org/wikipedia/vi/4/4b/356px-FC_Southampton.svg.png"
WHERE
  ID_DOI_BONG=114;

UPDATE DOI_BONG
SET
  LOGO ="https://upload.wikimedia.org/wikipedia/en/thumb/f/f9/Aston_Villa_FC_crest_%282016%29.svg/1200px-Aston_Villa_FC_crest_%282016%29.svg.png"
WHERE
  ID_DOI_BONG=115;

UPDATE DOI_BONG
SET
  LOGO ="https://upload.wikimedia.org/wikipedia/vi/0/0d/Newcastle_United_FC.png"
WHERE
  ID_DOI_BONG=116;

UPDATE DOI_BONG
SET
  LOGO ="https://upload.wikimedia.org/wikipedia/vi/d/d7/Sunderland_AFC.gif"
WHERE
  ID_DOI_BONG=117;

UPDATE DOI_BONG
SET
  LOGO ="https://upload.wikimedia.org/wikipedia/vi/9/92/Wigan_Athletic.png"
WHERE
  ID_DOI_BONG=118;

UPDATE DOI_BONG
SET
  LOGO ="https://upload.wikimedia.org/wikipedia/en/thumb/1/11/Reading_FC.svg/640px-Reading_FC.svg.png"
WHERE
  ID_DOI_BONG=119;

UPDATE DOI_BONG
SET
  LOGO ="https://upload.wikimedia.org/wikipedia/en/thumb/3/31/Queens_Park_Rangers_crest.svg/1200px-Queens_Park_Rangers_crest.svg.png"
WHERE
  ID_DOI_BONG=120;

SELECT
  *
FROM
  BONG_DA.CAU_THU;

UPDATE CAU_THU
SET
  PICTURE = "https://a.espncdn.com/combiner/i?img=/i/headshots/soccer/players/full/124933.png"
WHERE
  ID_CAU_THU = 1153;

UPDATE CAU_THU
SET
  PICTURE = "https://images.squarespace-cdn.com/content/v1/5a787f048c56a8f8f9e9798d/1548866428084-V1YTQNFTXMYO1NRM6XLP/Michael-Carrick-Carousel-11.jpg?format=1000w"
WHERE
  ID_CAU_THU = 1154;

UPDATE CAU_THU
SET
  PICTURE = "https://medias.spotern.com/people/w320/1/1272-1532336937.jpg"
WHERE
  ID_CAU_THU = 1155;

UPDATE CAU_THU
SET
  PICTURE = "https://resources.premierleague.com/premierleague/photos/players/250x250/p20658.png"
WHERE
  ID_CAU_THU = 1132;

UPDATE CAU_THU
SET
  PICTURE = "https://i2-prod.birminghammail.co.uk/sport/football/football-news/article9971040.ece/ALTERNATES/s615/JS71133798.jpg"
WHERE
  ID_CAU_THU = 1133;

UPDATE CAU_THU
SET
  PICTURE = "https://resources.premierleague.com/premierleague/photos/players/250x250/p15157.png"
WHERE
  ID_CAU_THU = 1134;

UPDATE CAU_THU
SET
  PICTURE = "https://a.espncdn.com/combiner/i?img=/i/headshots/soccer/players/full/8054.png"
WHERE
  ID_CAU_THU = 1052;

UPDATE CAU_THU
SET
  PICTURE = "https://resources.premierleague.com/premierleague/photos/players/250x250/p41270.png"
WHERE
  ID_CAU_THU = 1053;

UPDATE CAU_THU
SET
  PICTURE = "https://cdn.resfu.com/img_data/players/big/32837.jpg"
WHERE
  ID_CAU_THU = 1054;

UPDATE CAU_THU
SET
  PICTURE = "https://media.gettyimages.com/id/473052004/photo/andre-santos-of-clube-de-regatas-do-flamengo-poses-during-a-portrait-session-on-august-14-2014.jpg?s=612x612&w=gi&k=20&c=bx0vgxeBfueGtixWOmoEWQO9_aviI13HQeR2tl-jZg0="
WHERE
  ID_CAU_THU = 1005;

UPDATE CAU_THU
SET
  PICTURE = "https://futhead.cursecdn.com/static/img/14/players/163423.png"
WHERE
  ID_CAU_THU = 1006;

UPDATE CAU_THU
SET
  PICTURE = "https://www.arsenalpics.com/p/5/johan-djourou-arsenal-523417.jpg.webp"
WHERE
  ID_CAU_THU = 1007;

UPDATE CAU_THU
SET
  PICTURE = "https://i.pinimg.com/474x/3f/93/f6/3f93f6a379a7234373d206e450373b0c.jpg"
WHERE
  ID_CAU_THU = 1366;

UPDATE CAU_THU
SET
  PICTURE = "https://resources.premierleague.com/premierleague/photos/players/250x250/p37742.png"
WHERE
  ID_CAU_THU = 1367;

UPDATE CAU_THU
SET
  PICTURE = "https://www.themoviedb.org/t/p/original/8Yf2xrdNV1HsBnCIAgDRIgN6DrT.jpg"
WHERE
  ID_CAU_THU = 1368;

UPDATE CAU_THU
SET
  PICTURE = "https://m.footballdatabase.eu/images/photos/players/a_2/2190.jpg"
WHERE
  ID_CAU_THU = 1072;

UPDATE CAU_THU
SET
  PICTURE = "https://bet-bet.net/wp-content/uploads/2021/03/Phil-Jagielka.png"
WHERE
  ID_CAU_THU = 1073;

UPDATE CAU_THU
SET
  PICTURE = "https://i.pinimg.com/474x/d1/49/b8/d149b8a4ea42c584370ced3b7f2fb9d0.jpg"
WHERE
  ID_CAU_THU = 1074;

UPDATE CAU_THU
SET
  PICTURE = "https://img.a.transfermarkt.technology/portrait/big/3597-1476358918.jpg?lm=1"
WHERE
  ID_CAU_THU = 1112;

UPDATE CAU_THU
SET
  PICTURE = "https://i.pinimg.com/originals/d3/c7/36/d3c736da5845944148c87dd9c528fb00.jpg"
WHERE
  ID_CAU_THU = 1113;

UPDATE CAU_THU
SET
  PICTURE = "https://www.lfchistory.net/images/profiles/player_colejoe.jpg"
WHERE
  ID_CAU_THU = 1114;

UPDATE CAU_THU
SET
  PICTURE = "https://images.fotmob.com/image_resources/playerimages/32734.png"
WHERE
  ID_CAU_THU = 1391;

UPDATE CAU_THU
SET
  PICTURE = "https://img.a.transfermarkt.technology/portrait/big/90368-1487767598.jpg?lm=1"
WHERE
  ID_CAU_THU = 1392;

UPDATE CAU_THU
SET
  PICTURE = "http://cdn.soccerwiki.org/images/player/3136.png"
WHERE
  ID_CAU_THU = 1393;

UPDATE CAU_THU
SET
  PICTURE = "https://fmdataba.com/images/p2/534313.png"
WHERE
  ID_CAU_THU = 1344;

UPDATE CAU_THU
SET
  PICTURE = "https://www.bdfutbol.com/i/j/6108c.jpg"
WHERE
  ID_CAU_THU = 1345;

UPDATE CAU_THU
SET
  PICTURE = "https://alchetron.com/cdn/mark-gower-2771d357-1094-484a-898c-a49d5f66c8b-resize-750.png"
WHERE
  ID_CAU_THU = 1346;

UPDATE CAU_THU
SET
  PICTURE = "https://e7.pngegg.com/pngimages/701/167/png-clipart-james-collins-west-ham-united-f-c-premier-league-wales-national-football-team-premier-league-tshirt-team-thumbnail.png"
WHERE
  ID_CAU_THU = 1415;

UPDATE CAU_THU
SET
  PICTURE = "https://cdn.resfu.com/img_data/players/medium/38344.jpg?size=180x&lossy=1"
WHERE
  ID_CAU_THU = 1416;

UPDATE CAU_THU
SET
  PICTURE = "http://cdn.soccerwiki.org/images/player/4657.png"
WHERE
  ID_CAU_THU = 1417;

UPDATE CAU_THU
SET
  PICTURE = "https://resources.premierleague.com/premierleague/photos/players/250x250/p41727.png"
WHERE
  ID_CAU_THU = 1200;

UPDATE CAU_THU
SET
  PICTURE = "https://resources.premierleague.com/premierleague/photos/players/250x250/p10954.png"
WHERE
  ID_CAU_THU = 1201;

UPDATE CAU_THU
SET
  PICTURE = "https://www.scunthorpe-united.co.uk/api/image/cropandgreyscale/90f2ec7e-04d8-427b-a11a-0a7cb145fde7/?preset=player&greyscale=false"
WHERE
  ID_CAU_THU = 1202;

UPDATE CAU_THU
SET
  PICTURE = "https://resources.premierleague.com/premierleague/photos/players/250x250/p88734.png"
WHERE
  ID_CAU_THU = 1091;

UPDATE CAU_THU
SET
  PICTURE = "http://cdn.soccerwiki.org/images/player/7784.png"
WHERE
  ID_CAU_THU = 1092;

UPDATE CAU_THU
SET
  PICTURE = "http://cdn.soccerwiki.org/images/player/1843.png"
WHERE
  ID_CAU_THU = 1093;

UPDATE CAU_THU
SET
  PICTURE = "https://futhead.cursecdn.com/static/img/19/players/51257.png"
WHERE
  ID_CAU_THU = 1298;

UPDATE CAU_THU
SET
  PICTURE = "https://static.wikia.nocookie.net/the-football-database/images/2/27/Rory_Delap.png/revision/latest?cb=20210121174651"
WHERE
  ID_CAU_THU = 1299;

UPDATE CAU_THU
SET
  PICTURE = "https://img.a.transfermarkt.technology/portrait/big/50987-1489602860.jpg?lm=1"
WHERE
  ID_CAU_THU = 1300;

UPDATE CAU_THU
SET
  PICTURE = "https://resources.premierleague.com/premierleague/photos/players/250x250/p3673.png"
WHERE
  ID_CAU_THU = 1275;

UPDATE CAU_THU
SET
  PICTURE = "https://resources.premierleague.com/premierleague/photos/players/250x250/p17339.png"
WHERE
  ID_CAU_THU = 1276;

UPDATE CAU_THU
SET
  PICTURE = "https://m.footballdatabase.eu/images/photos/players/2020-2021/a_28/28883.jpg"
WHERE
  ID_CAU_THU = 1277;

UPDATE CAU_THU
SET
  PICTURE = "http://cdn.soccerwiki.org/images/player/448.png"
WHERE
  ID_CAU_THU = 1027;

UPDATE CAU_THU
SET
  PICTURE = "https://sortitoutsi.net/uploads/megapacks/cutoutfaces/originals/11.00/29000029.png"
WHERE
  ID_CAU_THU = 1028;

UPDATE CAU_THU
SET
  PICTURE = "https://cdn.soccerwiki.org/images/player/29444.png"
WHERE
  ID_CAU_THU = 1029;

UPDATE CAU_THU
SET
  PICTURE = "https://futhead.cursecdn.com/static/img/14/players/177134.png"
WHERE
  ID_CAU_THU = 1178;

UPDATE CAU_THU
SET
  PICTURE = "https://cdn.soccerwiki.org/images/player/3883.png"
WHERE
  ID_CAU_THU = 1179;

UPDATE CAU_THU
SET
  PICTURE = "http://cdn.soccerwiki.org/images/player/5580.png"
WHERE
  ID_CAU_THU = 1180;

UPDATE CAU_THU
SET
  PICTURE = "https://m.footballdatabase.eu/images/photos/players/2020-2021/a_21/21824.jpg"
WHERE
  ID_CAU_THU = 1323;

UPDATE CAU_THU
SET
  PICTURE = "https://fmdataba.com/images/p2/534073.png"
WHERE
  ID_CAU_THU = 1324;

UPDATE CAU_THU
SET
  PICTURE = "https://futhead.cursecdn.com/static/img/19/players/193942.png"
WHERE
  ID_CAU_THU = 1325;

UPDATE CAU_THU
SET
  PICTURE = "https://cdn.soccerwiki.org/images/player/18318.png"
WHERE
  ID_CAU_THU = 1437;

UPDATE CAU_THU
SET
  PICTURE = "http://cdn.soccerwiki.org/images/player/592.png"
WHERE
  ID_CAU_THU = 1438;

UPDATE CAU_THU
SET
  PICTURE = "https://futhead.cursecdn.com/static/img/15/players/45098.png"
WHERE
  ID_CAU_THU = 1439;

UPDATE CAU_THU
SET
  PICTURE = "https://fmdataba.com/images/p2/534503.png"
WHERE
  ID_CAU_THU = 1250;

UPDATE CAU_THU
SET
  PICTURE = "https://s.hs-data.com/bilder/spieler/gross/1168.jpg"
WHERE
  ID_CAU_THU = 1251;

UPDATE CAU_THU
SET
  PICTURE = "https://www.playmakerstats.com/img/jogadores/13/300113_med_jem_karacan.jpg"
WHERE
  ID_CAU_THU = 1252;

UPDATE CAU_THU
SET
  PICTURE = "https://pbs.twimg.com/profile_images/632932737809272832/13CnkvD4_400x400.jpg"
WHERE
  ID_CAU_THU = 1225;

UPDATE CAU_THU
SET
  PICTURE = "http://cdn.soccerwiki.org/images/player/1975.png"
WHERE
  ID_CAU_THU = 1226;

UPDATE CAU_THU
SET
  PICTURE = "https://cdn.resfu.com/img_data/players/big/24071.jpg"
WHERE
  ID_CAU_THU = 1227;