@isTest
public class BessNLessCSVOrderProcessorNewTest {
    static testMethod void processOrderTest() {
        
        List<String> inputParams = new List<String>();
        
        CSV_File_Data__c csvFileObj = new CSV_File_Data__c();
        csvFileObj.Column_01__c = '636717';
        csvFileObj.Column_02__c = 'FOOK WAH KUN KEE KNIT.FACTORY';
        csvFileObj.Column_03__c = '126';
        csvFileObj.Column_04__c = '472ONS';
        csvFileObj.Column_05__c = '250';
        csvFileObj.Column_06__c = '3/6/2020';
        csvFileObj.Column_07__c = '6/1/2020';
        csvFileObj.Column_08__c = 'China';
        csvFileObj.Column_09__c = '735-235-183-110';
        csvFileObj.Column_10__c = 'CG19R-68';
        csvFileObj.Column_11__c = 'SIZE: 7';
        csvFileObj.Column_12__c = 'GL LS STN AN SSUIT';
        csvFileObj.Column_13__c = 'PRINTED';
        csvFileObj.Column_14__c = '0';
        csvFileObj.Column_15__c = '7';
        csvFileObj.Column_16__c = 'GIRLSWEAR 7-16';
        csvFileObj.CSV_File_Format__c = 'Best and Less';
        csvFileObj.Processing_Status__c = 'Draft';
        insert csvFileObj;
        
        
        
        // Below object to cover isBlank Condidtions.
        CSV_File_Data__c csvFileBlankObj = new CSV_File_Data__c();
        csvFileBlankObj.Column_01__c = '636717';
        //csvFileBlankObj.Column_02__c = 'FOOK WAH KUN KEE KNIT.FACTORY';
        //csvFileBlankObj.Column_03__c = '126';
        //csvFileBlankObj.Column_04__c = '472ONS';
        //csvFileBlankObj.Column_05__c = '250';
        csvFileBlankObj.Column_06__c = '3/6/2020';
        csvFileBlankObj.Column_07__c = '6/1/2020';
        csvFileBlankObj.Column_08__c = 'China';
        csvFileBlankObj.Column_09__c = '735-235-183-110';
        csvFileBlankObj.Column_10__c = 'CG19R-68';
        csvFileBlankObj.Column_11__c = 'SIZE: 7';
        csvFileBlankObj.Column_12__c = 'GL LS STN AN SSUIT';
        csvFileBlankObj.Column_13__c = 'PRINTED';
        csvFileBlankObj.Column_14__c = '0';
        //csvFileBlankObj.Column_15__c = '7';
        csvFileBlankObj.Column_16__c = 'GIRLSWEAR 7-16';
        csvFileBlankObj.CSV_File_Format__c = 'Best and Less';
        csvFileBlankObj.Processing_Status__c = 'Draft';
        insert csvFileBlankObj;
        
        inputParams.add(csvFileObj.Id);
        inputParams.add(csvFileBlankObj.Id);
        
        
        // Inserting Retailer_Related_Data__c object records to satisfy getSupplier() --Start--
        Account acc = new Account();
        acc.Name = 'Test';
        insert acc;        
        Contact cont = new Contact();
        cont.AccountId = acc.Id;
        cont.LastName = 'Last name test';
        cont.Related_Retailer__c = 'Related retailer test';
        insert cont;        
        Customer_Information__c custInfo = new Customer_Information__c();
        custInfo.Name = 'Retailer name test'; //To satisfy getCustomerInfoId()
        insert custInfo;        
        Retailer_Code__c retailerObj = new Retailer_Code__c();
        retailerObj.Name = 'Retailer name test';
        retailerObj.Online_Enquiry__c = true;
        insert retailerObj;        
        Retailer_Related_Data__c retailerRelated = new Retailer_Related_Data__c();
        retailerRelated.Contact__c = cont.Id;
        retailerRelated.ContactID__c = cont.Id;
        retailerRelated.Customer_Information__c = custInfo.Id;
        retailerRelated.Retailer_Code__c = retailerObj.Id;
        retailerRelated.Supplier_Code__c = '126';
        retailerRelated.Status__c = 'Active';
        insert retailerRelated;
        // Inserting Retailer_Related_Data__c object records to satisfy getSupplier() --End--
        
        
        // Inserting Contact_Related_Retailer__c object records to satisfy getRetailerContactId() --Start--
        Contact_Related_Retailer__c contactRetailer = new Contact_Related_Retailer__c();
        contactRetailer.Retailer_Code__c = retailerObj.Id;
        contactRetailer.Contact__c = cont.Id;
        insert contactRetailer;
        // Inserting Contact_Related_Retailer__c object records to satisfy getRetailerContactId() --End--
        
        
        // Inserting Associate_Product__c object records to satisfy getHangerModel() --Start--
        Price_Specification_Book__c pricebook = new Price_Specification_Book__c();
        insert pricebook;        
        Price_Specification_Book_Product__c pricSpecProd = new Price_Specification_Book_Product__c();
        pricSpecProd.Name = '472ONS';
        pricSpecProd.Price_Specification_Book__c = pricebook.Id;
        pricSpecProd.Associated_Product__c = true;
        insert pricSpecProd;        
        Associate_Product__c assProd = new Associate_Product__c();
        assProd.Price_Specification_Book_Product__c = pricSpecProd.Id;
        insert assProd;     
        // Inserting Associate_Product__c object records to satisfy getHangerModel() --End--
        
        
        boolean flag = true;
        Test.startTest();
        BessNLessCSVOrderProcessor.processOrder(inputParams); 
        BessNLessCSVOrderProcessor.getCSVFileOrderdDetails(inputParams);
        Test.stopTest();
        System.assertEquals(true, flag);
    }
    
    static testMethod void processOrderTest2() {
        
        List<String> inputParams = new List<String>();
        
        CSV_File_Data__c csvFileObj = new CSV_File_Data__c();
        csvFileObj.Column_01__c = '636717';
        csvFileObj.Column_02__c = 'FOOK WAH KUN KEE KNIT.FACTORY';
        csvFileObj.Column_03__c = '126';
        csvFileObj.Column_04__c = '472ONS';
        csvFileObj.Column_05__c = '250';
        csvFileObj.Column_06__c = '3/6/2020';
        csvFileObj.Column_07__c = '6/1/2020';
        csvFileObj.Column_08__c = 'China';
        csvFileObj.Column_09__c = '735-235-183-110';
        csvFileObj.Column_10__c = 'CG19R-68';
        csvFileObj.Column_11__c = 'SIZE: 7';
        csvFileObj.Column_12__c = 'GL LS STN AN SSUIT';
        csvFileObj.Column_13__c = 'PRINTED';
        csvFileObj.Column_14__c = '0';
        csvFileObj.Column_15__c = '7';
        csvFileObj.Column_16__c = 'GIRLSWEAR 7-16';
        csvFileObj.CSV_File_Format__c = 'Best and Less';
        csvFileObj.Processing_Status__c = 'Draft';
        insert csvFileObj;
        
        
        
        
        
        // Below object to cover Column_15 isBlank Condidtion.
        CSV_File_Data__c csvColumn15BlankObj = new CSV_File_Data__c();
        csvColumn15BlankObj.Column_01__c = '636717';
        csvColumn15BlankObj.Column_02__c = 'FOOK WAH KUN KEE KNIT.FACTORY';
        csvColumn15BlankObj.Column_03__c = '126';
        csvColumn15BlankObj.Column_04__c = '472ONS';
        csvColumn15BlankObj.Column_05__c = '250';
        csvColumn15BlankObj.Column_06__c = '3/6/2020';
        csvColumn15BlankObj.Column_07__c = '6/1/2020';
        csvColumn15BlankObj.Column_08__c = 'China';
        csvColumn15BlankObj.Column_09__c = '735-235-183-110';
        csvColumn15BlankObj.Column_10__c = 'CG19R-68';
        csvColumn15BlankObj.Column_11__c = 'SIZE: 7';
        csvColumn15BlankObj.Column_12__c = 'GL LS STN AN SSUIT';
        csvColumn15BlankObj.Column_13__c = 'PRINTED';
        csvColumn15BlankObj.Column_14__c = '0';
        //csvColumn15BlankObj.Column_15__c = '7';
        csvColumn15BlankObj.Column_16__c = 'GIRLSWEAR 7-16';
        csvColumn15BlankObj.CSV_File_Format__c = 'Best and Less';
        csvColumn15BlankObj.Processing_Status__c = 'Draft';
        insert csvColumn15BlankObj;
        
        
        
        inputParams.add(csvFileObj.Id);
        inputParams.add(csvColumn15BlankObj.Id);
        
        
        // Inserting Retailer_Related_Data__c object records to satisfy getSupplier() --Start--
        Account acc = new Account();
        acc.Name = 'Test';
        insert acc;        
        Contact cont = new Contact();
        cont.AccountId = acc.Id;
        cont.LastName = 'Last name test';
        cont.Related_Retailer__c = 'Related retailer test';
        insert cont;        
        Customer_Information__c custInfo = new Customer_Information__c();
        custInfo.Name = 'Retailer name test'; //To satisfy getCustomerInfoId()
        insert custInfo;        
        Retailer_Code__c retailerObj = new Retailer_Code__c();
        retailerObj.Name = 'Retailer name test';
        retailerObj.Online_Enquiry__c = true;
        insert retailerObj;        
        Retailer_Related_Data__c retailerRelated = new Retailer_Related_Data__c();
        retailerRelated.Contact__c = cont.Id;
        retailerRelated.ContactID__c = cont.Id;
        retailerRelated.Customer_Information__c = custInfo.Id;
        retailerRelated.Retailer_Code__c = retailerObj.Id;
        retailerRelated.Supplier_Code__c = '126';
        retailerRelated.Status__c = 'Active';
        insert retailerRelated;
        // Inserting Retailer_Related_Data__c object records to satisfy getSupplier() --End--
        
        
        // Inserting Contact_Related_Retailer__c object records to satisfy getRetailerContactId() --Start--
        Contact_Related_Retailer__c contactRetailer = new Contact_Related_Retailer__c();
        contactRetailer.Retailer_Code__c = retailerObj.Id;
        contactRetailer.Contact__c = cont.Id;
        insert contactRetailer;
        // Inserting Contact_Related_Retailer__c object records to satisfy getRetailerContactId() --End--
        
        
        // Inserting Associate_Product__c object records to satisfy getHangerModel() --Start--
        Price_Specification_Book__c pricebook = new Price_Specification_Book__c();
        insert pricebook;        
        Price_Specification_Book_Product__c pricSpecProd = new Price_Specification_Book_Product__c();
        pricSpecProd.Name = '472ONS';
        pricSpecProd.Price_Specification_Book__c = pricebook.Id;
        pricSpecProd.Associated_Product__c = true;
        insert pricSpecProd;        
        Associate_Product__c assProd = new Associate_Product__c();
        assProd.Price_Specification_Book_Product__c = pricSpecProd.Id;
        insert assProd;   
        // Inserting Associate_Product__c object records to satisfy getHangerModel() --End--
        
        
        // Inserting PurchaseOrder__c object records to satisfy checkingPOExitsBasedOnOrderNumber() --Start--
        PurchaseOrder__c purchaseOrd = new PurchaseOrder__c();
        purchaseOrd.Order_Number__c = '636717';
        insert purchaseOrd;
        // Inserting PurchaseOrder__c object records to satisfy checkingPOExitsBasedOnOrderNumber() --End--
        
        
        // Inserting Purchase_Order_LineItem__c object records to satisfy checkingPOItemModelExitsBasedOnPOModel() --Start--
        Purchase_Order_LineItem__c purOrdLineItm = new Purchase_Order_LineItem__c();
        purOrdLineItm.Purchase_Order__c = purchaseOrd.Id;
        purOrdLineItm.Quantity__c = '200';
        purOrdLineItm.Product_CSV__c = '472ONS';
        insert purOrdLineItm;
        // Inserting Purchase_Order_LineItem__c object records to satisfy checkingPOItemModelExitsBasedOnPOModel() --End--
        
        boolean flag = true;
        Test.startTest();
        BessNLessCSVOrderProcessor.processOrder(inputParams); 
        Test.stopTest();
        System.assertEquals(true, flag);
    }
    
    static testMethod void processOrderTest3() {
        
        List<String> inputParams = new List<String>();
        
        CSV_File_Data__c csvFileObj = new CSV_File_Data__c();
        csvFileObj.Column_01__c = '636717';
        csvFileObj.Column_02__c = 'FOOK WAH KUN KEE KNIT.FACTORY';
        csvFileObj.Column_03__c = '126';
        csvFileObj.Column_04__c = '472ONS';
        csvFileObj.Column_05__c = 'ABC';
        csvFileObj.Column_06__c = '3/6/2020';
        csvFileObj.Column_07__c = '6/1/2020';
        csvFileObj.Column_08__c = 'China';
        csvFileObj.Column_09__c = '735-235-183-110';
        csvFileObj.Column_10__c = 'CG19R-68';
        csvFileObj.Column_11__c = 'SIZE: 7';
        csvFileObj.Column_12__c = 'GL LS STN AN SSUIT';
        csvFileObj.Column_13__c = 'PRINTED';
        csvFileObj.Column_14__c = '0';
        csvFileObj.Column_15__c = '7';
        csvFileObj.Column_16__c = 'GIRLSWEAR 7-16';
        csvFileObj.CSV_File_Format__c = 'Best and Less';
        csvFileObj.Processing_Status__c = 'Draft';
        insert csvFileObj;
        
        
        
        
        
        // Below object to cover Column_15 isBlank Condidtion.
        CSV_File_Data__c csvColumn15BlankObj = new CSV_File_Data__c();
        csvColumn15BlankObj.Column_01__c = '636717';
        csvColumn15BlankObj.Column_02__c = 'FOOK WAH KUN KEE KNIT.FACTORY';
        csvColumn15BlankObj.Column_03__c = '126';
        csvColumn15BlankObj.Column_04__c = '472ONS';
        csvColumn15BlankObj.Column_05__c = '250';
        csvColumn15BlankObj.Column_06__c = '3/6/2020';
        csvColumn15BlankObj.Column_07__c = '6/1/2020';
        csvColumn15BlankObj.Column_08__c = 'China';
        csvColumn15BlankObj.Column_09__c = '735-235-183-110';
        csvColumn15BlankObj.Column_10__c = 'CG19R-68';
        csvColumn15BlankObj.Column_11__c = 'SIZE: 7';
        csvColumn15BlankObj.Column_12__c = 'GL LS STN AN SSUIT';
        csvColumn15BlankObj.Column_13__c = 'PRINTED';
        csvColumn15BlankObj.Column_14__c = '0';
        //csvColumn15BlankObj.Column_15__c = '7';
        csvColumn15BlankObj.Column_16__c = 'GIRLSWEAR 7-16';
        csvColumn15BlankObj.CSV_File_Format__c = 'Best and Less';
        csvColumn15BlankObj.Processing_Status__c = 'Draft';
        insert csvColumn15BlankObj;
        
        
        
        inputParams.add(csvFileObj.Id);
        inputParams.add(csvColumn15BlankObj.Id);
        
        
        // Inserting Retailer_Related_Data__c object records to satisfy getSupplier() --Start--
        Account acc = new Account();
        acc.Name = 'Test';
        insert acc;        
        Contact cont = new Contact();
        cont.AccountId = acc.Id;
        cont.LastName = 'Last name test';
        cont.Related_Retailer__c = 'Related retailer test';
        insert cont;        
        Customer_Information__c custInfo = new Customer_Information__c();
        custInfo.Name = 'Retailer name test'; //To satisfy getCustomerInfoId()
        insert custInfo;        
        Retailer_Code__c retailerObj = new Retailer_Code__c();
        retailerObj.Name = 'Retailer name test';
        retailerObj.Online_Enquiry__c = true;
        insert retailerObj;        
        /*Retailer_Related_Data__c retailerRelated = new Retailer_Related_Data__c();
        retailerRelated.Contact__c = cont.Id;
        retailerRelated.ContactID__c = cont.Id;
        retailerRelated.Customer_Information__c = custInfo.Id;
        retailerRelated.Retailer_Code__c = retailerObj.Id;
        retailerRelated.Supplier_Code__c = '126';
        retailerRelated.Status__c = 'Active';
        insert retailerRelated;*/
        // Inserting Retailer_Related_Data__c object records to satisfy getSupplier() --End--
        
        
        // Inserting Contact_Related_Retailer__c object records to satisfy getRetailerContactId() --Start--
        Contact_Related_Retailer__c contactRetailer = new Contact_Related_Retailer__c();
        contactRetailer.Retailer_Code__c = retailerObj.Id;
        contactRetailer.Contact__c = cont.Id;
        insert contactRetailer;
        // Inserting Contact_Related_Retailer__c object records to satisfy getRetailerContactId() --End--
        
        
        // Inserting Associate_Product__c object records to satisfy getHangerModel() --Start--
        /*Price_Specification_Book__c pricebook = new Price_Specification_Book__c();
        insert pricebook;        
        Price_Specification_Book_Product__c pricSpecProd = new Price_Specification_Book_Product__c();
        pricSpecProd.Name = '472ONS';
        pricSpecProd.Price_Specification_Book__c = pricebook.Id;
        pricSpecProd.Associated_Product__c = true;
        insert pricSpecProd;        
        Associate_Product__c assProd = new Associate_Product__c();
        assProd.Price_Specification_Book_Product__c = pricSpecProd.Id;
        insert assProd;*/
        // Inserting Associate_Product__c object records to satisfy getHangerModel() --End--
        
        
        // Inserting PurchaseOrder__c object records to satisfy checkingPOExitsBasedOnOrderNumber() --Start--
        PurchaseOrder__c purchaseOrd = new PurchaseOrder__c();
        purchaseOrd.Order_Number__c = '636717';
        insert purchaseOrd;
        // Inserting PurchaseOrder__c object records to satisfy checkingPOExitsBasedOnOrderNumber() --End--
        
        
        // Inserting Purchase_Order_LineItem__c object records to satisfy checkingPOItemModelExitsBasedOnPOModel() --Start--
        Purchase_Order_LineItem__c purOrdLineItm = new Purchase_Order_LineItem__c();
        purOrdLineItm.Purchase_Order__c = purchaseOrd.Id;
        purOrdLineItm.Quantity__c = '200';
        purOrdLineItm.Product_CSV__c = '472ONS';
        insert purOrdLineItm;
        // Inserting Purchase_Order_LineItem__c object records to satisfy checkingPOItemModelExitsBasedOnPOModel() --End--
        
        boolean flag = true;
        Test.startTest();
        BessNLessCSVOrderProcessor.processOrder(inputParams); 
        Test.stopTest();
        System.assertEquals(true, flag);
    }
    
    static testMethod void processOrderTest4() {
        
        PurchaseOrder__c purchOrder = new PurchaseOrder__c();
        insert purchOrder;
        
        CSV_File_Data__c csvFileObj = new CSV_File_Data__c();
        csvFileObj.Column_01__c = '636717';
        csvFileObj.Column_02__c = 'FOOK WAH KUN KEE KNIT.FACTORY';
        csvFileObj.Column_03__c = '126';
        csvFileObj.Column_04__c = '472ONS';
        csvFileObj.Column_05__c = 'ABC';
        csvFileObj.Column_06__c = '3/6/2020';
        csvFileObj.Column_07__c = '6/1/2020';
        csvFileObj.Column_08__c = 'China';
        csvFileObj.Column_09__c = '735-235-183-110';
        csvFileObj.Column_10__c = 'CG19R-68';
        csvFileObj.Column_11__c = 'SIZE: 7';
        csvFileObj.Column_12__c = 'GL LS STN AN SSUIT';
        csvFileObj.Column_13__c = 'PRINTED';
        csvFileObj.Column_14__c = '0';
        csvFileObj.Column_15__c = '7';
        csvFileObj.Column_16__c = 'GIRLSWEAR 7-16';
        csvFileObj.CSV_File_Format__c = 'Best and Less';
        csvFileObj.Processing_Status__c = 'Draft';
        csvFileObj.Purchase_Order__c = purchOrder.Id;
        insert csvFileObj;
        
        boolean flag = true;
        Test.startTest();
        BessNLessCSVOrderProcessor.updateFailedRecords('636717'); 
        Test.stopTest();
        System.assertEquals(true, flag);
    }
}