//
//  serverConnection.swift
//  AdmazingApp
//
//  Created by Cristopher Nunez Del Prado on 28/06/16.
//  Copyright © 2016 Cristopher Nunez Del Prado. All rights reserved.
//

import Foundation

class serverConnection: NSObject, NSURLConnectionDelegate, NSXMLParserDelegate {
    
    var mutableData:NSMutableData  = NSMutableData()
    var currentElementName:NSString = ""
    
    
    
    
    func setMessage(body: String)->String{
        
        let soapMessage = "<?xml version='1.0' encoding='utf-8'?><soapenv:Envelope xmlns:soapenv='http://schemas.xmlsoap.org/soap/envelope/' xmlns:adm='http://admazing.com/'><soapenv:Header/><soapenv:Body>\(body)</soapenv:Body></soapenv:Envelope>"
        
        return soapMessage
        
    }
    
    
    
    func createConnection(body: String)
    {
       
        let soapMessage =  setMessage(body)
        
        let urlString = "http://webws-adsws.rhcloud.com/services/admazing?wsdl"
        let url = NSURL(string: urlString)
        
        let theRequest = NSMutableURLRequest(URL: url!)
        
        let msgLength = soapMessage.characters.count
        
        theRequest.addValue("text/xml; charset=utf-8", forHTTPHeaderField: "Content-Type")
        theRequest.addValue(String(msgLength), forHTTPHeaderField: "Content-Length")
        theRequest.HTTPMethod = "POST"
        theRequest.HTTPBody = soapMessage.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)
        let response: AutoreleasingUnsafeMutablePointer<NSURLResponse?>=nil
        do{
            
            let data = try NSURLConnection.sendSynchronousRequest(theRequest, returningResponse: response)
            
            let encodedData = NSString(data: data, encoding: NSUTF8StringEncoding)
            let xmlParser = NSXMLParser(data: data)
            xmlParser.delegate = self
            xmlParser.parse()
            xmlParser.shouldResolveExternalEntities = true
 
            
        }catch let error as NSError
        {
            print(error.localizedDescription)
        }
        
        
    }
    
    
  
    func substractOptional (variable: String) -> String{
        var x = variable
        x = x.stringByReplacingOccurrencesOfString("Optional(\"", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        x = x.stringByReplacingOccurrencesOfString("\")", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        return x

    }
    
    
    
    
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        currentElementName = elementName
            }
    
    func parser(parser: NSXMLParser, foundCharacters string: String) {
            }
}
