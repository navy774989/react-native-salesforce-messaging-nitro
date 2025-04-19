package com.margelo.nitro.salesforcemessagingnitro
  
import com.facebook.proguard.annotations.DoNotStrip

@DoNotStrip
class SalesforceMessagingNitro : HybridSalesforceMessagingNitroSpec() {
  override fun multiply(a: Double, b: Double): Double {
    return a * b
  }
}
