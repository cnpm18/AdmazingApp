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
        
        
        print(soapMessage)
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
        theRequest.HTTPBody = soapMessage.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false) // or false
        let connection = NSURLConnection(request: theRequest, delegate: self, startImmediately: true)
        
        connection!.start()
        
        if (connection == true) {
            var mutableData : Void = NSMutableData.initialize()
        }
        
        
    }
    
    
  
    func substractOptional (variable: String) -> String{
        var x = variable
        x = x.stringByReplacingOccurrencesOfString("Optional(\"", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        x = x.stringByReplacingOccurrencesOfString("\")", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        return x

    }
    
    
    
    func connection(connection: NSURLConnection!, didReceiveResponse response: NSURLResponse!) {
        mutableData.length = 0;
    }
    
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!) {
        mutableData.appendData(data)
    }
    
    
    func connectionDidFinishLoading(connection: NSURLConnection!) {
        
        
        
        let response = NSString(data: mutableData, encoding: NSUTF8StringEncoding)
        
        let xmlParser = NSXMLParser(data: mutableData)
        xmlParser.delegate = self
        xmlParser.parse()
        xmlParser.shouldResolveExternalEntities = true
         
    }
    
    
    
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        currentElementName = elementName
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String) {
            }
}
