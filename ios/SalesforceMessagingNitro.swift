import SMIClientUI
import SMIClientCore
class SalesforceMessagingNitro: HybridSalesforceMessagingNitroSpec {
  func setPreChatData(data: Dictionary<String, String>) throws {
    preChatData = data
  }

  var preChatData : Dictionary<String, String> = [:]
  var config : UIConfiguration?
  func openChatPage() throws {
    guard let config else {
      return
    }
  
    DispatchQueue.main.async {
      let chatVC = ModalInterfaceViewController(config)
      chatVC.modalPresentationStyle = .popover
      if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
         let window = windowScene.windows.first,
         let rootViewController = window.rootViewController {
        rootViewController.present(chatVC, animated: true, completion: nil)
      } else {
        NSLog("Failed to find top view controller to present SFSafariViewController")
      }
    }
  }
  
  

  func configureMessagingService(serviceAPIUrl: String?, organizationId: String, developerName: String) throws -> String? {
    guard let serviceURL = URL(string: serviceAPIUrl ?? "") else {
      return nil
    }
    let conversationID = UUID()
    config = UIConfiguration(serviceAPI: serviceURL,
                             organizationId: organizationId,
                             developerName: developerName,
                             conversationId: conversationID)
    return conversationID.uuidString
  }
  

}

extension SalesforceMessagingNitro : HiddenPreChatDelegate {
  func core(_ core: any CoreClient, conversation: any Conversation, didRequestPrechatValues hiddenPreChatFields: [any HiddenPreChatField], completionHandler: @escaping HiddenPreChatValueCompletion) {
    for preChatField in hiddenPreChatFields {
      let value: String! = preChatData[preChatField.label]
      preChatField.value = value
    }
    completionHandler(hiddenPreChatFields)
  }
  
}
