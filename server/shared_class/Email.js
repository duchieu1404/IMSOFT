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
            user: 'info.fishclub.online@gmail.com',
            pass: 'Fishclub*123$'
        }
    };

    this.transporter = nodemailer.createTransport(this.poolConfig);

    this.mail_default_Options = {
        from: '"FishClub Online" <info.fishclub.online@gmail.com>', // sender address
        to: '', // list of receivers
        subject: '[FishClub.Online]', // Subject line
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

    this.sendEmail = function(emailOption,callback)
    {
        var emailObj = {
            from:emailOption.from_email || '"FishClub Online" <info.fishclub.online@gmail.com>', // sender address
            to: emailOption.to_email||'', // list of receivers
            subject: emailOption.subject||'[FishClub.Online]', // Subject line
            text: '', // plaintext body
            html: emailOption.content||'' // html body
            }
        this.transporter.sendMail(emailObj, function(error, info){
            if(callback)
            {
                callback(error,info);
            }

        });
    }
}

module.exports = EmailUtil;

