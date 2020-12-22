// /**
//  * Created by Huy on 6/27/16.
//  */
// var message = function(){
//     this.arrData=[];//array store bytes data
//     this.length=0;
//     this.posRead=0;
//     this.command=null;
//
//     this.objFromBuff = function(buff){
//         var arrUnit = new Uint8Array(buff);
//         this.writeBytes(arrUnit,arrUnit.length);
//     }
//
//     this.writeInt=function(value){
//         var buffer=[];
//         for (var i = 0; i < 4; i++) {
//             buffer[i] = value >> (8 * (4 - i - 1));
//             var p = buffer[i];
//             this.addChar(this.arrData, p);
//             this.length += 1;
//         }
//     }
//     this.readInt=function(){
//         var ptr=[];
//         this.posRead += 4;
//         if (this.posRead <= this.arrData.length) {
//             for (var i = 0; i < 4; i++) {
//                 ptr[i] = this.getChar(this.arrData, this.posRead - 4 + i);
//             }
//             return (ptr[0] << 24) + ((ptr[1] & 0xFF) << 16) + ((ptr[2] & 0xFF) << 8)
//                 + (ptr[3] & 0xFF);
//         }
//         return -999;
//     }
//     this.writeBoolean=function(value){
//         var p = 0;
//         if (value) {
//             p = 1;
//         }
//         this.addChar(this.arrData, p);
//         this.length += 1;
//     }
//     this.writeLong=function(value){
//         var buffer= new Int32Array(8);
//         for (var i = 0; i < 8; i++) {
//             buffer[i] = Math.floor(value/Math.pow(2,(8 * (8 - i - 1))));
//             this.addChar(this.arrData, buffer[i]);
//             this.length += 1;
//         }
//     }
//     this.readLong=function(){
//         var len = 8;
//         this.posRead += len;
//         if (this.posRead <= this.arrData.length) {
//             var ptr=[];
//             for (var i = 0; i < len; i++) {
//                 ptr[i] = this.getChar(this.arrData, this.posRead - len + i);
//             }
//             var n = 0;
//             for (var i = 0; i < len; i++) {
//                 n += (ptr[i] & 0xFF) << (8 * (len - i - 1));
//             }
//             return n;
//         } else {
//             return -99;
//         }
//     }
//     //new
//     this.readBoolean=function(){
//         this.posRead += 1;
//         if (this.posRead <= this.arrData.length) {
//             var ptr=[];
//             for (var i = 0; i < 1; i++) {
//                 ptr[i] = this.getChar(this.arrData, this.posRead - 1 + i); //data->get(posRead-1+i);
//             }
//             if (ptr[0] == 0)
//                 return false;
//             else {
//                 return true;
//             }
//         } else {
//             return false;
//         }
//     }
//     //read all bytes in message
//     this.readBytes=function(len){
//         this.posRead+=len;
//         if (this.arrData.length>=this.posRead) {
//             var data=[];
//             for (var i = 0; i < len; i++) {
//                 data[i] = this.getChar(this.arrData, this.posRead - len + i); //data->get(posRead -len + i);
//             }
//             return data;
//         } else {
//             return null;
//         }
//     }
//     //push char value
//     this.addChar=function(arr,value){
//         arr.push(value);
//     }
//     //get char value from array data
//     this.getChar=function(arr, pos){
//         return arr[pos];
//     }
//     this.getCMD=function(){
//         var c = this.getChar(this.arrData,0);
//         var a;
//         if(c>=128){
//             a=c-256;
//         }
//         else a=c;
//         return c;
//     }
//     this.writeByte=function(value){//write command
//         if(value>=0){
//             this.addChar(this.arrData,value);
//         }
//         else {
//             this.addChar(this.arrData,256+value);
//         }
//     }
//     this.writeBytes=function(arr,len){
//         if(len == null) len = arr.length;
//         for(var i=0;i<len;i++){
//             this.arrData[i]= arr[i];
//         }
//     }
//
//     this.appendBytes=function(arr,len){
//         if(len == null) len = arr.length;
//         for(var i=0;i<len;i++){
//             this.arrData.push(arr[i]);
//             this.length++;
//         }
//     }
//
//
//     this.readByte=function(){
//         var c = this.getChar(this.arrData,this.posRead++);
//         var a;
//         if(c>=128){
//             a=c-256;
//         }else a=c;
//         return a;
//     }
//     this.writeShort=function(value) {//write string's length
//         if (!isNaN(value)) {//Check is value is number
//             for (var i = 0; i < 2; i++) {
//                 var val = value >> (8 * (2 - i - 1));
//                 this.addChar(this.arrData, val);
//                 this.length++;
//             }
//         }
//     }
//     this.readShort=function(){//read string 's length
//         this.posRead += 2;
//         if (this.posRead <= this.arrData.length) {
//             var ptr=[];
//             for (var i = 0; i < 2; i++) {
//                 ptr[i] = this.getChar(this.arrData, this.posRead - 2 + i);
//                 if(ptr[i]==255){i=-1;this.posRead+=1;ptr=[];}//255 is space char
//             }
//             var n = ((ptr[0] & 0xFF) << 8) + (ptr[1] & 0xFF);
//             return n;
//         } else {
//             return -99;
//         }
//     }
//     this.writeStringUTF=function(str){
//         if(!str) str = "";
//         var strBytes = toUTF8Array(str);
//         this.writeShort(strBytes.length);
//         for(var i=0;i<strBytes.length;i++){
//             // var p = str[i].charCodeAt(0);//convert to 8bit number
//             // this.addChar(this.arrData,p);
//             this.addChar(this.arrData,strBytes[i]);
//             this.length++;
//         }
//     }
//     this.readStringUTF=function(){
//         var len = this.readShort();
//         this.posRead+=len;
//         if(this.posRead<=this.arrData.length){
//             var ptr=[];
//             for(var i=0;i<len;i++){
//                 var val = this.getChar(this.arrData,this.posRead-len+i);
//                 ptr.push(val);
//             }
//             return Utf8ArrayToStr(ptr);
//         }
//         else return "";
//     }
//     this.getBytes=function() {
//         return this.arrData;
//     }
//     this.setCommand=function(val){
//         this.command = val;
//     }
//     this.getCommand=function(){
//         return this.command;
//     }
// }
//
// ///
// function Utf8ArrayToStr(array) {
//     var out, i, len, c;
//     var char2, char3;
//
//     out = "";
//     len = array.length;
//     i = 0;
//     while(i < len) {
//         c = array[i++];
//         switch(c >> 4)
//         {
//             case 0: case 1: case 2: case 3: case 4: case 5: case 6: case 7:
//             // 0xxxxxxx
//             out += String.fromCharCode(c);
//             break;
//             case 12: case 13:
//             // 110x xxxx   10xx xxxx
//             char2 = array[i++];
//             out += String.fromCharCode(((c & 0x1F) << 6) | (char2 & 0x3F));
//             break;
//             case 14:
//                 // 1110 xxxx  10xx xxxx  10xx xxxx
//                 char2 = array[i++];
//                 char3 = array[i++];
//                 out += String.fromCharCode(((c & 0x0F) << 12) |
//                     ((char2 & 0x3F) << 6) |
//                     ((char3 & 0x3F) << 0));
//                 break;
//         }
//     }
//
//     return out;
// }
//
//
// function toUTF8Array(str) {
//     var utf8 = [];
//     for (var i=0; i < str.length; i++) {
//         var charcode = str.charCodeAt(i);
//         if (charcode < 0x80) utf8.push(charcode);
//         else if (charcode < 0x800) {
//             utf8.push(0xc0 | (charcode >> 6),
//                 0x80 | (charcode & 0x3f));
//         }
//         else if (charcode < 0xd800 || charcode >= 0xe000) {
//             utf8.push(0xe0 | (charcode >> 12),
//                 0x80 | ((charcode>>6) & 0x3f),
//                 0x80 | (charcode & 0x3f));
//         }
//         // surrogate pair
//         else {
//             i++;
//             // UTF-16 encodes 0x10000-0x10FFFF by
//             // subtracting 0x10000 and splitting the
//             // 20 bits of 0x0-0xFFFFF into two halves
//             charcode = 0x10000 + (((charcode & 0x3ff)<<10)
//                 | (str.charCodeAt(i) & 0x3ff))
//             utf8.push(0xf0 | (charcode >>18),
//                 0x80 | ((charcode>>12) & 0x3f),
//                 0x80 | ((charcode>>6) & 0x3f),
//                 0x80 | (charcode & 0x3f));
//         }
//     }
//     return utf8;
// }
//
// function fromUTF8Array(data) { // array of bytes
//     var str = '',
//         i;
//
//     for (i = 0; i < data.length; i++) {
//         var value = data[i];
//
//         if (value < 0x80) {
//             str += String.fromCharCode(value);
//         } else if (value > 0xBF && value < 0xE0) {
//             str += String.fromCharCode((value & 0x1F) << 6 | data[i + 1] & 0x3F);
//             i += 1;
//         } else if (value > 0xDF && value < 0xF0) {
//             str += String.fromCharCode((value & 0x0F) << 12 | (data[i + 1] & 0x3F) << 6 | data[i + 2] & 0x3F);
//             i += 2;
//         } else {
//             // surrogate pair
//             var charCode = ((value & 0x07) << 18 | (data[i + 1] & 0x3F) << 12 | (data[i + 2] & 0x3F) << 6 | data[i + 3] & 0x3F) - 0x010000;
//
//             str += String.fromCharCode(charCode >> 10 | 0xD800, charCode & 0x03FF | 0xDC00);
//             i += 3;
//         }
//     }
//
//     return str;
// }
//
//
// function doubleToByteArray(number) {
//     var buffer = new ArrayBuffer(4);
//     var intView = new Int32Array(buffer);
//     var floatView = new Float32Array(buffer);
//
//     floatView[0] = number;
//
//     // Debug: display binary representation of `number`
//     // console.log(intView[0].toString(2));
//     return [
//         (intView[0] >> 24) & 0xFF,
//         (intView[0] >> 16) & 0xFF,
//         (intView[0] >>  8) & 0xFF,
//         (intView[0] >>  0) & 0xFF,
//         (intView[1] >> 24) & 0xFF,
//         (intView[1] >> 16) & 0xFF,
//         (intView[1] >>  8) & 0xFF,
//         (intView[1] >>  0) & 0xFF
//     ];
// }
//
//
//
// module.exports = message;
