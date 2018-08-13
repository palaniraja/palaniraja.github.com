---
title: 'Developing iOS application for salesforce [How to]'
date: 2012-01-06T22:35:00.000-08:00
draft: false
tags : [force.com, iPad, info, solution, salesforce, how to, open source, iOS, sdk, Tutorials, quick reference., Obj-C, GitHub, development, iPhone, software engineering, Tips]
categories: [projects, source code]
---

  
Here are the collection of snippets to do CRUD operation with ZKSforce (Force.com toolkit for iOS).  
  
Remember this is a SOAP based API, there is a new alternative library available from salesforce called MobileSDK for iOS.  

  

#### Create new record/ add new obj in Salesforce
```
    
    ZKSObject *sfobj = [[ZKSObject alloc] initWithType:@"Your_custom_object__c"] ;    
    
    [sfobj setType:@"Your_custom_object__c"];
    [sfobj setFieldValue:@"Air Conditioning System" field:@"Name"];
    [sfobj setFieldValue:@"PAL-008" field:@"Service_code__c"];
    [sfobj setFieldValue:@"Spot" field:@"Service_Status__c"];
    [sfobj setFieldValue:@"a07M0000000FV5VIAW" field:@"child_of_another_custom_object__c"];
    
   
    [[FDCServerSwitchboard switchboard] create:[NSArray arrayWithObject:sfobj] target:self selector:@selector(createObjectResult:error:context:) context:nil];


/*
called when SF completed the request
*/

- (void)createObjectResult:(NSArray *)results error:(NSError *)error context:(id)context{
    if (results && !error)
    {
        for (ZKSaveResult *saveResult in results){
            NSLog(@"saveResult: %@", saveResult);    
        }
        
    }
    else {
         NSLog(@"Error : %@", [error description])//take care of error
    }
}
```
{{< mygist url="https://gist.github.com/palaniraja/1510080#file-createobj-m" >}}

  
#### To update SF object

```
    ZKSObject *sfobj = [[ZKSObject alloc] initWithType:@"Your_custom_object__c"] ;    
    
    [sfobj setType:@"Your_custom_object__c"];
    [sfobj setFieldValue:@"a0FM0000000XrKcMAK" field:@"Id"];
    [sfobj setFieldValue:@"PAL-008" field:@"Service_code__c"]; 
    [sfobj setFieldValue:@"Room heating system" field:@"Name"];   //update the field value required
    [sfobj setFieldValue:@"Maintenance" field:@"Service_Status__c"];
    [sfobj setFieldValue:@"a07M0000000FV5VIAW" field:@"child_of_another_custom_object__c"];
    
     [[FDCServerSwitchboard switchboard] update:[NSArray arrayWithObject:sfobj] target:self selector:@selector(updatedObjectResult:error:context:) context:nil];
```
{{< mygist url="https://gist.github.com/palaniraja/1510096#file-updateobj-m" >}}


#### Delete or Undelete object

```
    NSString *id2Del = @"a0BM0000001uUrY";
    
    [[FDCServerSwitchboard switchboard] delete:[NSArray arrayWithObject:id2Del] target:self selector:@selector(deleteObjectResult:error:context:) context:nil];

//To undelete the deleted obj. only if available as per Salesforce norms

    [[FDCServerSwitchboard switchboard] unDelete:[NSArray arrayWithObject:id2Del] target:self selector:@selector(deleteObjectResult:error:context:) context:nil];
```
{{< mygist url="https://gist.github.com/palaniraja/1510105#file-deleteobj-m" >}}


#### Fetching objects/records from Salesforce

```
    NSString *getCasesSQL = [NSString stringWithFormat:@"SELECT id, Site__r.Name FROM Case WHERE id = '%@'", @"a0FM0000000XrKcMAK"];
    
    
    [[FDCServerSwitchboard switchboard] getCasesSQL target:self selector:@selector(getCasesSiteInfoResult:error:context:) context:nil];


/*asynchronously called when the objects are fetched from Salesforce*/

- (void)getCasesSiteInfoResult:(ZKQueryResult *)result error:(NSError *)error context:(id)context{
    
    
    if (result && !error){
        NSMutableArray *records = [NSMutableArray arrayWithArray:[result records]];
    //records are of type ZKSObject 
    }
    else if (error){
        NSLog(@"Error: %@", [error description]);
    }

}
```
{{< mygist url="https://gist.github.com/palaniraja/1510135#file-getobjects-m" >}}

#### Attachment (adding binary objects to SF attachment)

  
```
    ZKSObject *attachment = [ZKSObject withType:@"Attachment"];
    [attachment setFieldValue:[NSString stringWithFormat:@"Nameofyourattachment%@.png", [NSDate date]] field:@"Name"];
    [attachment setFieldValue:@"a07M0000000FV5VIAW" field:@"ParentId"];
    
    NSData *cSign = UIImagePNGRepresentation([UIImage imageNamed:@"signature.png"]);
    
    [attachment setFieldValue:[cSign base64EncodedString] field:@"Body"];
    
    [[FDCServerSwitchboard switchboard] create:[NSArray arrayWithObject:attachment] target:self selector:@selector(saveAttachmentToSFResult:error:context:) context:attachment];


/*Call back from SF when done*/


- (void)saveSignatureToSFResult:(NSArray *)results error:(NSError *)error context:(id)attachment
{

    if (results && !error){
        NSString* attachmentId = [[results objectAtIndex:0] id]; 
        NSLog(@"Attachment ObjId: %@ saved to Salesforce", attachmentId);
    }
    else if (error){
         NSLog(@"Attachment %@", [error description]);
    }
}

```
{{< mygist url="https://gist.github.com/palaniraja/1510154#file-attachment-m" >}} 


  

### References

*   Github - [Force.com toolkit for iOS](https://github.com/palaniraja/Force.com-Toolkit-for-iOS) (deferred now)
*   Slidehsare - [Beyond Force.com toolkit for iOS (Dreamforce 2011)](http://www.slideshare.net/matthewbotos/beyond-the-forcecom-toolkit-for-ios-dreamforce-2011)
*   Github - Shiny new [Force.com MobileSDK for iOS](https://github.com/forcedotcom/SalesforceMobileSDK-iOS)
*   DeveloperForce wiki - [Getting started with MobileSDK](http://wiki.developerforce.com/page/Getting_Started_with_the_Mobile_SDK_for_iOS)