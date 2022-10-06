# BUILD APK

Reference: [Link](https://docs.flutter.dev/deployment/android)

- Enabling Material Components

  | Path: `<my-app>/android/app/build.gradle`

  ```gradle
  dependencies {
      // ...
      implementation 'com.google.android.material:material:<version>'
      // ...
  }
  ```

  Check material version: [Link](https://maven.google.com/web/index.html#com.google.android.material:material)

  Reference: [Link](https://docs.flutter.dev/deployment/android#enabling-material-components)

- Create an upload `keystore`

  The Android `Keystore` system lets you store cryptographic keys in a container to make it more difficult to extract from the device.

  ```shell
  keytool -genkey -v -keystore %userprofile%\upload-keystore.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias upload
  ```

  | Modify `%userprofile%\upload-keystore.jks` where you when to save keystore file and modify the `alias`

  Reference: [Link](https://docs.flutter.dev/deployment/android#create-an-upload-keystore)

- Reference the keystore from the app

  | path: `[project]/android/key.properties`

  ```properties
  storePassword=<password from previous step>
  keyPassword=<password from previous step>
  keyAlias=upload
  storeFile=<location of the key store file, such as /Users/<user name>/upload-keystore.jks>
  ```

  Desc:

  - storePassword: Set your keystore password
  - keyPassword: Set your keystore password
  - keyAlias: set your keystore alias
  - storeFile: set your keysore file path

  Reference: [Link](https://docs.flutter.dev/deployment/android#reference-the-keystore-from-the-app)

- Configure signing in gradle

  | path: `[project]/android/app/build.gradle`

  - Add the keystore information from your properties file before the android block:

    ```gradle
    def keystoreProperties = new Properties()
    def keystorePropertiesFile = rootProject.file('key.properties')
    if (keystorePropertiesFile.exists()) {
        keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
    }

    android {
            ...
    }
    ```

  - Find the buildTypes block:

    ```gradle
    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now,
            // so `flutter run --release` works.
            signingConfig signingConfigs.debug
        }
    }
    ```

    And replace it with the following signing configuration info:

    ```gradle
    signingConfigs {
        release {
            keyAlias keystoreProperties['keyAlias']
            keyPassword keystoreProperties['keyPassword']
            storeFile keystoreProperties['storeFile'] ? file(keystoreProperties['storeFile']) : null
            storePassword keystoreProperties['storePassword']
        }
    }
    buildTypes {
        release {
            signingConfig signingConfigs.release
        }
    }
    ```

    Reference: [Link](https://docs.flutter.dev/deployment/android#configure-signing-in-gradle)

- Building the app for release

  Run this command:

  ```shell
  flutter build appbundle
  ```

  Reference: [Link](https://docs.flutter.dev/deployment/android#build-an-apk)
