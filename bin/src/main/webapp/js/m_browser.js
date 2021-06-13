
   /* 웹 사이트 접근 시 모바일 기기일 경우, 모바일 웹 페이지 구현 */

        // 변수를 선언합니다.
        var smartPhones = [
            'iphone', 'ipod',
            'windows ce',
            'android', 'blackberry',
            'nokia', 'webos',
            'opera mini', 'sonyerricsson',
            'opera mobi', 'iemobile', 'iPhone', 'iPod','iPad','Android','BlackBerry','SymbianOS','Bada','Kindle','Wii','SCH-','SPH-',
	'CANU-','Windows Phone','Windows CE','POLARIS','Palm','webOS','Dorothy Browser','IEMobile','MobileSafari',
	'Opera Mobi','Opera Mini','MobileExplorer','Minimo','AvantGo','NetFront','Googlebot-Mobile','Nokia',
	'LGPlayer','SonyEricsson','HTC','hp-tablet','SKT','lgtelecom','Vodafone', 'LG', 'MOT', 'SAMSUNG'
        ];

        for (var i in smartPhones) {
            // 스마트폰 확인
            if (navigator.userAgent.toLowerCase().match(new RegExp(smartPhones[i]))) {
                document.location = 'mobileindex/index.html';
            }
        }