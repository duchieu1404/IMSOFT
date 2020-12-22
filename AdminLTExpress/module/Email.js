/**
 * Created by voxu on 10/27/16.
 */
var nodemailer = require('nodemailer');

var EmailUtil = function()
{
    this.poolConfig = {
        pool: true,
        host: 'smtp.gmail.com',
        port: 465,
        secure: true, // use SSL
        auth: {
            user: 'banca.pc.saigon@gmail.com',
            pass: 'Qs8454846'
        }
    };

    this.transporter = nodemailer.createTransport(this.poolConfig);

    this.mail_default_Options = {
        from: '"BanCaPC SGN" <banca.pc.saigon@gmail.com>', // sender address
        to: 'thao.daohuu@gmail.com,dinhtuananh227@gmail.com,nguyennhatanh.bkfet@gmail.com', // list of receivers
        subject: 'Hello ✔', // Subject line
        text: 'Hello world 🐴', // plaintext body
        html: '<b>Hello world 🐴</b>' // html body
    };

    this.sendEmailNotification = function(emailOption)
    {
        this.transporter.sendMail(emailOption, function(error, info){
            if(error){
                return console.log(error);
            }
            console.log('Message sent: ' + info.response);
        });
    }

}

module.exports = EmailUtil;

