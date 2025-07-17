# Google Maps API 키 설정 가이드

## 1. Google Maps API 키 생성

1. [Google Cloud Console](https://console.cloud.google.com/)에 접속
2. 새 프로젝트 생성 또는 기존 프로젝트 선택
3. "API 및 서비스" > "라이브러리"로 이동
4. "Maps SDK for Android" 및 "Maps SDK for iOS" 활성화
5. "API 및 서비스" > "사용자 인증 정보"로 이동
6. "사용자 인증 정보 만들기" > "API 키" 선택
7. 생성된 API 키 복사

## 2. API 키 설정

### Android 설정
`android/app/src/main/AndroidManifest.xml` 파일에서:
```xml
<meta-data
    android:name="com.google.android.geo.API_KEY"
    android:value="YOUR_ACTUAL_API_KEY_HERE" />
```

### iOS 설정
`ios/Runner/AppDelegate.swift` 파일에 추가:
```swift
import GoogleMaps

@main
class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GMSServices.provideAPIKey("YOUR_ACTUAL_API_KEY_HERE")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
```

## 3. 사용된 기능들

### 위치 기반 지도 앱의 주요 기능:
1. **위치 권한 요청**: 사용자의 현재 위치 접근 권한 요청
2. **GPS 위치 가져오기**: Geolocator 패키지를 사용하여 정확한 위치 정보 획득
3. **Google Maps 표시**: 현재 위치를 중심으로 지도 표시
4. **마커 표시**: 현재 위치에 마커 표시
5. **내 위치 버튼**: 플로팅 액션 버튼으로 현재 위치로 카메라 이동

### 사용된 패키지:
- **google_maps_flutter**: Google Maps 위젯 제공
- **geolocator**: GPS 위치 정보 획득
- **permission_handler**: 런타임 권한 관리

## 4. 실행 방법

1. API 키 설정 완료 후
2. `flutter pub get` 실행 (이미 완료됨)
3. `flutter run` 실행

## 5. 문제 해결

- **위치 권한 거부**: 앱에서 직접 권한 요청하며, 설정으로 안내
- **API 키 오류**: 올바른 API 키 설정 및 서비스 활성화 확인
- **지도 표시 안됨**: 인터넷 연결 및 API 할당량 확인

## 6. 추가 기능 개발 가능

- 주변 장소 검색
- 경로 찾기
- 다중 마커 표시
- 사용자 정의 지도 스타일
- 오프라인 지도 지원
