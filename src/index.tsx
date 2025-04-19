import { NitroModules } from 'react-native-nitro-modules';
import type { SalesforceMessagingNitro } from './SalesforceMessagingNitro.nitro';

const SalesforceMessagingNitroHybridObject =
  NitroModules.createHybridObject<SalesforceMessagingNitro>('SalesforceMessagingNitro');

export function multiply(a: number, b: number): number {
  return SalesforceMessagingNitroHybridObject.multiply(a, b);
}
