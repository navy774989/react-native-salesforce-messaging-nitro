# React Native Salesforce Messaging Nitro

A React Native module for integrating Salesforce Messaging (In-App) into your React Native applications, built with the new React Native architecture (Fabric).

> **Note**: This is the new architecture version of [react-native-salesforce-messaging](https://github.com/navy774989/react-native-salesforce-messaging). If you're using the old React Native architecture, please use the original package instead.

## Features

- Configure Salesforce Messaging service
- Set pre-chat data
- Open chat interface
- Support for both iOS and Android
- Built with React Native's new architecture (Fabric)
- TypeScript support

## Installation

```sh
# Using npm
npm install react-native-salesforce-messaging-nitro

# OR using Yarn
yarn add react-native-salesforce-messaging-nitro
```

### iOS Installation

For iOS, the installation is handled automatically by React Native's auto-linking. Just run:

```sh
cd ios && pod install
```

### Android Installation

1. Add the following to your `android/build.gradle`:

```gradle
allprojects {
    repositories {
        google()
        mavenCentral()
        maven {
            url "https://s3.amazonaws.com/inapp.salesforce.com/public/android"
        }
    }
}
```

2. Add the following to your `android/app/build.gradle`:

```gradle
dependencies {
    implementation "com.salesforce.service:messaging-inapp-ui:1.8.0"
}
```

## Usage

```typescript
import { SalesforceMessaging } from 'react-native-salesforce-messaging-nitro';

// Configure the messaging service
SalesforceMessaging.configureMessagingService(
  'your-service-api-url',
  'your-organization-id',
  'your-developer-name'
);

// Set pre-chat data
SalesforceMessaging.setPreChatData({
  name: 'John Doe',
  email: 'john@example.com',
  // Add other pre-chat fields as needed
});

// Open the chat interface
SalesforceMessaging.openChatPage();
```

## API Reference

### `configureMessagingService(serviceAPIUrl, organizationId, developerName)`

Configures the Salesforce Messaging service.

| Parameter      | Type   | Description                                  |
| -------------- | ------ | -------------------------------------------- |
| serviceAPIUrl  | string | The URL of your Salesforce Messaging service |
| organizationId | string | Your Salesforce organization ID              |
| developerName  | string | The developer name for your deployment       |

### `setPreChatData(data)`

Sets pre-chat data for the conversation.

| Parameter | Type   | Description                                |
| --------- | ------ | ------------------------------------------ |
| data      | object | An object containing pre-chat field values |

### `openChatPage()`

Opens the chat interface.

## Example

```typescript
import React from 'react';
import { Button, View } from 'react-native';
import { SalesforceMessaging } from 'react-native-salesforce-messaging-nitro';

const App = () => {
  const startChat = () => {
    try {
      // Configure the service
      SalesforceMessaging.configureMessagingService(
        'https://messaging-service-dev-ed.develop.lightning.force.com/services/apexrest/MessagingService/',
        '00D000000000000',
        'MessagingService'
      );

      // Set pre-chat data
      SalesforceMessaging.setPreChatData({
        name: 'John Doe',
        email: 'john.doe@example.com',
        phone: '1234567890',
      });

      // Open chat
      SalesforceMessaging.openChatPage();
    } catch (error) {
      console.error('Error starting chat:', error);
    }
  };

  return (
    <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
      <Button title="Start Chat" onPress={startChat} />
    </View>
  );
};

export default App;
```

## Requirements

- React Native >= 0.70.0 (new architecture)
- iOS >= 12.0
- Android API Level >= 24

## Differences from Original Package

This package is specifically built for React Native's new architecture (Fabric), while the [original package](https://github.com/navy774989/react-native-salesforce-messaging) supports the old architecture. Key differences include:

- Uses the new TurboModule system
- Better TypeScript support
- Improved performance with the new architecture
- Requires React Native 0.70.0 or higher

## License

MIT

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

---

Made with [create-react-native-library](https://github.com/callstack/react-native-builder-bob)
