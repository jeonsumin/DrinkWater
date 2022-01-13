# DrinkWater

물마시기 알람 앱 

## 기능 상세
- 물 마실 시간을 지정할 수 있습니다. 
- 추가한 알림을 켜고 끌수 있습니다. 
- 정해진 시간이 되면 알림이 표시가 됩니다. 
- 정해진 시간이 되면 뱃지가 생성 됩니다. 

## 활용기술 

- Local Notification 
- userNotificationCenter

## DEMO
![ezgif com-gif-maker (1) (1)](https://user-images.githubusercontent.com/51107183/149273954-4ae944a4-5d19-4f2d-8cc0-abd1e57deba5.gif)


## 배운 내용
#### Notification 
> 알림센터의 알림 배너 소리나 앱뱃지 형태의 알림 
 
- **알림, 소리, 뱃지**

	사용자의 관심을 끌어 앱 사용량을 늘이고 특정 행동 유도 

- **서버 없이 알림 세부 정보를 로컬로 구성**

	날짜/ 시간(Calender), 시간 간격(Time Interval), 위치(Location) 기반 알림 
	
#### notification Request 
- **identifire** 
	
	각각의 요청을 구분할 수 있는 ID 

- **Content**
	
	 알림에 나타날 내용

- **Trigger**
	
	어떤 기준에서 알람이 발송될것인지 선언 

1. **UNCalenderNotificationTrigger**
	
	 달력, 날짜 기준  
	 
1. **UNTimeIntervalNotificationTrigger**
	
	  시간 간격 기준
	  
1. **UNLocationNotificationTrigger**
	
	 사용자 위치 기준 

#### NotificationCenter 
![Group 1](https://user-images.githubusercontent.com/51107183/149070594-8010637a-87dc-436c-83d4-dcf1e75e3b88.png)

