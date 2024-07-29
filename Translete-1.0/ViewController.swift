//
//  ViewController.swift
//  Translete-1.0
//
//  Created by Sabri Çetin on 25.07.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var translateButton: UIButton!
    
    
    override func viewDidLoad() {
          super.viewDidLoad()
          
          setupUI()
      }
      
      func setupUI() {
          // TextField setup
          textField.borderStyle = .roundedRect
          textField.placeholder = "Enter text to translate"
          textField.frame = CGRect(x: 20, y: 100, width: self.view.frame.width - 40, height: 40)
          view.addSubview(textField)
          
          // Button setup
          translateButton.setTitle("Translate", for: .normal)
          translateButton.backgroundColor = .systemBlue
          translateButton.layer.cornerRadius = 5
          translateButton.frame = CGRect(x: (self.view.frame.width - 100) / 2, y: 160, width: 100, height: 50)
          translateButton.addTarget(self, action: #selector(translateButtonTapped), for: .touchUpInside)
          view.addSubview(translateButton)
          
          // Label setup
          resultLabel.textAlignment = .center
          resultLabel.numberOfLines = 0
          resultLabel.frame = CGRect(x: 20, y: 230, width: self.view.frame.width - 40, height: 100)
          view.addSubview(resultLabel)
      }
      
      @objc func translateButtonTapped() {
          guard let textToTranslate = textField.text, !textToTranslate.isEmpty else { return }
          translate(text: textToTranslate)
      }
      
      func translate(text: String) {
          let headers = [
              "x-rapidapi-key": "2b377c5311msh5167a0b402e0210p127dabjsn69aae958db97",
              "x-rapidapi-host": "google-translate113.p.rapidapi.com",
              "Content-Type": "application/json"
          ]

          let parameters: [String: Any] = [
              "from": "auto",
              "to": "tr",
              "json": [
                  "text": text
              ]
          ]
          
          guard let postData = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
              print("Error serializing JSON")
              return
          }

          let url = URL(string: "https://google-translate113.p.rapidapi.com/api/v1/translator/json")!
          var request = URLRequest(url: url)
          request.httpMethod = "POST"
          request.allHTTPHeaderFields = headers
          request.httpBody = postData

          let session = URLSession.shared
          let dataTask = session.dataTask(with: request) { [weak self] (data, response, error) in
              if let error = error {
                  print("Error: \(error)")
                  return
              }
              
              guard let data = data else {
                  print("No data received")
                  return
              }
              
              do {
                  if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                     let trans = json["trans"] as? [String: Any],
                     let translatedText = trans["text"] as? String {
                      DispatchQueue.main.async {
                          self?.resultLabel.text = translatedText
                      }
                  } else {
                      print("Unexpected JSON format: \(String(describing: String(data: data, encoding: .utf8)))")
                  }
              } catch {
                  print("JSON parsing error: \(error)")
              }
          }

          dataTask.resume()
      }
  }
