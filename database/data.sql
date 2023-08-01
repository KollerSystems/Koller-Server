INSERT INTO `role_name` (`Role`, `Table`, `FullName`) VALUES
  (1, 'student', 'kollégiumi diák'),
	(2, 'teacher', 'nevelőtanár');

INSERT INTO `user` (`UID`, `Role`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
  (5, 2),
	(6, 1),
	(7, 1);

INSERT INTO `auth` (`UID`, `access_token`, `expires`, `expired`) VALUES
	(1, 'P8kj-8K7kJM-hT9RQDUH8L-v..01.yy2', 4294967295, b'0'),
	(5, 'Anca577M3u.~un7z~j9pj3/67rsF/~/3', 4294967295, b'0');

INSERT INTO `dormroom` VALUES
	(172, 1, NULL),
	(131, 1, 'F1'),
	(17, 0, 'F3');

INSERT INTO `login_data` (`UID`, `Username`, `Password`) VALUES
	(1, 'Miki', 'almafa1234'),
	(2, 'Barnabás', 'almafa1234'),
	(3, 'Gyuri', 'almafa1234'),
	(4, 'Gergő', 'almafa1234'),
  (5, 'DJ', 'almafa1234'),
	(6, 'Lizz', 'almafa1234');

INSERT INTO `teacher` VALUES (5, 'Dobos József', '72237485955');

INSERT INTO `student` (`UID`, `OM`, `Name`, `Picture`, `Group`, `Class`, `School`, `Birthplace`, `Birthdate`, `GuardianName`, `GuardianPhone`, `RID`, `Country`, `City`, `Street`, `PostCode`, `Address`, `Floor`, `Door`) VALUES
	(1, '73454685362', 'Várnagy Miklós Tamás', NULL, 'F8', '11.B', 'BMSZC Puskás Tivadar Távközlési Technikum', 'Budapest', '2023-02-26', 'Papp Lajos', '36 64 865 3423', 172, 'Új-Zéland', 'Hamilton', 'Clarkin Road', 3214, 2, NULL, NULL),
	(2, '72745678344', 'Katona Márton Barnabás', NULL, 'F8', '11.B', 'BMSZC Puskás Tivadar Távközlési Technikum', 'Budapest', '2005-07-22', 'Kis Gazsiné', '213 676 33 87 93', 172, 'Afganistan', 'Kabul', 'Asmayi Road', 553, 8, 3, NULL),
	(3, '74583725375', 'Bende Ákos György', NULL, 'F1', '11.B', 'BMSZC Puskás Tivadar Távközlési Technikum', 'Budapest', '2005-08-15', 'Kalapos József', '43 673 527890180', 131, 'Austria', 'Graz', 'Plüddemanngasse', 8010, 62, 32, 3),
	(4, '72345456628', 'Bencsik Gergő', NULL, 'F1', '11.B', 'BMSZC Puskás Tivadar Távközlési Technikum', 'Budapest', '2004-02-28', 'Tóth András', '36 90 343 5454', 131, 'Uganda', 'Kampala', 'Kabalega Close', NULL, 16, NULL, NULL),
	(6, '77685796872', 'Varró Liza', NULL, 'F3', '9.A', 'BMSZC Puskás Tivadar Távközlési Technikum', 'Budapest', '2008-07-08', 'Magyar Béla', '36 20 387 5254', 17, 'Dél-Kórea', 'Seoul', 'Opaesan-ro', NULL, 11, NULL, NULL),
	(7, '77348695718', 'Páter Zsófia Édua', NULL, 'F3', '12.E', 'BMSZC Puskás Tivadar Távközlési Technikum', 'Budapest', '2004-11-30', 'Kisfaludy Zoltán', '36 70 322 9834', 17, 'Japán', 'Tokió', 'Sekiguchi', NULL, 3, NULL, NULL);

INSERT INTO `resident` VALUES
	(1, 172, 0),
	(2, 172, 1),
	(3, 131, 0),
	(4, 131, 1),
	(6, 17, 0);


INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES (1, 'student', 'UID', b'1');
INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES (1, 'student', 'Name', b'1');
INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES (1, 'student', 'Picture', b'1');
INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES (1, 'student', 'Group', b'1');
INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES (1, 'student', 'Class', b'1');
INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES (1, 'student', 'School', b'1');
INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES (1, 'student', 'RID', b'1');

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES (1, 'student', 'Birthdate', b'0');
INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES (1, 'student', 'GuardianName', b'0');
INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES (1, 'student', 'GuardianPhone', b'0');
INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES (1, 'student', 'Country', b'0');
INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES (1, 'student', 'City', b'0');

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES (1, 'teacher', 'UID', b'1');
INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES (1, 'teacher', 'Name', b'1');

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES (1, 'mifare_tags', 'UID', b'0');
INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES (1, 'mifare_tags', 'Issued', b'0');
INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES (1, 'mifare_tags', 'Bytes', b'0');

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES (1, 'dormroom', 'RID', b'1');
INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES (1, 'dormroom', 'Gender', b'1');
INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES (1, 'dormroom', 'Group', b'1');

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES (1, 'resident', 'UID', b'1');
INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES (1, 'resident', 'RID', b'1');
INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES (1, 'resident', 'BedNum', b'1');


INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES (2, 'student', 'UID', b'1');
INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES (2, 'student', 'Name', b'1');
INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES (2, 'student', 'Picture', b'1');
INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES (2, 'student', 'Group', b'1');
INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES (2, 'student', 'Class', b'1');
INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES (2, 'student', 'School', b'1');
INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES (2, 'student', 'RID', b'1');

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES (2, 'student', 'Birthdate', b'1');
INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES (2, 'student', 'GuardianName', b'1');
INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES (2, 'student', 'GuardianPhone', b'1');
INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES (2, 'student', 'Country', b'1');
INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES (2, 'student', 'City', b'1');

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES (2, 'teacher', 'UID', b'1');
INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES (2, 'teacher', 'Name', b'1');

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES (2, 'mifare_tags', 'UID', b'1');
INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES (2, 'mifare_tags', 'Issued', b'1');
INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES (2, 'mifare_tags', 'Bytes', b'1');

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES (2, 'dormroom', 'RID', b'1');
INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES (2, 'dormroom', 'Gender', b'1');
INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES (2, 'dormroom', 'Group', b'1');

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES (2, 'resident', 'UID', b'1');
INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES (2, 'resident', 'RID', b'1');
INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES (2, 'resident', 'BedNum', b'1');


INSERT INTO `route_access` VALUES (1, '/api/crossings/events', b'0', b'1');
INSERT INTO `route_access` VALUES (2, '/api/crossings/events', b'1', b'0');
INSERT INTO `route_access` VALUES (1, '/api/crossings/me', b'1', b'0');
INSERT INTO `route_access` VALUES (2, '/api/crossings/me', b'1', b'0');
INSERT INTO `route_access` VALUES (1, '/api/crossings/:id', b'0', b'1');
INSERT INTO `route_access` VALUES (2, '/api/crossings/:id', b'1', b'0');

INSERT INTO `route_access` VALUES (1, '/api/users', b'1', b'0');
INSERT INTO `route_access` VALUES (2, '/api/users', b'1', b'0');
INSERT INTO `route_access` VALUES (1, '/api/users/me', b'1', b'0');
INSERT INTO `route_access` VALUES (2, '/api/users/me', b'1', b'0');
INSERT INTO `route_access` VALUES (1, '/api/users/:id', b'1', b'0');
INSERT INTO `route_access` VALUES (2, '/api/users/:id', b'1', b'0');
-- INSERT INTO `route_access` VALUES (1, '/api/users/:id/dormroom', b'1', b'0');
-- INSERT INTO `route_access` VALUES (2, '/api/users/:id/dormroom', b'1', b'0');
INSERT INTO `route_access` VALUES (2, '/api/users/:id', b'1', b'0');
INSERT INTO `route_access` VALUES (1, '/api/users/mifare', b'0', b'0');
INSERT INTO `route_access` VALUES (2, '/api/users/mifare', b'1', b'0');

INSERT INTO `route_access` VALUES (1, '/api/rooms', b'1', b'0');
INSERT INTO `route_access` VALUES (2, '/api/rooms', b'1', b'0');
INSERT INTO `route_access` VALUES (1, '/api/rooms/me', b'1', b'0');
INSERT INTO `route_access` VALUES (2, '/api/rooms/me', b'0', b'1');
INSERT INTO `route_access` VALUES (1, '/api/rooms/:id', b'1', b'0');
INSERT INTO `route_access` VALUES (2, '/api/rooms/:id', b'1', b'0');


INSERT INTO `mifare_tags` (UID, Bytes) VALUES (1, x'b69f6669d72c5ce0f0c4bac027cd961c9c9ad06fdaf5e93244297a64fc555a7a');