---
title: HSBC.php
date: 2006-12-22T15:42:00.000+05:30
draft: false
tags : [hsbc, code, php]
---

```
<?php
  /**
  * @desc Class to process payment using HSBC gateway
  * This class will return orderhash
  * 18-Dec-2006
  */
 
  class HSBC{
     
      var $storeFrontId;
      var $hashFilePath;
      var $CPIhash;
      var $orderHash;
     
      /**
      * @desc initialize configuration arguements.
      * @var $storeFrontId String Exactly 13 digit char given by HSBC Bank. eg. UK12345678GBP
      * @var $hashFilePath String File Path in which you have placed the TestHash.e or TestHash.exe
      * @var $CPIhash   String Exactly 32 char length sent by HSBC Bank.
      */
      function config($storeFrontId, $hashFilePath, $CPIhash)
      {
         $this->storeFrontId = $storeFrontId;
         $this->hashFilePath = $hashFilePath;
         $this->CPIhash = $CPIhash;
      }
      /**
      * @desc  It will return the orderHash for the post if all the arguments sent are in valid format. Else will return false
      */
      function getOrderHash($args)
      {
          if($this->validate($args)==false)
          {
              return false;
          }
          else
          {
                $cmd = "";
                while( list( $k, $v ) = each( $args ) )
                {
                    $cmd .= " \"$v\" ";
                }
               
                $cmd = $this->hashFilePath." \"".$this->CPIhash."\" $cmd";
                //debug
                //echo $cmd;
                $ret = exec($cmd);
                $ret = split(':',$ret); //will return like 'Hash value:  ebdDNSF6xSJJCFjgtsfJU+ebt24='         
                $hash = trim($ret[1]);
               
 
                if(strlen($hash) != 28) //always return string of 28 chars
                {
                    return false;
                }
                else
                {
                    $this->orderHash = $hash;
                    return $this->orderHash;
                }   
          }
         
      }
     
     
      /**
      * @desc Function that return true if required arguments are present in the associate array. else will return false
      * @var $args Array Associate array
      */
      function validate($args)
      {
          $req = array(
                      'CpiDirectResultUrl',
                      'CpiReturnUrl',
                      'Mode',
                      'OrderDesc',
                      'OrderId',
                      'PurchaseAmount',
                      'PurchaseCurrency',
                      'StorefrontId',
                      'TimeStamp',
                      'TransactionType',
                        );
         $isValid = true;       
         foreach($req as $arg)
         {
             if(array_key_exists($arg,$args)!=true)
             {
                 $isValid = false;
             }
         }
         return $isValid;
      }
     
      /**
      * @desc Function will echo the error messages relavant to the result code returned from HSBC
      * @var $errCode Integer between 0-16.
      */
      function error($errCode)
      {
          $errors = array(
                            'The transaction was approved.',   
                            'The user cancelled the transaction.',   
                            'The processor declined the transaction for an unknown reason.',   
                            'The transaction was declined because of a problem with the card.For example,an invalid card number or expiration date was specified.',   
                            'The processor did not return a response.',   
                            'The amount specified in the transaction was either too high or too lowfor the processor.',   
                            'The specified currency is not supported by either the processor or the card.',   
                            'The order is invalid because the order ID is a duplicate.',   
                            'The transaction was rejected by FraudShield.',   
                            'The transaction was placed in Review state by FraudShield. When a transaction is placed in Review state by FraudShield, it can be authorised, but it cannot be settled until it is reviewed by you (or one of your staff) and either accepted or rejected. For more information on reviewing transactions, refer to the Secure ePayments Card Processing Virtual Terminal Guide.',   
                            'The transaction failed because of invalid input data.',   
                            'The transaction failed because the CPI was configured incorrectly.',                             'The transaction failed because the Storefront was configured incorrectly.',   
                            'The connection timed out.',   
                            'The transaction failed because the cardholder’s browser refused a cookie.',   
                            'The customer’s browser does not support 128-bit encryption.',
                            'The CPI cannot communicate with the Payment Engine.'   
 
                         );
          return $errors[$errCode];
      }
     
  }
 
 
  /* 
    //Merchant Specific data
    $storeFrontId = 'UK12345678GBP';
    $CPIhash ='MORYvylyIrVmRizY89OVNzPwd5VEINdy';
    $hashFilePath = 'C:/HSBC/TestHash.exe';
   
    //Sample data
    $args = array(
                    "CpiDirectResultUrl" => 'https://localhost/HSBC/hsbc_return.php',
                    "CpiReturnUrl" => 'https://localhost/HSBC/hsbc_return.php',
                    "MerchantData" => 'f5b8b178c5541d2c789d0606888aaa66',
                    "Mode" => 'T',
                    "OrderDesc" => 'MyStore order',
                    "OrderId" => '27',
                    "PurchaseAmount" => '7405',
                    "PurchaseCurrency" => '826',
                    "StorefrontId" => $storeFrontId,
                    "TimeStamp" => '1166437083000',
                    "TransactionType" => 'Auth',
                    "BillingAddress1" => 'st address',
                    "BillingCity" => 'city',
                    "BillingCountry" => '356',
                    "BillingCounty" => 'state',
                    "BillingFirstName" => 'Palani',
                    "BillingLastName" => 'raja',
                    "BillingPostal" => '134003',
                    "ShopperEmail" => 'YOUREMAILID@gmail.com',
                    "ShippingAddress1" => 'st address',
                    "ShippingCity" => 'city',
                    "ShippingCountry" => '356',
                    "ShippingCounty" => 'state',
                    "ShippingFirstName" => 'Palani',
                    "ShippingLastName" => 'raja',
                    "ShippingPostal" => '134003' 
                    );
                             */
    /*
    Note:
        MerchantData - session Id,
        OrderId - random no
        Amount - 74.05
        PurchaseCurrency - GBP
        BillingCountry,ShippingCountry - India
        in the above data
    */
 
    // How to
   /* $h1 = new HSBC();
    $h1->config($storeFrontId, $hashFilePath, $CPIhash);
    $res = $h1->getOrderHash($args);
    if($res)
    {
        echo "OrderHash: ".$res;
    }
    printPre($res,1);
    */
   
   
   
?>
```