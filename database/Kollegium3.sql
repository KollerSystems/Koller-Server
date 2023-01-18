/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE IF NOT EXISTS `kollegium` /*!40100 DEFAULT CHARACTER SET utf8mb3 */;
USE `kollegium`;

CREATE TABLE IF NOT EXISTS `crossings` (
  `ID` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `SID` int(15) unsigned DEFAULT NULL,
  `Time` datetime DEFAULT NULL,
  `Direction` binary(2) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*!40000 ALTER TABLE `crossings` DISABLE KEYS */;
/*!40000 ALTER TABLE `crossings` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `login_data` (
  `GID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` text DEFAULT NULL,
  `Role` int(10) unsigned DEFAULT NULL,
  `Password` text DEFAULT NULL,
  PRIMARY KEY (`GID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*!40000 ALTER TABLE `login_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_data` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `peroutgoing` (
  `SID` int(10) unsigned NOT NULL DEFAULT 0,
  `TID` int(10) unsigned DEFAULT NULL,
  `Day` tinyint(4) DEFAULT NULL,
  `StartTime` time DEFAULT NULL,
  `EndTime` time DEFAULT NULL,
  KEY `Index 1` (`SID`,`StartTime`,`EndTime`,`Day`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*!40000 ALTER TABLE `peroutgoing` DISABLE KEYS */;
/*!40000 ALTER TABLE `peroutgoing` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `roomorder` (
  `ID` int(15) NOT NULL AUTO_INCREMENT,
  `TID` int(11) unsigned DEFAULT NULL,
  `RoomNumber` smallint(6) unsigned DEFAULT NULL,
  `Time` datetime DEFAULT NULL,
  `Floor` tinyint(4) DEFAULT NULL,
  `Windows` binary(2) DEFAULT NULL,
  `Beds` tinyint(4) unsigned DEFAULT NULL,
  `Depower` binary(2) DEFAULT NULL,
  `Table` tinyint(4) unsigned DEFAULT NULL,
  `Fridge` tinyint(4) unsigned DEFAULT NULL,
  `Trash` binary(2) DEFAULT NULL,
  `Air` tinyint(4) unsigned DEFAULT NULL,
  `Shelves` tinyint(4) unsigned DEFAULT NULL,
  `Tidiness` tinyint(4) unsigned DEFAULT NULL,
  `Unwashed` binary(2) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*!40000 ALTER TABLE `roomorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `roomorder` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `student` (
  `SID` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `Name` text DEFAULT NULL,
  `Picture` longblob DEFAULT NULL,
  `Group` tinytext DEFAULT NULL,
  `Class` tinytext DEFAULT NULL,
  `School` text DEFAULT NULL,
  `Birthplace` text DEFAULT NULL,
  `Birthdate` date DEFAULT NULL,
  `GuardiaName` text DEFAULT NULL,
  `GuardianPhone` int(11) DEFAULT NULL,
  `Address` text DEFAULT NULL,
  `RoomNumber` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`SID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` (`SID`, `Name`, `Picture`, `Group`, `Class`, `School`, `Birthplace`, `Birthdate`, `GuardiaName`, `GuardianPhone`, `Address`, `RoomNumber`) VALUES
	(1, 'Én', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` (`SID`, `Name`, `Picture`, `Group`, `Class`, `School`, `Birthplace`, `Birthdate`, `GuardiaName`, `GuardianPhone`, `Address`, `RoomNumber`) VALUES
	(2, 'Marci', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` (`SID`, `Name`, `Picture`, `Group`, `Class`, `School`, `Birthplace`, `Birthdate`, `GuardiaName`, `GuardianPhone`, `Address`, `RoomNumber`) VALUES
	(3, 'Gyuri', _binary '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` (`SID`, `Name`, `Picture`, `Group`, `Class`, `School`, `Birthplace`, `Birthdate`, `GuardiaName`, `GuardianPhone`, `Address`, `RoomNumber`) VALUES
	(4, 'Gergő', _binary 0x89504e470d0a1a0a0000000d494844520000004000000051080600000062e3a0e0000000017352474200aece1ce90000000467414d410000b18f0bfc6105000000097048597300000ec300000ec301c76fa8640000304c49444154785e4d9c77ace5e959df9f73ce3db7f75ee74e2fbbb333ebf57ad77df1ee526264a4809444511225448020098410414864b810fe891481ac2452480841015c6263274806636f6cafbdbdcdee4eef73a7dede7bcde7f39cb98633facda9bfdffb3eedfb7c9fe77d7fb7f0e237beb8bbb9b11155a5726c6f6dc7c6e616c776cc2f2cc5d2f24a545595637d6b2b2e5fb91cdffe7fdf8999b999686d6d89b696d6a8299739af1803fd7df1b33ff333d1d8501fcb4b4b115188a6a6e6285595627d7d23d6363663696535d6792e57d7441dbffbc3fff947f1fed9b3b1b2ba16c78f1d8b9ffca99f8a679f7d367effbffe7efcd55f7d234e3cf248fcf44fffd33879f2649c3b772e7ee7777e273ef0810fc4a73ffde9e8e8e888858505e6d11a139393f1852f7c31ce9e7d3f9e7eea29cef969c65c8f86868678edb5d7e285175e8832f3fcec677f23e6e7e7637373336a6b6b637b7b3bde7aebed28168a554cb43ab6b67662717135666616627a662e666717637999c96f4534b775c5e1638fc5911327f9dd6eacaeaec7f6ce6e9410a658ae41b8b518bd771f45ed444d7d43a0b598471133730bb1c16755fcaebaa626aa98481185954aa5a8a9a98e32bf2ba3a49d9ded58989f8b52b1c0a9c57cbfbeb6162bcbcbcc61393630901377d23b3b3bb1bbbb8b92235fd7d6d6454363233254a5e07eb6f79b62b132968feded2d3ef3f3cae16ffcbe78feccf9b878fe4abcf7fe8538f3ded9b870f14a8c4fcc4463534b0c1f3c141f7afa23f1439f7a3e3ef6f14fc681030799d44a140ac528144b08558b405571e3d668fce99f7e31ce5fb818a572753435b7c4b61340b8aaeaea9c4499cfd1766ce205559e8b32ca7c5e5f5797dfcfcdcea6807b135e5b5b8dc5a54504af085f281452a82dbcd14735d75588cab5cbf85c217fe76f7cf6770ae8772928870fbff7f07a9e5b7cf15bdf8dafffdfbf8cef7cfbfb717f6c2aea5bdaa3777038da7b7be3d4079e48a1efdeb9135ffee217e3cfbff67f72c2350853870575ff1d34bb867bbff4fd57e30fffc71fc62b2fbd1c3b84524f7737df57e5443dea6a6b38b736eaaacbb1bbcdc451465d7d5d7476b44733165c5e5e8af9d999a8e69ce6a6a674d3c0525b286007c534d4d7e31da59cbc822ba00aabc1bb9c4f118114caf36af4363cc287bf5b5d5dfd81725584bffb8172aa0b35d1dad211870e1d8b638f9cc2d51f8d43c74ec4238f3d8e05abe2eb5fff7afcdeeffe6e7cf94b5fc24a3351cfa43d79034b6ea1e912af1b1b1b18b414972e5f231ebf94e7e8292a4165acafadab7a26508c2d26e2795ded1db16f7028fafbfaa30d4c29f0fdeddbb7b163440bf8d1682821a89377bc81818168c1b37c28cc9eb57dec09a5b0868bdfef7db7f7f07b15f7371f9e57dcb7ef603c7ae2f13875ea4980e7541c3a722cba7afae2defdb1f8933ffd7cfcf19ffc71bcfcf2f763667a326ab19edac619d3f2bb5c5057d62bbabb3aa2a1ae266edcb8155ffbda9fc7e7ffe4f3717bf4765a7075653916e71762659178264efdacabab330eee1f8e81be5e00b58573eb627a6a124b82394d8d518b87f95b41d5f17ababaf237db0fdd5bc52b80dea1d22aa15348e1fddcf72ac1dfa6325400cffedb798801a98483087ce2e4a938fec8c93878f008715d17e7ce5f88cf7fe10bf1a52f7e29de3d73060baee2254d58a011972b27583981bdc3c9b6343747475b2b0aa98a9b376ec437bff9cd78f59557620a949e9d9946b8299e676209f4f6b5f1df0e8ab7206c03a1d18867ad017805e66a48d4812f9b2860d5cf986c8225c26de04d3b64aa2add19a1141e99d2c304371560c819020ae95166ce05e65c111fc7e2b7dbfcd64771f0f0e1d87fe470f4e08a007bbc77e6ddf85f7ff447f1bf492de363f789ddea6847b0d69666d0b63e8535b6cb1c256de3007881831a7f2aa9bdad25277cf3e6cdb877ef5e4c4f4ec5dcdc1c483f8f1266e31e98b28822364991bb8488032bc816efb5b0eedf60aa322523b063ac110a6605bd62972ce1397e5e4209bbbb86c4465a5b6dd4a2d04ab8617ddf8b273c0c83bf7e00d2fca6b8eff8e1e8dbbf2f669716e2cb7ff6e5f8dce73e172f7efb3b518fe00300613f476b6b73946b44da8aaba97943608701c55651bd1630aa55f378445f4f4f3cf9c10fc609f2bbdfcb33b636d6795e43a095584798e585c558989b8da5c505dcdcd77308b992bf115c4d910ae8186241653ce27e7b333d21950798ea251b5c4f5cf1bc5ac2b0be1eefd9da802bccc5caca122151090de7ae120c099fcbd55551ec60b2df23c67febb77f33fee00ffe5b3cb87f270e0c0fc4befede6881b034e19a75a0aaae0e702706e8473b0cae46f60048e4f5b98b587de28927e2631ffb58f4f7f7e7c07e2ec9da023877b7894b2cbbb353116c97efd7c9228b73f3f95ecfe28a29e4ae5c83417ddfd5d611cd0d8dbce23bced7038a4c611e8f5a82b4a98c75947cf9f2e5f88bafff457ce52b5f89975e7a29a6a7a7a3b999ac82819c8bc75efcab9052775fcfc81ffcf7df8febd7ae60bddd68c385db38a1bbb393782f653e9edfd3248278a18df5b54c69999ab8483ed06a5727c2c3d61e7bf46422b6c444c1cd026b2b2bb1b2b48cc5171314756f054ce4e6777a89ef5596d757cb8db0b9263062697129b38163a990ed8721e0b52626c611722a8dd344fa54b8af7ef9cfe2dd77df8d070f1e6098da3872e408207f9aeb925289fd341a5ee1754b9313e3230feeddc6e5cb805213f1470ee5cb6adc639d89545c740941001e5cdd74653c3a515d54010c8dc1c1c13871fc781c3e743869e812e718f7c6fa2c24676e5676399b38e0efc58c2d5cda3154d4c6da463e6bc9351580807bb97c6aa282211b58d879f81ba698632884d7a8e17acd00b1eefdcacbafa0e4d5f4da1632ccf0f03034fa098cb9969e5b5001fc5b4481a59df5d5915e52585b0bc84bdc17d1fc36f1b3b5690a5a4ce031febc98ee694c6e00382a41cb0980bdbd7df108dcbdadad2d272ce79e181f8ff10763b8a71627ee99a4716a3cd691ceaa4166bdcbefd6a80714ded732c5bd5c2eb029e0f81856267338a661e25c2445c6b94650a175786333fcc1d7d7ae5e4d0c912435123603830384e507730edb2a00e3e9cd1ab6f4d8a1fd234d0d75697985df10a8042d2ebe81c6b6b192485b4d5124c8388083eab2f2f9a1a121dceb543491baeeddbd1be3083e8fb5e6b1b84a5041e28321a33b7be8de9eaf45e4fa2ba92014a052b1b2e33bb6ec7086d43983f0cb840d0367dc9a6154a0732933afda64997589f67ef6e0c17d8c0458122ab575f531b46f5f3c7efa546c813be901e20a87e3968e0ff68e94b14a67471b17b7d059ce4244218b850acfae611063cff82a3a013eebebeb8bd3a74fc7a38f3e6af8c7abafbe1a93e47cdd566ca8a348b15ad3052bc4c47cb04b082cc4e8cd5b2889ca0c411709b1393c66cfea02a4af558e16d72bb636b652e0068431d3782dc331bd126568981c83434fd0fa9e3b8ff7196a569b8f335705ded66390452f50e1a5d3788038a67baea07185f7cb8a0b91db397ccddc3347fb181c1a8cc3870f65ac4f4d4d93ebefe7e40d816ee8af0af27ababa31af9537b1acb4d88976b6b7470bca51c83914b1ba8c6b737d8645f166890adb53e1c9e27856016548560577c826290859020594c426fc77870ce3859c43636353e285e3e9a58f5256af305e450195ba213d60a0ad716495dcbcb8385f119e7fd5a4ba2a06ab2e55088e6e650a73520df0fe1ee8abd59d82094e6a5265d4a37d5dd91048b4e773e34caf307bd41906848af584f5bc965f417895a767a90485f67d0aae383c2b88eccdf1f59aac031e0ae25c0d3129b9e0e6f97a603d29dcebf81b53b399208991d755d33cd2033efea15323c6b28f32c2eabad555b859ba54a56cd52a9b0c2e71181ada9755dc02ee353131910af0a20abf46ba3366a7607e5ade89eaa2e6e14604af65a2fe7686dc3c36368602163256b592296e6f6e0ae11493eaf299e7c8feb20ee0488e402c4b7dc5a78a3c15ab9a0f3394986f5a98ebf60ff4270eac01aaa980bcfa4305fcda2fffc2c8202ed20b211aec1f84c5f5c1cf5b285ba9f51fc68a82ec403715a2bf7f2056606c0a6fcc7b91e4de6408d39c7cdf38d713042739beb1ab42457bf3f62d28f21c044685198f869a61e6788915cc51e1e19c4c53d427e52254b24194a3f56d70a80815b2c658769e36c18f4dc26c19be31bf30cfb110d5cce1c0810314783dcc7b353d492f576b866061e6c67bbbbaf21ae56bb229263549debd7ff75e5cbf792311750c345f25869b5b5af3184388f1f18af07a4c27a46967732796c090bc28d396c474777756783d0a90f82c3029f980086f0895f13c5d55ac28a1c0edad4af1e275154cab67bc33692dbac5fb1440ef14a3f0a81ace2d23644d2d00c95104b06b78bf8b802ba4bd4eaace8f7efc13b1efe08158202cd3fe28da90d37b0b67bef9d55d199256d48d13c018cc2fa591d7af5f8fabe4d549c0ceeecf064ad2fa7eb7bb5b20f752ca926b67a767f33c5d5e57cf0a0fe1ca84d11e9a4b6e5448378cd1b8144f6af98dc54b655c48100690c4c816ad0d548684c5f4b8ccfb458cb58e52ec34ede22da6399560876acbd041b8dac499fad8603e83b8fe8ffcad1f8ba6d6b6cc2e869b5eedef969756a2f0d65f7c7977c95ccca1563c7479498e831bfbbab555dd7d88cd02a0368e02ec0b8abc8290d6b36a13ecaa39ccf996b495b296ef19b0ba5cc3fb26324007079e01e596bad6c341aac9dfd580a48f75529e2e6c8bcc068c45d2dc3c85120af079626a32a6089f15e35905a050334a33e9b60ada6bdcef22dc0e6e58e6fd238f9d8ce77fe447d278ab789e0f3d5405581117de79e16bbb766d57104c64965e8a96756856605a04ec0c03bb35f7e1d62b5846a0db61845291b84d00aba4cb862c9cb47c5dd6f95abb192bcbc69a389a1b9bb3ddd5dadc86029a2a8c10f659c663ca28c86b6d93ca5657d6609352e76914309fa125eee8950f26c6e2e6ed3b718bf92caf43c9c9544d50e0ae9edee8eceeb23a8b2246b1dce9e0fd89938fc6096a9355f007a9537843ca5705784e61f4fd9777d7710dd395a0e62126084ab5087387dadd107870ff7e0a9fcd4a5cb2025eb5d41075a4b6e66c6329ac69ae2985a69204076c7ab452188915b2365dbdb11e25d83ce1faba7215133676b369b15d01dd55049609ea998e6b5a5de2791acfb871eb66bcf9f63b711be6b90eb6d8886d835b989e1b5a9aa3ce39e01147ac4d8e1e8d7a94be0cc6d999ce2ce08102f480d2c8afffca483dd6a82166b488829b4674ff5584bd75eb56dc64c0190646b9199fb6b4446905ec85740c9166ba019b6edcbb17e0b33dd6c584fccede40475b7bf204c94c720204af65bc1a5cdfd45b25adc5450b6600145ba882e1f1590da124b3cb3ccfef1af1aa16c8563d9e2556cccece33178092f9667d4298684c4340851c22f7f7c258371248bdb46e5f2985997e826ee9e7fef1df1f69edea8906b4646fae8567539a69c6b4363a3a0a004e6558588058d6f265d423c4605f7f1c3d7c38866186768cda39bfbdb5728d5626dbd5de961c40cb5b4598e6c40c63d385980ae6f00dcf1efc2027e9e7a2bceb08660af141050876a662599ea0270bb578025b6393390992c6b99ed5ded101631d4a45c8fe32cb0892297cfe8f4119e71ffced1f1f590254ee5cbf11f3d33319f7f2775dd69476e3c68d8c3dd393efad06cdcf3d5dddf1c8891394c02712d4ea98ec5e2faf8ec9dac0d4722a33bd4ec06160275205d14a2540acb4fa9ed0fc874f42bb119e1353298297dcc06b3961156618a99cc9f1a998b58e208b69a04d8e325ed34186693724ec6659a1a2783dc3879e5b090387a1c6f9cc273e3a3246cebf70f66c5cb97029ee8cde017816f2cb4ed2d53cafc58519942367afe2624d750d587d1fd63f0a791a881a40b08a0b4b9d2d520ca3eaaa1a262e4f47603f07e4aa4a08c1eb320ad0fdab10aa04e52e206c0accb577c501ac03ddc1b2f0020e3e4aefb0bff7d74a2c830f2bc9484dbff97b22a80a8fe9eaee89defefee8ebef030b289151da0e6ee27c045a15e0fb245e4f1e3d30626556e00329aeee9a6e85c53b7123953546fabb0be048946acbb5d1d5d119fbf7edcfbebe6b84a55d2e246be31a955488dbeac21c0eaa0214baa4c6792f7fd01d330410bc72942b964f2f4062c30161930e336971c947458887d780f5d97b582565db25da2ea0307e33bcff409c3cf5180a18c85012230ca3ac3118d74785e5ea7958a07f70201effe007e3c31ff9683cf1e49371884acf38f36a0aa86b97b1647d8d882fca37655d2fe1319d646192cf58088519ef1a4d6fb025a5fb3a91f40804d50a86936ec92915b7e73b0fbd61cff55d98c9f71cb852e5733ef328197284aa2067f5d7d651a93005f2ce4ee31f5c22d318eb7b42fb70381f890358b7f8e4879f8e4ffcf073f1911ffa649c7eea43710a453cf1f4d371fc91132801e46620535d3328dec8c54d753535a239dac3e87b74d518d46b6c38e8620a69ac8afe4e4a00ad7c0685b5718185a5b539352ff4370e2dbef75a42e36f549c0a4801f8acc4f87a49231cc0ccd04acc771afb78ad8760a9073aa6cfb2404fb4265178c74e057cecd96762e0f891a8e96c8f6253431ed56d2d492a3a4d63bd7db8fabe2c96a4b9454c5c2e6b21ddd814b4c5752bf1e403b69e312762274565307fb38b7b16cb4ca01a2fe030dc2cb93385ad6f3219a4224cf6bcc1f3f428899131aed0e2815d1d1735b26842017ea7c25572075e20f76f240b29b821a25174f5143a8d55f9bd609f0ac2bca0e70613273ef0347c3d0a0a584769dcd214830786b3e575f8c0e1c40089d0f6f62617b777b79eef4d4151dc8d6ace71f07abcc4d0b278595a598ae5b5e58c3ffb81da7373738def609fa4543bc5364477c9c92473f3594519b24c80b34cce2fe331c6bd0ab7e25300db5f3641558c7c45062bdb33dcac03044a41d3dfeaed2a64efe1672ac6675593f1a4d51281b1a6a5ef165ffa5d15c2740e0c44776f4fd6050ab2a749cb50bb2c6bb8d7069fed402db738cdc68c97760fc13a56585bdf8a258895882d682daf2ee7f95b7ca7f557284a2ca6ecf1bb3ab4abdf0baa485740198582e028e5d6620f175a385f8ed1d2da9c824ad4a628d064917a47f20bce5197199ae94d9506497a97f2398a9ab7a8d14d7c24a0a9194ff63d579081b5115702d33256dbc44a99aa349a42500ae35428b20efb966371653326a7499f330b4c6c91e2658e026a9a327a8af728606915eb7320f8dccc7c8cddbb1fb7aedf8c1b57afc7a57317e3c2bbefc595f317e2feaddb313f391d6b286e8731ddc851031ed9a0b54b64d1d547ae17abecf8aa5cbdca5e44668d87c29a71345acaf737acef77a5cffeea2f8f28a93ae7ac74f354005faab5c4739e272884ce9c7927173aadff7bbac9b1cda440727b5515d4b68eac8112e61796e3fefd89b87b6f2c779acc60d5098498c1c21639bab29941cc585fb3d2b47b3c915d24fbff57af5c8b4b172fc6ed9b37203ae378c54cac20d83a82d910114c5d9d9258258d268eef52a9de80b2cf2d50df13db03a467b38345563658518efd428dba27bcde9495ec677ff95f8c2860014b661ca6022a9ec02f7123400b779a98988cb7df7a93c94ec6e0c0500c0cec2315b681aa1432c51a2e51caed35376fdc89cb0871fde6680a3e3e3e1df7ef3d804ccd8017eb49699bec38d5d643abd763626c8242eb414c4fcd649fe1fad56b71ebc6cdb807399b181b4329288712781ec5afda1730e4ec19502469e15a52f3f8e438d5e1684c513e1bba2ed20c0defc328756050a58a34dc1c3bb188f35c335009a5dffc859f1f0173a3a0863cb438dea2cbe9196a4d7cb02bf4da6bafc7dddb77e3208038d03f8c251b70b90dacb814a377c6289ceec53d2c3f35354bbcafa0fdad5834be71fbf979aab965264fcc17a06c92a3e9879d273b5073788284cbf86e27ad49c25c72b7e0b254b74334373793abd7dffcc637e2cd37de484b5a2cd9e9199f9c8016cf65df6f080f3878e850165c8685fd0b152038ea01c954b1be8b2e85f58befef0a82c9c5111473e751c121e2c770c0edce4195ffcbe7fe53bcf4edefc5c9e38f52f1f5a7f5f97134d4034405d95f25465d7db194dd009dadeb37365671c1cd5cc9b1ccd5959b9b1b6313eb583ced3f70303a082b0b2fb3875d9c76d2b2abd28390b42dce9d98b89f9e6827eafcf97394e9772ba487424efa3bc77877c61f708cc7d31ffe707cfa339f892ef0c1f69dbd03b3c620e9bc127a6bb9daf4de9933bc57400495982870c22c3a488a422c00ecf99d54d28606a90221d6b1f66d5c7b2c95d0d33380a5487f35546a752dd150dbcc25dce080336db990d2406a6c23661b381de68980cf3effc3d9ab3b7cf478f4f70f466f6f7f82ab61e1c2c91bafbe1a2f7ee73b71e6edb7f08ea9747d3d611b0bf742783e02597bf2f4e3b189e0d72e5c88bb146d5bfc06178a19845e595cc0d3004edc5d1955804ddab5b5150abc6bf1faebafc61b6fbc86e1d1780acef32eecca36939e2017d84101b23cdd46f6a66bba18e1c3e7dada3295a3d4b81e175dc7454945364c895d1b2877dd3a07220ba53906e449cafaa9e79f8be77fe233f1e37fefefc4e34f3f152d94cd7688ba205ed265fb87768dc7b8c6cd1bd773c94dcfd9642ec803bbaca71aad6cb1397cf040b2547797ec800d4786f7c79103073002b8c4efcd65ae47b849cb2d3802f96b2857a0953b947eeb5fffcb11483b02a380bd2244c6c7fb5c8c809c08840a7217a47df3f5d7a291586a812475cb1671d532e73f78708f2a9294b5becc6417c18645f07403c0ab058dcdcbe6e06d5cbd353efde91f8b038f9e881eaa35c9d4d2d262d42384793d57a15182fb91dc2b249faf83ac35c0505bdb5bf1a4fa6490526c6b001766d58abcc0eaf5b9e79e8b279e7a1aafecceb8774dd1efd6205be7cf9d8fd7c1b1eb94feb6e8b346f9cd5ff9c5118237dd3e6b738427269244088e6683646180d3e4fd7bb8e62b2863253a994c4f4f07d6af436754657353f8c5065e01b96ca8227eeb48475d4cbc0c1abb7d0d7a5c5b8ab6b6a638fdf8c968ebea48d6bbb4bc9869cac5996190bb9e49959987bb3c5470ff401f82b744775f4f0c0c0f457b577bd437d567c93b30349454ddfe650715ea6942e2d9e79e8f764a61db72f633c7c832364eae925dde78fd0d52f4fdec22654fc12cf0ebbff4f3235a7d57a1719322a92273bf699194a107144d93bc5ec552572f5f24674fc0033aa3afaf3b5a9bb14c6b23b9b908185693962c83c115b87fa16081b49142d7112ee26b13963c7af470b462a112f5800ad7bda749b3078787516c7b02632b959e4218b76d1dad317c605f74329ee1298829b44d177980e16983a61b40d4adcfbcf966b6ea97a0d9672055df7df1c5b876ed1a3c613eb386dd68cfb30e29fddb5ffcb99122f16eb9aaa533c85046e200212088e043b13abf10b36892e0487ee00e12dbdcaeea34e2968d7882de5057e7b639d7e56d9856e72a7227d861d7c606860b26870f1e45692d495705608b9e0de27e93186eb7c1ca6f3ac1857ee8776f4f57864123d7108f9611629bf4da58d790e576916cedda837d0c59ab2dfe79e6ca14f3f5388ab5a33d05a1aa4b20ac43b44cfcb98658b8f1d23776b79071999890d70b71b6c35ccd115cdadbda117e31cebffb2eb9f7cdccdff3f333193fba6d15b8514d79ecf639356b6a92806f324909b2b1353bbb402aba93bce0e8b113f1c9673e1503c78e44b999bc0c7eac62b5b16bb7e2dc5bef443374ba8502c88515d39ed9a80aefa9e1b775b87e82b657b53e20ddee6c6c47cdc366cb268a94a42fe3daab64814b972fc56b64918b972fe3e125986b13851398030db7b0d278a5270e0c8d5c387b2ef3fccd6bd763617a065648c545cc53c9440315d9347174e6f537e3ad37de4a06d7d2d20a49019050942cd24d4ab9df06cfa96c5dad3441b5c2fa2a69091aec2a705b4b7b1c3b723cd71f1bb0aa1567a186b2540fc408d3849673d8585fcd6c50e2437419750db83a25742d02d4038c590be0be3ed6315c163d8ce7a2cd24f3ef8609bacfe812825f8755da7ab74192200ba6d9f04d9627bebd8b55df7be3edb871e152ccde1f8b5d727c1db9da5e8fe5e936135fe2a2731c95dd59964ea2741deedc94470d4adaa10c5c8315ae50e86cac997e48a354b7bef6688536ef1f3a10dd1dddc93257e716629d18ddc6eb8a10fbc696e678e4f4294adfea98599c8fc555148a87b5b4b5445b6707c4a8331a10203d80a999990cd74d2b5304d1dfdca1fe1669eeeab9b371fddad5b807e0d979723146f7379da3d254f62e4a582343949e7fecd111f37b2f20d2431ae9686dcba6a751a2bbdbf69a457873bb8468606030538ba9cfee8e4d1257849a9b9a73cf6f03eeeb4a90ef658696a793143ad6ee3655b45696c44b0b8409450ae9750b2b6ea1247b09b38c73fdcae51fec4b963196b17e0daf8b94e9bb5ccf2aae0a4f3474ac2a4b849f6dfd6d047beffdb37101d73f77f1423c8015da29369dbb1ddf051d15e29aa31bbccd06a51ffdc0a91119d6e8cd9b711972f0f69b6fc5eb10853b00c724006237671d92b3018d95198ae473e4fbb656dc11b0732393ae6f0bcaf57ab3c6ded6b84988c7d52b57b3da339dbafa240bbb76ed0aa83f1e63f08aeb67cfc7d9d7de8c8bc4ffeee2727ade0ce3aa74e4c9fe9e9940a04bd0d3ef8d2dbcd40ad14ddb363faa214725acece2c899f7de8d3ba4ec15589f565f23a45ce8718d5346a9eb3b67af597ae6c4d111d7fa7411e3d9e2c77efad1e3c7d3222e3775f576472d7138876bcecc4c2638598bbb3747d262dc4b604471d1def834e6476f8de64608e3d93dc4ee351c1fbf9fd5ddcaf2422cc0f61666676319fc2812ec478f1ea58a1bce3276118a3b4d056811a402cc147aa508eeeb1570c7eeb5cb73793306e0bb4bacbb9bec6d38fe341e940d9c1d0c982b466ec55bc52b096f3d17396bc49e7ff4e33f3a624ad0826e6aea1be807a98fc57198da105473f8d041406520979cd771d925d2900d4915e0f295c6b0f811586c96c8b8445ab7bf3c40782de022854ccf8c9a8d093cc94acefd3d2e621c3a76341ef9c0e9d8ffe823d104c1aa86042d03620fc6c7b2ca739dd1ddaaee31726fb1cab2742f17cb0988864401c17678f69c575e7b25662c8d9993f372e79bcb795abee8b88c5f8d51a4c7a57ff54ffee1482e4571b888e082c2e0bea1e807350778ee84ae36c0dfcbf5357981552c232ec8a41cd8446737295d8d58d6255d9e72f3d3ecec5c121229abab4dc6b41b22f42c5bd87da0f5c12347e318821f40e94d30bf229e588d72457f7778b8db53ab591e5b86d8752ebbce40396b48387eae3160d51dac7af7fedd78e9e5976396d2d9be65f62eed10e14965e6a9d51b987f13f368b509bcefe0c1d88f957bb1b2db48b4482b028bb8f5005089c9500a468de180777451b54943bdf96993c9483e64623ee399286217aabc4139bc8aab46a6cc6652a66b090d640c0f3febeb1b8803fb0fa11c809189b91f6082e2c970dce2ba12a8938f9e8c017eb70436640b0b011d631381b9746c328059c09d20951d602eeabaadcecdd995bd866eccdee47b511fb21a6da4d15eea973e8e6e5271e9f77efb374674d1f6f64e18577bf6d84d391d58cdcd072e42f8107cccedf3e4f4e5c5959c941657605998777f99932d40a4a00b101169a7bbb3bca949a5d8b47c401d3e333dcf7baa4c7e6b2c8f63657b82772983a7eedc8b35989c98e4228c19621ee50c0e0ee53e00b7c3003c217993466f9399ee106af38c67abfe3219e0ecfbef81314b4994f4d16a7ee71ee82ec26b088feec5d3da30680369b6b0357a69570bb847c8ade7c6a87d35abad2a062be0eadba61f839dcb4d8ede8957bef752dc254bc8c965532d788beeb8ee7e5fe2df5d60ae2c8b2b3d909e99b9b9a4a72a410ededcdc92e5afbb436c7e08ba5e5b76791be074ababe3d9e717ad6dc39f7afc3461d089ab578a357783786bde0ca1f6edef7e3726a62612bf2e5cbe10df7fe92532ce22e1b2cdbc0a39bf7d083e8857b9ace702cf5e9fa0b07ee33c7590b645a57cb0d70b14178c2d6b846c99f3b51b9d96a0b56fbdf1465cbc70bec2dde5e9d4026e6bf15cf703b9d324374792676d8adacbd7d5070686a28b82a57f60203ae1f9a54684a02a6cc4f3f4af2271ea02ec280cee2d52b1bbc9dc6360697bf2b193d98c350cb670fd32e8ef26086fd1f9ead7be16a3774663dffe7d31353b1d67de3993e0c78ca1c955d93b3800a0f7637977aa08808261ca2972db6672075765f988a9e0117a45164768719774b203b86d614173ae02b8f9f8e3cf7e2a1effc8d3b92cb5be4938e02952d61a286ee528434d27b215d6c5e0070f1d8aa17d802b78633fe0c0f163806c6f14a92057d62862b09a8b29ad58e920a173f418b419e2e51aa0e3ee3d9c7bf6f8799d9ba77077b7c55909ea397e467c6559ed363dabcb765cbe166f36038056c807707294fecd2ffdb31169ae0b13ba8cf7f2d83535df5aa9e51d1b68d33540f3ae5e61ccf70ff6c7bec387a28db278036bbb8f408599222b2b32b035c2c38accbadb3468fe9e21b78f418ce6f1940790956b57aec4bb6fbd1daf7deffbf13e05d728d79153f400c8070f1c8876c24041dd0c9d9c1f0115a1c206ab6376612eaedebc1eb36040ad9e48aebff7e09e153ee149b85152f748a55b65a6840e5fb8bc9717f54a0b372eeedebb7923eedcba4d5a688e7d58d7a221577e757bd2c8de9d966bb8a8bbb8dc82620cd792365d4d9abe733bfeec8b5fca49c9b3b58e6c708f1055ee1b9ac9cc90b7dbf19d4dd0221312bd67a0a973844d3d98710432f4ecf3cfc5273ef149e276209689f1fbb7ef32d74a689a7e6bc00ec1b0aabe3a46ef91f65e7f2dae01a0b6c41debdee8685483da8d54a95da4db03785d3f6575e5aeb7aac4957c30d7d24f3dfbcc8875fa22c4c5bbb3fc81c0568dfb141c94cf2a64c275c0f54c7d4568686e9cd60a648a02171e635029354acd15e5bd4508d39fafa5c52e60cccfce6788c9fe9600c74d50ded6f731dcfd99679e89cffcc44fc4273ff56c0cecdf4f0417b26092b5ad3247af2f14d7e2d62584b3f43d7be942ac11627518c492fe16f3b0a7b857f478a3669bdb770883dc4fcce7ce4bb057aec27ffeb55fdaf51e1fbb3e567ba69fca5e3ebbb86e6fd9252f6f568a0af4b1bd0b36002c37ae5f87d24ee564daa8d86e5fbf9114d7e247817fa065ce911e2f20f0da0a5903022320baffc0850a373a5aedf50c0d442363d672e402069eb189f03ba44b578726091b314aced1f0909f6c12c35ffaea57a288902d10a59b6490175ef856ec9a6d141e0feb24751e1a1ee218ce6e95ee6f886b0483a9f41fffddaf8e0cef1bce9d9b6a48a0abdcb393c64c2d299448ae4b1be71eefbef34ebcf0cd6fc58bdffd4e5cb97411e2a1f26af2e2c9db19c062c3f7de69e2de21cb522bcf6e2acf2e3b4a809b1ca10172220bcd3bcf10b000806d52adb948e284d729d1f55215e3a6292af2ec582d009adf7be5e5a4c0ed00a71e7af9d2e52441debde67d10d95c45d9ad7888122515c7a886ab4a281e397c24dac9cbc6bf7bfa040d73a4393e0f14a2f0f6cf5440c621835bf58d8f3d888be72fc4b9f7cf01a2d36975c153022267cf3507f18650d21d4d3deb30b509f87ade520329b2587ac075bcd6ccf414313f1b6b94cab6d9457239bce9d582c8c3875be24ccb62911e514718ca2e7bf0ac569e555cde19227de387959b30dc69becde715b66afda2471745681fa6ba32821b0262804a5670dd6e8befb42af3e7875e98380424b3268065e56e6eb5eaacbcaa82732d27910fde9b4da4a41294c989b1b80b70de270b8c53162771c2cd1797e6c10608134a92ba9aaef2468bed0db288559fadfa8a215ca8d17b7aa1ca9d7a14c77e706388fa62934249a015e5cc46ee415616a726dfc844a82c728f85a9e9ac95d788d1550f5c6d6f79d9a3a204dcdf0b729229cae2426bb84fc8f4246545deb496da4eb70727049bf402bfe45925e99a52530533b5da54b1a798cf7c5e10fa384fd75701de285970f305aeec65b820567fb8cb1cfc911c8927d2e47d4354afc43ad09c5666b81f1c3b28a272459e0b8426a95c2516bffb97df88cbe4e17bb76ec1c76fc48dabd7d235558aeee3763463bea2b59df4083382373f5bb058d9b9e858e9b37b3353c54aebebabc47d996ba0c85ca189e418864902adc5080ccfbbc2f75b76ef1f8220f5673bbc16010d971d330d23bb40e2f52c74a4cbee05925758049909b466d6248ced5f97a8a971b4ca8608952e6eb8246f1bcd4d1bbc608c7ab00782d5b6bc34f22d90f3d5575e8db7df7e3bc6284cdcbeee0643094f5261262d60f85ae494101916a3a3b7e226244405f4d9386170ad9e99007369b074579453cd242c87cd00363ebcabd425ec214aee9ebe9e6832eb20a81b200d296fb5f5a66dc7f14a0fc61fe4d29856770b4e816c2273b4c3eb9fe47021c53dc5f7efdd89f3e7ce250e89658ed96b7bbdbb373dc8eb6bb4dc55065e14dd1efbc8d1e3f1e10f3d159ffae433b91f48c1f3ae0f40508b2b446e50220ceca9b9b7b71966e545bc98bd4297abb446f6fa41bc4d5cd7565a6eb9e19f9d19af811e930089fcbab1fd3e71658771b878ec20b46b042e824ac0ece2dc84a85963e47d4c7880abd9b25653b137665a2d5ebc78316f98b47eb030cb68615e86965eec660aac92dd26d161726a26aee1f1a57fffb33f3b72fac927e2e4e9d3b9bbda98d2caa2be775e687d9b251647a610b7aeb76401d418939313317a7b94cb45162ccd2d4dbcda5b50adb85f6e8ce239b7a9704d15610879fb8a87ad2fef2ff2f6b9bcb11a2bda7471ab8b1cdf3e819922375610e72acedd67ee437ae5f5d7f31e061b27ce456095d079ef42a5f7b79d24cb66ac7fa9420fe2b42cd70d738959e93ffcf35f1869ede9cc2de50aec1614577e253e96ae0aaff62437b6c436f8bc0d777522e3a0b9779498962ab7c2b5a4d002653eeb390ace443c7467d7012dbc245153a43d27ee0e0f53e022e9cf55debdedf1768f2dabdd8ce5dd25767eeba9e66a70775be12f53315ebb711d812af723bb74e772999bb557bc16e1e1fbc181be6823c5db1dd683f7ae6b895e7afec4d19109d2d13c65a4292ab7c2e3c6de73a335bd6d5e37b239e91f35d1e5b5b4c8ed26854b972e65b7b7addd3f86d09c0adbdbcee61d619b84416513250ae0b972db2dd6e59cd9d9198aa3299ea946e75d3cf1a64d777c57b6ea0b7aab809f006bdccb1a6bb1a88d16c7f81e75bfe191fd3ec2c563786808dedf13de9a9f0a01030600eb56bcc7b9e5ed3b861a1821a52fbefaeacbf1e63b6fc4a52bf6d1efc6e2ca02310270d5c8f874ee0a7959a4ea12986c62e829c621689571ed3ec36ca0e0319547a55a53857a8096af648fca3d7f7e663ae3f4ccca2ec2da8c597ce819d3a466ef14a964a2cae6063bd1dac4d5a28c6b70a8066ff5cf76983e2567757c8efa49a39b59cb58f79b76cd4e32517b8b763e322419d39aa138bc7f90bafb4822b1c056eb725541caeba60804dc7613e22cb97f19215df074db3a9231006501e969ede10d5424caf41a73aeb16ee9ace5c9e58681e140d19237663f3c1295b98e8b2cae31ca01fcbb02f203b1c3b837c378b890e97b86496f94b849961494d35d872275eec40aa1538ba0ee2269c55b35894d116fdfb19b9c7f95026a6d7878ef43f1a90f3f151ffaf847e2f413a763701f05494b4394ebdc3889e53756714f6213f7748f8f13453c0e6621567061055c59b219820298f41e066869279a7f2c017753097ea7043e6789cd35e508ee19d27d254da64cf7fd8927ae0ae70668dc58f4cecd8f09632a5b82c5a1e05e9b30d8e168c25becfb0d00ca4d28cd546837b88a4372e6a2af99af9bdaa1bfb72f8aeebab09aebec6a23be2933ddcf8bdab6763672116412805a5b5b66625c8043ebe4038b4a56a4c3495e78ae005fc5eae90b0f05f5f0b59fe5c17f7bdf2bb86addbbddce25345be0f6ff5ca790eebaddcd14a802147e77b74293fdc32eb560919ee59fd140dbd9f2d603ac060d913af70232a054dcbf51d4deeab27b5f0c41c006fafaa3f4931f7b7c641df7deda01ac762130585e25b8b36b129ebebaba9424c32aaed18dd49024498d539903bc04aa0150761fa446c093bc3818c649cbcb04cd841581fdcf8742541421337499dddda8de94d90369e961825ade9ba90c2b0b1e77a99aa1f266698e2a8ca1876ebbcf99630bb07453949d1f2f3e3531992eeefd451d64282bc2ca2a5665bdd36d7249ee9e1c6e1d999cbe1f6b9b206653293ababd31c97bf1dd62eafd37de925ec341d5d5c8d1a02b023460a01e73ecf8e1f8e8473f92e0e45f9c328539018b272e9020b7c70af71e956db96a05d7ac92d737665fd1dbdcfa60882ea4c8ee3c5b1dba08225c2a7841acc0431b5beae3c011e8f390b7c73432e606f13fcbef08490457f90aafe00aec6e1343468c118f34505511d6796aa87a647e692c860fb6c77e8ed64e387dcd46d49437a2abdfbd7a60025598474b9ba988d4588f50d53b516ea0ce6f745d703dce9e7d37539a56860b664193f187d6fd4c15b8da2c90e54a1280545dd38820f087f68e68ed68cd7d40bdc4af4d1605171adc8abbbb6b4602e1cbd41a75207ead8b220b516e294453474d0c1deaa696a0146eacc30b21408c9729b38eb9bb7608aed4d496d3abb3b822ecbc95c7ad7d855ff9ccfeddc347fbe2f91ffd28955417163166d510532e79c11219c06ca00b52179021dc88b0b20aa9d990f59178b68a71f5ca682cccfa8790ec07e03deb009c688d24fee518ad9d2086cbbbbd5e05d4d67bdbad955c43b47734e1fa9dd1d5dd99c46b7ddd34456c6fe207b89b4b5fc53220594335d8405559bb114b6bd3cc1192d44a0d81a296e7d6626962295efbfe7b3135be88195c5576496f170fa80322d6f9ccbf84e3ad41f5cc157cf8bbcf1d18f9e4731f8ae17d1db80465f0c62227ac31a8aee2edb1db684b8486c0acccc5f4d89db872e1625c3e7f29c6ee4ec6e61ac2ed946371961a1e45a03bbd30ad908ba606bb9d2195870befe8101cdea7585fdf148d75102b80cfd5a93600ca78d75f3cd7da434a4ea064fc0b6ca27e5569074f8a989fbc1b13f7afc31e6731cc4e92a4d6be81989b226d937d9a1afc9b648d6908adbed7d3d825860aee722d94e3ff033e8d88e0e2ce2dbf0000000049454e44ae426082, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `teacher` (
  `TID` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `Name` text DEFAULT NULL,
  `OM` varchar(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`TID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `user` (
  `GID` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `ID` int(15) unsigned DEFAULT NULL,
  `Role` int(11) DEFAULT NULL,
  PRIMARY KEY (`GID`),
  KEY `ID` (`ID`,`Role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
