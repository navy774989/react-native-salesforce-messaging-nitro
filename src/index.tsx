import { NitroModules } from 'react-native-nitro-modules';
import type { SalesforceMessagingNitro } from './SalesforceMessagingNitro.nitro';

const SalesforceMessagingNitroHybridObject =
  NitroModules.createHybridObject<SalesforceMessagingNitro>(
    'SalesforceMessagingNitro'
  );

export function configureMessagingService(
  serviceAPIUrl: string | undefined,
  organizationId: string,
  developerName: string
): string | undefined {
  return SalesforceMessagingNitroHybridObject.configureMessagingService(
    serviceAPIUrl,
    organizationId,
    developerName
  );
}

export function openChatPage() {
  return SalesforceMessagingNitroHybridObject.openChatPage();
}

export function setPreChatData(data: Record<string, string>): void {
  return SalesforceMessagingNitroHybridObject.setPreChatData(data);
}
