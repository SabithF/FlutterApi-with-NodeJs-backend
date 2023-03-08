const express = require('express');
const mongoose = require('mongoose');
const app = express();

// to use json data
app.use(express.json());


app.use(express.urlencoded({
    extended: true
}));

const productData = [];

// DB connection
mongoose.connect("mongodb+srv://SFariq:mslk123@cluster0.hvkvbbl.mongodb.net/?retryWrites=true&w=majority", {
    'useUnifiedTopology' : true, 'useNewUrlParse': true
}, (req, res) =>{
    console.log("Status", "Conntected to DB");
});

// 



// post api

// req- request
// res- responds
app.post('/api/addproduct',  (req, res)=> {

    // printing the request
    console.log("Result" , req.body);

    //creating an obj to store the data received from the request
    const pdata = {
        "id" : productData.length + 1,
        "pname": req.body.pname,
        "pprice": req.body.pprice,
        "pdesc": req.body.pdesc,

    };

    // pushing the pdata to "productData List"
    productData.push(pdata);
    console.log("Final", pdata);

    // to send status code "200" as a response
    res.status(200).send({
        "status code": 200,
        "Message" : 'Product created successfully',
        "product": pdata
        // "product":
        //          "id" : 
        //          "pname":
        //          "pprice": 
        //          "pdesc": 
    });



})

// get api
app.get('/api/getproducts', (req, res)=>{

    if(productData.length >0){
        res.status(200).send({
            "status code": 200,
            "product": productData
        });
    }else{
        res.status(200).send({
            "status code": 200,
            "product": []
        });

    }

});

// Update api 
//there are two types of update methods available
/* 1. PUT- put method will update the whole product and replace a new product
   2. PATCH- Patch method only update the specific element as per the requirement*/

//    Put method
app.post('/api/update/:id ', (req, res)=>{

    // multipluying the id by 1 to make it an int
  let id = req.params.id *1;

//   get the specific product from the list to update
let productTobeUpdate = productData.find(p=>p.id === id);

// get the index of the above fetch product
let index = productData.indexOf(productTobeUpdate);

productData[index] = req.body;

res.status(200).send({
    "status" : "Success",
    "message": "Product Updated"
})
print(res);

});

app.post("/api/delete/:id", (req, res)=>{
    let id = req.params.id*1;
    let productTobeDetele = productData.find(p=>p.id === id);
    let index = productData.indexOf(productTobeDetele);

    productData.slice(index, 1);

    res.status(204).send({
    "status" : "Success",
    "message": "Product Deleted"

    })

});

const port = 9916;
app.listen(port, ()=> {
    console.log('Server is running on port', port);
})
