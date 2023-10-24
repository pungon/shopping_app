const express = require('express');
const datas = require('./datas');
const bodyParser = require('body-parser');


const app = express();
const port = 3000;

app.use(bodyParser.json());
app.use(express.json())
app.use(express.urlencoded({ extended: true }))



app.get('/products', (req, res) => {
    datas.getProducts((error, results) => {
        if (error) {
            return res.status(500).json({ error: error.message });
        }
        res.json(results);
    });
});

app.get('/productAndStore', (req, res) => {
    const condition = req.query.condition; // รับค่า query parameter "condition"
    
    datas.getProductAndStore(condition, (error, results) => {
        if (error) {
            return res.status(500).json({ error: error.message });
        }
        res.json(results);
    });
});

app.get('/userPass2', (req, res) => {
    datas.userData((error, results) => {
        if (error) {
            return res.status(500).json({ error: error.message });
        }
        res.json(results);
    });
});

app.post('/userPass', (req, res) => {
    const { username, password } = req.body;

    console.log('Received username:', username);
    datas.userData((error, users) => {
    if (error) {
        console.error('เกิดข้อผิดพลาดในการเข้าถึงข้อมูลผู้ใช้:', error);
        return res.status(500).json({ message: 'เกิดข้อผิดพลาดในการเข้าถึงข้อมูลผู้ใช้' });
    }
    const user = users.find((user) => user.username === username && user.password === password);
    if (user) {
      // หากเจอผู้ใช้ที่ตรงกัน ส่งข้อความอนุมัติกลับ
      res.status(200).json({ message: 'Login successful', user: users.username});
      
      console.log('Login successful')
      
    } else {
      // หากไม่เจอผู้ใช้ ส่งข้อความข้อผิดพลาดกลับ
      res.status(401).json({ message: 'Invalid username or password' });
      console.log('Invalid username or password')
    }
  });

});

app.post('/userPassT', (req, res) => {
    const { username, password } = req.body;
    // ตรวจสอบข้อมูลการเข้าสู่ระบบที่คุณต้องการ
    console.log('Received username:', username);
    console.log('Received password:', password);
    if (username === 'a11' && password === 'a11') {
      // หากข้อมูลถูกต้อง ส่งข้อความอนุมัติกลับ
      res.status(200).json({ message: 'Login successful' });
      console.log('Login successful')
    } else {
      // หากข้อมูลไม่ถูกต้อง ส่งข้อความข้อผิดพลาดกลับ
      res.status(401).json({ message: 'Invalid username or password' });
      console.log('Invalid username or password')
    }
  });





app.listen(port, () => {
    console.log(`Server started on http://localhost:${port}`);
});
