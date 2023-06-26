//
//  ScannerView.swift
//  VisionsAppTest
//
//  Created by Tyler Sun on 6/26/23.
//

import Foundation
import VisionKit
import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
  func makeCoordinator() -> Coordinator {
    return Coordinator(completion: completionHandler)
  }
    
  final class Coordinator: NSObject, VNDocumentCameraViewControllerDelegate {
    private let completionHandler: ([String]?) -> Void
    init(completion: @escaping ([String]?) -> Void) {
      self.completionHandler = completion
    }
      
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
        var scannedPages = [UIImage]()
        
        for i in 0..<scan.pageCount {
            scannedPages.append(scan.imageOfPage(at: i))
        }
    }
      
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
      completionHandler(nil)
    }
      
    func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
      completionHandler(nil)
    }
  }
    
  func makeUIViewController(context: Context) -> VNDocumentCameraViewController {
    let viewController = VNDocumentCameraViewController()
    viewController.delegate = context.coordinator
    return viewController
  }
    
  func updateUIViewController(_ uiViewController: VNDocumentCameraViewController, context: Context) {
  }
    
  typealias UIViewControllerType = VNDocumentCameraViewController
  private let completionHandler: ([String]?) -> Void
  init(completion: @escaping ([String]?) -> Void) {
    self.completionHandler = completion
  }
}
