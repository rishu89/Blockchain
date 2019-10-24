import {  init_web3 } from "./utils.js"

window.onload = async function () {
      var x = await init_web3()
      console.log("hp")


      //0x58d4b420dee003980328ef9195132109be35a57a1f3671de0241d6b1a42dc6f9
      /*
      window.pm.methods.getUser("0x58d4b420dee003980328ef9195132109be35a57a1f3671de0241d6b1a42dc6f9").call({ from: window.accounts[0] }, function (error, user) {
              if (error)
                  console.log(error)
              else {
                  console.log(user)
                  //console.log(part_info)
                  console.log(user["_userName"])
                  console.log(user["_passWord"])
                  console.log(user["_address"])
                  console.log(user["_userType"])
                }
              })
              */

              /*
      window.pm.methods.getUser("0x58d4b420dee003980328ef9195132109be35a57a1f3671de0241d6b1a42dc6f9").send({ from: window.accounts[0], gas: 100000 }, function (error, result) {
          if (error) {
              console.log(error)
          } else {
              console.log(result)
              //Logic to remove item from owned list

          }
      })
      */


      document.getElementById("btnloginpress").addEventListener("click", function () {
        var id = document.getElementById("Uid").value
        var username = document.getElementById("Uname").value;
        var password = document.getElementById("password").value;
        var usertype = document.getElementById("usertype").value;

    window.pm.methods.userLogin(id,username,password,usertype).call({ from: window.accounts[0]}, function (error, result) {
        if (error) {
            console.log(error)
            console.log("false")
        } 
		else {
            console.log(result)
            if(usertype=="Owner"|| usertype == "CurrentOwner"){
              // Simulate a mouse click:
window.location.href = "newData.html";
            }
            else {
              window.location.href = "buyer.html?"+id;

            }

            //Logic to remove item from owned list

        }
    })

    /*
    window.pm.methods.getUser("").send({ from: window.accounts[0], gas: 100000 }, function (error, result) {
        if (error) {
            console.log(error)
        } else {
            console.log(result)
            //Logic to remove item from owned list

        }
    })
    */

    })
    }
