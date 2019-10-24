pragma solidity >=0.4.21 <0.6.0;

import "./Data.sol";

contract acc {
     uint public a;
     //uint public requiredlookupId=100;
   
    address datachain_address;
    struct details{
        uint _data_id;
        uint _owner_id;
        string _owner_name;
        string _owner_type;
    }
   
   Data public dc;
   
    constructor(address data) public {
        //Just create a new auxiliary contract. We will use it to check if the part or product really exist
        datachain_address=data;
        dc = Data(data);
    }
   
   
   
    function get_interactionId(uint lookup_id1)view public returns (bytes32,uint,uint,uint,uint,uint){
         uint b_id;
        uint d_id;
        uint o_id;
        uint flag;
        //string smartcontract_name;
        //address datachain_address;
        bytes32 interactionId;
        uint _timeStamp;
        (b_id,d_id,o_id,interactionId,_timeStamp,flag) = dc.lookups(lookup_id1);
       
        return (interactionId,b_id,d_id,o_id,_timeStamp,flag);
    }
   
   
   
    function get_lookupId(uint buyerid,uint dataid,uint selectedownerid) public view returns (uint){
        uint d_id;
        uint b_id;
        uint selected_id;
        uint currentlookupId;
        currentlookupId =  dc.get_lookupId();
        uint hhi;
        uint i;
        for(i=0 ;i<= currentlookupId ;i++)
        {
           (d_id,b_id,selected_id,hhi)= dc.verifylookups(i);
        
             if(buyerid == b_id){
                 if( dataid == d_id ){
                 if(selectedownerid ==selected_id){
                     return hhi;
                 }
             }
           }
           else 
           return 15000;
        }
    }
    function check_lookupId(uint currentlookupId) public view returns (uint,uint,uint,uint){
        uint d_id;
        uint b_id;
        uint selected_id;
    (d_id,b_id,selected_id,currentlookupId)= dc.verifylookups(currentlookupId);
     return (d_id,b_id,selected_id,currentlookupId);
    }
    /*
     function get_data_hash(uint hhi,bytes32 interactionId ) public view returns (string){
     string data_hash;
     uint d_id;
    (data_hash)= dc.datas[d_id]._data_hash;
     return (data_hash);
    }
    */
}

