SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(80) NOT NULL,
  `password` varchar(200) NOT NULL,
  `email` varchar(80) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `admin` (`id`, `pseudo`, `password`, `email`) VALUES
(1,	'alexisp',	'test',	'contact@alexis-petit.fr');

DROP TABLE IF EXISTS `block_template`;
CREATE TABLE `block_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(80) NOT NULL,
  `content` longtext NOT NULL,
  `template` longtext NOT NULL,
  `template_inner` longtext NOT NULL,
  `width` int(11) NOT NULL DEFAULT '12',
  `height` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `block_template` (`id`, `title`, `content`, `template`, `template_inner`, `width`, `height`) VALUES
(1,	'header',	'<div class=\"grid-stack-item-content panel panel-default\">\r\n  <div class=\"panel-heading \">\r\n    <div class=\"row\">\r\n      <div class=\"col-sm-10\">\r\n        <span class=\"ion-ios-photos-outline ion-16\"></span> HEADER\r\n      </div>\r\n      <div class=\"col-sm-2 text-right\">\r\n        <span class=\"glyphicon glyphicon-trash remove\"></span>\r\n      </div>\r\n    </div>\r\n  </div>\r\n  <div class=\"panel-body\">\r\n    <div class=\"form-group\">\r\n      <input type=\"text\" class=\"form-control\" value=\"{{title}}\" name=\"{{widget.id}}.title\">\r\n    </div>\r\n    <div class=\"form-group\">\r\n      <input type=\"text\" class=\"form-control\" value=\"{{subtitle}}\" name=\"{{widget.id}}.subtitle\">\r\n    </div>\r\n  </div>\r\n</div>',	'<!-- slider area start -->\r\n<div id=\"home\" class=\"slider-area paralax-bg height-100-vh\" data-stellar-background-ratio=\"0.5\">\r\n  <div class=\"container\">\r\n    <div class=\"hero-caption\">\r\n      <div class=\"hero-text\">\r\n        <div class=\"slider-content\">\r\n          <h2 class=\"cd-headline clip is-full-width\">\r\n              <span>Optez pour</span>\r\n              <span class=\"cd-words-wrapper\">\r\n                <b class=\"is-visible\">l\'expérience</b>\r\n                <b>l\'innovation</b>\r\n                <b>la modernité</b>\r\n                <b>la qualité</b>\r\n              </span>\r\n          </h2>\r\n          <p>{{subtitle}}</p>\r\n          <div class=\"slider-button text-center\">\r\n            <a href=\"#service\" smoothscroll class=\"btn btn-large\">En savoir plus</a>\r\n            <a href=\"#contact\" smoothscroll class=\"btn btn-large\">Me contacter</a>\r\n          </div>\r\n        </div>\r\n      </div>\r\n    </div>\r\n  </div>\r\n</div>\r\n<!-- slider area end -->',	'',	12,	3),
(2,	'annonce',	'<div class=\"grid-stack-item-content panel panel-default\">\r\n  <div class=\"panel-heading \">\r\n    <div class=\"row\">\r\n      <div class=\"col-sm-10\">\r\n        <span class=\"ion-ios-photos-outline ion-16\"></span> ANNONCE\r\n      </div>\r\n      <div class=\"col-sm-2 text-right\">\r\n        <span class=\"glyphicon glyphicon-trash remove\"></span>\r\n      </div>\r\n    </div>\r\n  </div>\r\n  <div class=\"panel-body\">\r\n    <div class=\"form-group\">\r\n        <input type=\"text\" class=\"form-control\" value=\"{{maintext}}\" name=\"{{widget.id}}.maintext\">\r\n    </div>\r\n    <div class=\"form-group\">\r\n        <input type=\"text\" class=\"form-control\" value=\"{{secondarytext}}\" name=\"{{widget.id}}.secondarytext\">\r\n    </div>\r\n    <div class=\"form-group\">\r\n        <input type=\"text\" class=\"form-control\" value=\"{{buttontext}}\" name=\"{{widget.id}}.buttontext\">\r\n    </div>\r\n  </div>\r\n</div>',	'<!--Download area start-->\r\n  <div class=\"call-to-action-area gray-bg ptb-50\">\r\n    <div class=\"container\">\r\n      <div class=\"row\">\r\n        <div class=\"col-md-9 col-sm-9 col-xs-12\">\r\n          <div class=\"call-to-action\">\r\n            <h3>{{maintext}}</h3>\r\n            <p>{{secondarytext}}</p>\r\n          </div>\r\n        </div>\r\n        <div class=\"col-md-3 col-sm-3 col-xs-12 text-right\">\r\n          <div class=\"call-to-action\">\r\n            <a href=\"#contact\" smoothscroll class=\"btn me-button\">{{buttontext}}</a>\r\n          </div>\r\n        </div>\r\n      </div>\r\n    </div>\r\n  </div>\r\n  <!--Download area end-->',	'',	12,	4),
(3,	'icon boxes 3',	'<div class=\"grid-stack-item-content panel panel-default\">\r\n  <div class=\"panel-heading \">\r\n    <div class=\"row\">\r\n      <div class=\"col-sm-10\">\r\n        <span class=\"ion-ios-photos-outline ion-16\"></span> ICON BOXES 3\r\n      </div>\r\n      <div class=\"col-sm-2 text-right\">\r\n        <span class=\"glyphicon glyphicon-trash remove\"></span>\r\n      </div>\r\n    </div>\r\n  </div>\r\n  <div class=\"panel-body\">\r\n    <div class=\"form-group\">\r\n      <input type=\"text\" class=\"form-control\" value=\"{{title1}}\" name=\"{{widget.id}}.title1\">\r\n    </div>\r\n    <div class=\"form-group\">\r\n      <input type=\"text\" class=\"form-control\" value=\"{{subtitle1}}\" name=\"{{widget.id}}.subtitle1\">\r\n    </div>\r\n    <hr>\r\n    <div class=\"form-group\">\r\n      <input type=\"text\" class=\"form-control\" value=\"{{title2}}\" name=\"{{widget.id}}.title2\">\r\n    </div>\r\n    <div class=\"form-group\">\r\n      <input type=\"text\" class=\"form-control\" value=\"{{subtitle2}}\" name=\"{{widget.id}}.subtitle2\">\r\n    </div>\r\n    <hr>\r\n    <div class=\"form-group\">\r\n      <input type=\"text\" class=\"form-control\" value=\"{{title3}}\" name=\"{{widget.id}}.title3\">\r\n    </div>\r\n    <div class=\"form-group\">\r\n      <input type=\"text\" class=\"form-control\" value=\"{{subtitle3}}\" name=\"{{widget.id}}.subtitle3\">\r\n    </div>\r\n  </div>\r\n</div>',	'<!-- service-area start -->\r\n  <div id=\"service\" class=\"service-area border-bottom white-bg pt-90 pb-50\">\r\n    <div class=\"container\">\r\n      <div class=\"section-title text-center pb-40\">\r\n        <h2>Mes Services</h2>\r\n      </div>\r\n      <div class=\"row\">\r\n        <div class=\"col-md-4 col-sm-6 mb-40\">\r\n          <div class=\"service-box grey-bg\">\r\n            <div class=\"service-icon\">\r\n              <span class=\"icon-pencil\"></span>\r\n            </div>\r\n            <div class=\"service-content\">\r\n              <h3>{{title1}}</h3>\r\n              <p>{{subtitle1}}</p>\r\n            </div>\r\n          </div>\r\n        </div>\r\n        <div class=\"col-md-4 col-sm-6 mb-40\">\r\n          <div class=\"service-box grey-bg\">\r\n            <div class=\"service-icon\">\r\n              <span class=\"icon-gears\"></span>\r\n            </div>\r\n            <div class=\"service-content\">\r\n              <h3>{{title2}}</h3>\r\n              <p>{{subtitle2}}</p>\r\n            </div>\r\n          </div>\r\n        </div>\r\n        <div class=\"col-md-4 col-sm-6 mb-40\">\r\n          <div class=\"service-box grey-bg\">\r\n            <div class=\"service-icon\">\r\n              <span class=\"icon-mobile\"></span>\r\n            </div>\r\n            <div class=\"service-content\">\r\n              <h3>{{title3}}</h3>\r\n              <p>{{subtitle3}}</p>\r\n            </div>\r\n          </div>\r\n        </div>\r\n      </div>\r\n    </div>\r\n  </div>\r\n  <!-- service-area end -->',	'',	12,	6),
(4,	'blog',	'<div class=\"grid-stack-item-content panel panel-default\">\r\n  <div class=\"panel-heading \">\r\n    <div class=\"row\">\r\n      <div class=\"col-sm-10\">\r\n        <span class=\"ion-ios-photos-outline ion-16\"></span> BLOG\r\n      </div>\r\n      <div class=\"col-sm-2 text-right\">\r\n        <span class=\"glyphicon glyphicon-trash remove\"></span>\r\n      </div>\r\n    </div>\r\n  </div>\r\n  <div class=\"panel-body\">\r\n    Affichage des articles du blog\r\n  </div>\r\n</div>',	'<div id=\"blog\" class=\"blog-section border-bottom ptb-70\">\r\n  <div class=\"container\">\r\n    <div class=\"section-title text-center pb-70\">\r\n      <h2>Boite à outil</h2>\r\n      <p>Suivez-moi sur twitter <a href=\"https://twitter.com/AlexisPetit_\" target=\"blank\">@AlexisPetit_</a> pour être au courrant des nouveaux outils ajoutés !</p>\r\n    </div>\r\n    <div class=\"row\">\r\n      {{blog}}\r\n    </div>\r\n  </div>\r\n</div>',	'<div class=\"col-md-4\">\r\n        <div class=\"single-blog-item\">\r\n          <div class=\"blog-item-thumb\">\r\n            <img src=\"{{img}}\" alt=\"\">\r\n            <a href=\"#\" class=\"readm-btn\">\r\n              <i class=\"fa fa-plus\"></i>\r\n            </a>\r\n          </div>\r\n          <div class=\"blog-item-content\">\r\n            <a href=\"blog-right-sidebar.html\">\r\n              <h2>{{title}}</h2>\r\n            </a>\r\n            <h4>Publié le 21 juillet 2017 - <a target=\"blank\" href=\"http://jxnblk.com/react-x-ray/\">Voir l\'outil</a></h4>\r\n            <p>{{content}}</p>\r\n          </div>\r\n        </div>\r\n      </div>',	12,	2),
(5,	'icon boxes 6',	'<div class=\"grid-stack-item-content panel panel-default\">\r\n  <div class=\"panel-heading \">\r\n    <div class=\"row\">\r\n      <div class=\"col-sm-10\">\r\n        <span class=\"ion-ios-photos-outline ion-16\"></span> ICON BOXES 6\r\n      </div>\r\n      <div class=\"col-sm-2 text-right\">\r\n        <span class=\"glyphicon glyphicon-trash remove\"></span>\r\n      </div>\r\n    </div>\r\n  </div>\r\n  <div class=\"panel-body\">\r\n    <div class=\"form-group\">\r\n      <input type=\"text\" class=\"form-control\" value=\"{{title1}}\" name=\"{{widget.id}}.title1\">\r\n    </div>\r\n    <div class=\"form-group\">\r\n      <input type=\"text\" class=\"form-control\" value=\"{{subtitle1}}\" name=\"{{widget.id}}.subtitle1\">\r\n    </div>\r\n    <hr>\r\n    <div class=\"form-group\">\r\n      <input type=\"text\" class=\"form-control\" value=\"{{title2}}\" name=\"{{widget.id}}.title2\">\r\n    </div>\r\n    <div class=\"form-group\">\r\n      <input type=\"text\" class=\"form-control\" value=\"{{subtitle2}}\" name=\"{{widget.id}}.subtitle2\">\r\n    </div>\r\n    <hr>\r\n    <div class=\"form-group\">\r\n      <input type=\"text\" class=\"form-control\" value=\"{{title3}}\" name=\"{{widget.id}}.title3\">\r\n    </div>\r\n    <div class=\"form-group\">\r\n      <input type=\"text\" class=\"form-control\" value=\"{{subtitle3}}\" name=\"{{widget.id}}.subtitle3\">\r\n    </div>\r\n    <hr>\r\n    <div class=\"form-group\">\r\n      <input type=\"text\" class=\"form-control\" value=\"{{title4}}\" name=\"{{widget.id}}.title4\">\r\n    </div>\r\n    <div class=\"form-group\">\r\n      <input type=\"text\" class=\"form-control\" value=\"{{subtitle4}}\" name=\"{{widget.id}}.subtitle4\">\r\n    </div>\r\n    <hr>\r\n    <div class=\"form-group\">\r\n      <input type=\"text\" class=\"form-control\" value=\"{{title5}}\" name=\"{{widget.id}}.title5\">\r\n    </div>\r\n    <div class=\"form-group\">\r\n      <input type=\"text\" class=\"form-control\" value=\"{{subtitle5}}\" name=\"{{widget.id}}.subtitle5\">\r\n    </div>\r\n    <hr>\r\n    <div class=\"form-group\">\r\n      <input type=\"text\" class=\"form-control\" value=\"{{title6}}\" name=\"{{widget.id}}.title6\">\r\n    </div>\r\n    <div class=\"form-group\">\r\n      <input type=\"text\" class=\"form-control\" value=\"{{subtitle6}}\" name=\"{{widget.id}}.subtitle6\">\r\n    </div>\r\n  </div>\r\n</div>',	'<!-- service-area start -->\r\n  <div id=\"service\" class=\"service-area border-bottom white-bg pt-90 pb-50\">\r\n    <div class=\"container\">\r\n      <div class=\"section-title text-center pb-40\">\r\n        <h2>Mes Services</h2>\r\n      </div>\r\n      <div class=\"row\">\r\n        <div class=\"col-md-4 col-sm-6 mb-40\">\r\n          <div class=\"service-box grey-bg\">\r\n            <div class=\"service-icon\">\r\n              <span class=\"icon-pencil\"></span>\r\n            </div>\r\n            <div class=\"service-content\">\r\n              <h3>{{title1}}</h3>\r\n              <p>{{subtitle1}}</p>\r\n            </div>\r\n          </div>\r\n        </div>\r\n        <div class=\"col-md-4 col-sm-6 mb-40\">\r\n          <div class=\"service-box grey-bg\">\r\n            <div class=\"service-icon\">\r\n              <span class=\"icon-gears\"></span>\r\n            </div>\r\n            <div class=\"service-content\">\r\n              <h3>{{title2}}</h3>\r\n              <p>{{subtitle2}}</p>\r\n            </div>\r\n          </div>\r\n        </div>\r\n        <div class=\"col-md-4 col-sm-6 mb-40\">\r\n          <div class=\"service-box grey-bg\">\r\n            <div class=\"service-icon\">\r\n              <span class=\"icon-mobile\"></span>\r\n            </div>\r\n            <div class=\"service-content\">\r\n              <h3>{{title3}}</h3>\r\n              <p>{{subtitle3}}</p>\r\n            </div>\r\n          </div>\r\n        </div>\r\n        <div class=\"col-md-4 col-sm-6 mb-40\">\r\n          <div class=\"service-box grey-bg\">\r\n            <div class=\"service-icon\">\r\n              <span class=\"icon-adjustments\"></span>\r\n            </div>\r\n            <div class=\"service-content\">\r\n              <h3>{{title4}}</h3>\r\n              <p>{{subtitle4}}</p>\r\n            </div>\r\n          </div>\r\n        </div>\r\n        <div class=\"col-md-4 col-sm-6 mb-40\">\r\n          <div class=\"service-box grey-bg\">\r\n            <div class=\"service-icon\">\r\n              <span class=\"icon-bargraph\"></span>\r\n            </div>\r\n            <div class=\"service-content\">\r\n              <h3>{{title5}}</h3>\r\n              <p>{{subtitle5}}</p>\r\n            </div>\r\n          </div>\r\n        </div>\r\n        <div class=\"col-md-4 col-sm-6 mb-40\">\r\n          <div class=\"service-box grey-bg\">\r\n            <div class=\"service-icon\">\r\n              <span class=\"icon-chat \"></span>\r\n            </div>\r\n            <div class=\"service-content\">\r\n              <h3>{{title6}}</h3>\r\n              <p>{{subtitle6}}</p>\r\n            </div>\r\n          </div>\r\n        </div>\r\n      </div>\r\n    </div>\r\n  </div>\r\n  <!-- service-area end -->',	'',	12,	11),
(6,	'4 step',	'<div class=\"grid-stack-item-content panel panel-default\">\n  <div class=\"panel-heading \">\n    <div class=\"row\">\n      <div class=\"col-sm-10\">\n        <span class=\"ion-ios-photos-outline ion-16\"></span> 4 STEP\n      </div>\n      <div class=\"col-sm-2 text-right\">\n        <span class=\"glyphicon glyphicon-trash remove\"></span>\n      </div>\n    </div>\n  </div>\n  <div class=\"panel-body\">\n    <div class=\"form-group\">\n      <input type=\"text\" class=\"form-control\" value=\"{{title}}\" name=\"{{widget.id}}.title\">\n    </div>\n    <div class=\"form-group\">\n      <input type=\"text\" class=\"form-control\" value=\"{{subtitle}}\" name=\"{{widget.id}}.subtitle\">\n    </div>\n    <hr>\n    <div class=\"form-group\">\n      <input type=\"text\" class=\"form-control\" value=\"{{step1title}}\" name=\"{{widget.id}}.step1title\">\n    </div>\n    <div class=\"form-group\">\n      <input type=\"text\" class=\"form-control\" value=\"{{step1subtitle}}\" name=\"{{widget.id}}.step1subtitle\">\n    </div>\n    <hr>\n    <div class=\"form-group\">\n      <input type=\"text\" class=\"form-control\" value=\"{{step2title}}\" name=\"{{widget.id}}.step2title\">\n    </div>\n    <div class=\"form-group\">\n      <input type=\"text\" class=\"form-control\" value=\"{{step2subtitle}}\" name=\"{{widget.id}}.step2subtitle\">\n    </div>\n    <hr>\n    <div class=\"form-group\">\n      <input type=\"text\" class=\"form-control\" value=\"{{step3title}}\" name=\"{{widget.id}}.step3title\">\n    </div>\n    <div class=\"form-group\">\n      <input type=\"text\" class=\"form-control\" value=\"{{step3subtitle}}\" name=\"{{widget.id}}.step3subtitle\">\n    </div>\n    <hr>\n    <div class=\"form-group\">\n      <input type=\"text\" class=\"form-control\" value=\"{{step4title}}\" name=\"{{widget.id}}.step4title\">\n    </div>\n    <div class=\"form-group\">\n      <input type=\"text\" class=\"form-control\" value=\"{{step4subtitle}}\" name=\"{{widget.id}}.step4subtitle\">\n    </div>\n  </div>\n</div>',	'<!-- Work Process Start-->\n  <div class=\"work grey-bg pt-80 pb-50\">\n    <div class=\"container \">\n      <div class=\"row\">\n        <div class=\"section-title text-center pb-40\">\n          <h2>{{title}}</h2>\n          <p>{{subtitle}}</p>\n        </div>\n        <div class=\"col-md-3 col-sm-6\">\n          <div class=\"single-work\">\n            <div class=\"work-content\">\n              <div class=\"work-content-title\">\n                <h1 class=\"bold-h1\">1</h1>\n                <h3>{{step1title}}</h3>\n              </div>\n              <p>{{step1subtitle}}</p>\n            </div>\n          </div>\n        </div>\n        <div class=\"col-md-3 col-sm-6\">\n          <div class=\"single-work\">\n            <div class=\"work-content\">\n              <div class=\"work-content-title\">\n                <h1 class=\"bold-h1\">1</h1>\n                <h3>{{step2title}}</h3>\n              </div>\n              <p>{{step2subtitle}}</p>\n            </div>\n          </div>\n        </div>\n        <div class=\"col-md-3 col-sm-6\">\n          <div class=\"single-work\">\n            <div class=\"work-content\">\n              <div class=\"work-content-title\">\n                <h1 class=\"bold-h1\">1</h1>\n                <h3>{{step3title}}</h3>\n              </div>\n              <p>{{step3subtitle}}</p>\n            </div>\n          </div>\n        </div>\n        <div class=\"col-md-3 col-sm-6\">\n          <div class=\"single-work\">\n            <div class=\"work-content\">\n              <div class=\"work-content-title\">\n                <h1 class=\"bold-h1\">1</h1>\n                <h3>{{step4title}}</h3>\n              </div>\n              <p>{{step4subtitle}}</p>\n            </div>\n          </div>\n        </div>\n      </div>\n    </div>\n  </div>\n  <!-- Work Process end-->',	'',	12,	9);

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE `categorie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `categorie` (`id`, `name`) VALUES
(2,	'Tout');

DROP TABLE IF EXISTS `page`;
CREATE TABLE `page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `link` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `page` (`id`, `title`, `link`) VALUES
(9,	'Nous contacter',	'nous-contacter'),
(10,	'Développeur web freelance',	'bienvenue'),
(11,	'Plan du site',	'plan-du-site');

DROP TABLE IF EXISTS `page_block`;
CREATE TABLE `page_block` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniqid` char(11) NOT NULL,
  `page` int(11) NOT NULL,
  `block_template` int(11) NOT NULL,
  `variables` text NOT NULL,
  `x` int(11) DEFAULT NULL,
  `y` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `page` (`page`),
  KEY `block_template` (`block_template`),
  CONSTRAINT `page_block_ibfk_1` FOREIGN KEY (`page`) REFERENCES `page` (`id`),
  CONSTRAINT `page_block_ibfk_3` FOREIGN KEY (`block_template`) REFERENCES `block_template` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `page_block` (`id`, `uniqid`, `page`, `block_template`, `variables`, `x`, `y`) VALUES
(151,	'15e24e91ca0',	10,	2,	'{\"block_template\":\"2\",\"maintext\":\"La meilleur solution pour votre business\",\"secondarytext\":\"Petit ou grand projet choisissez la personne qui vous accompagnera dans votre digitalisation\",\"buttontext\":\"Demandez un devis gratuit\",\"x\":\"0\",\"y\":\"3\"}',	0,	3),
(152,	'15e4e76fe88',	10,	1,	'{\"block_template\":\"1\",\"title\":\"{{title}}\",\"subtitle\":\"Cr\\u00e9ation de sites vitrines pour attirer de nouveaux clients, de sites e-commerce pour vendre efficassement vos produits, d\'applications mobiles pour rester comp\\u00e9titif.\",\"x\":\"0\",\"y\":\"0\"}',	0,	0),
(153,	'15e4e898f5c',	10,	5,	'{\"block_template\":\"5\",\"title1\":\"Design & interface\",\"subtitle1\":\"Soucieux d\'une qualit\\u00e9 graphique, vos projets seront con\\u00e7us pour une exp\\u00e9rience utilisateur optimale.\",\"title2\":\"Modifiable \\u00e0 souhait\",\"subtitle2\":\"Une interface d\'administration cr\\u00e9e selon vos besoins vous permettra de modifier en d\\u00e9tail votre site.\",\"title3\":\"Responsive design\",\"subtitle3\":\"Avoir un site adaptatif selon les supports est aujourd\'hui indispensable, votre site est garantit compatible tout supports.\",\"title4\":\"Sur mesure\",\"subtitle4\":\"Ensembles nous allons mettre en place un site web ou application mobile construit sur mesure selon vos besoins.\",\"title5\":\" R\\u00e9f\\u00e9rencement\",\"subtitle5\":\"En s\'inspirant des techniques de Daniel Ichbiah nous feront tout pour optimiser votre r\\u00e9f\\u00e9rencement naturel.\",\"title6\":\"Maintenance et Suivi\",\"subtitle6\":\"La maintenance et le suivi de votre projet vous garantit de garder un applicatif \\u00e0 jour.\",\"x\":\"0\",\"y\":\"7\"}',	0,	7),
(154,	'15e72cd24e0',	10,	6,	'{\"block_template\":\"6\",\"title\":\"\\u00c9tapes cl\\u00e9s vers la r\\u00e9ussite\",\"subtitle\":\"Un projet web ou application mobile est un investissement et non une d\\u00e9pense, il est primordial d\'analyser<br\\/> les besoins et d\'\\u00e9laborer les meilleurs strat\\u00e9gies \\u00e0 utiliser.\",\"step1title\":\" Rencontre\",\"step1subtitle\":\"Discutons de votre projet autour d\'un caf\\u00e9 pour discuter budget, identification des cibles, domaines et h\\u00e9bergement !\",\"step2title\":\"Plannification\",\"step2subtitle\":\"Une fois le cahier des charges d\\u00e9finit planifions les diff\\u00e9rentes \\u00e9tapes cl\\u00e9s du projet et la date de livraison.\",\"step3title\":\"D\\u00e9veloppement\",\"step3subtitle\":\"Ensembles, \\u00e9tapes par \\u00e9tapes nous assistons \\u00e0 la naissance de votre projet jusqu\'\\u00e0 sa mise en ligne officielle.\",\"step4title\":\"Suivi\",\"step4subtitle\":\"Une question ? Un souci ? Je reste avec vous pour suivre l\'\\u00e9volution de votre projet et continuer \\u00e0 le faire grandir.\",\"x\":\"0\",\"y\":\"18\"}',	0,	18),
(155,	'15e3a6ccadd',	10,	4,	'{\"block_template\":\"4\",\"x\":\"0\",\"y\":\"27\"}',	0,	27);

DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(400) NOT NULL,
  `content` longtext NOT NULL,
  `author` int(11) NOT NULL,
  `img` varchar(200) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `categorie` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `author` (`author`),
  KEY `categorie` (`categorie`),
  CONSTRAINT `post_ibfk_2` FOREIGN KEY (`categorie`) REFERENCES `categorie` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `post` (`id`, `title`, `content`, `author`, `img`, `createdAt`, `updatedAt`, `categorie`) VALUES
(2,	'XRay',	'<p>XRay est un composant <b>react</b> à ajouter à vos projets. Cette librairie permet le débogage de layouts CSS par l\'ajout simple de balises HTML.<br>&nbsp;<br></p>',	1,	'/img/blog/2.jpg',	NULL,	NULL,	2),
(3,	'Contextmenu',	'<p>Ce plugin très complet permet de personnaliser le menu s\'affichant lors du clique droit sur une page web. Il utilise jQuery et est compatible avec la plupart des navigateurs.<br></p>',	1,	'/img/blog/3.jpg',	NULL,	NULL,	2),
(4,	'split.js',	'<p>Split.js est un utilitaire qui permet de créer des vues et panneaux ajustables. <br><br><br></p>',	1,	'/img/blog/1.jpg',	NULL,	NULL,	2);

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(40) NOT NULL,
  `lastname` varchar(40) NOT NULL,
  `email` varchar(80) NOT NULL,
  `password` varchar(80) NOT NULL,
  `role` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role` (`role`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
