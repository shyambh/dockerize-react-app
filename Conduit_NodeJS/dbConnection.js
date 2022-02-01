const {Sequelize} = require('sequelize')

//LOCAL CONNECTION
/* const sequelize = new Sequelize('conduit','root','password',{
    dialect: 'mysql',
    host:'localhost',
    logging: false
}); */


//AMAZON RDS CONNECTION
/* const sequelize = new Sequelize('conduit1',process.env.USER_NAME,process.env.PASSWORD,{
    dialect: 'mysql',
    host:process.env.DB_HOST,
    logging: false,
    port: 3306
});
 */


console.log(`The DB_HOST is : ${process.env.DB_HOST}`);
console.log(`The PORT is : ${process.env.PORT}`);
console.log(`The DB_USERNAME is : ${process.env.DB_USERNAME}`);
console.log(`The DB_PASSWORD is : ${process.env.DB_PASSWORD}`);

const sequelize = new Sequelize(process.env.DATABASE,process.env.DB_USERNAME,process.env.DB_PASSWORD,{
    dialect: 'postgres',
    host: process.env.DB_HOST, 
    logging: false,
    port: process.env.PORT,
    
});

const checkConnection =async () => {
    try {
        await sequelize.authenticate();
        console.log('Connection has been established successfully.');
    } catch (error) {
        console.error('Unable to connect to the database:', error);
    }
}

checkConnection()

module.exports = sequelize