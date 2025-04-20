import type { HybridObject } from 'react-native-nitro-modules';

export interface SalesforceMessagingNitro
  extends HybridObject<{ ios: 'swift'; android: 'kotlin' }> {
  configureMessagingService(
    serviceAPIUrl: string | undefined,
    organizationId: string,
    developerName: string
  ): string | undefined;
  openChatPage(): void;
  setPreChatData(data: Record<string, string>): void;
}
