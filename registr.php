<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="style.css">
    <style>
        
        body {
            font-family: 'Work Sans', sans-serif;
            margin: 0;
            padding: 0;
            background-color: whitesmoke;
        }

 header {
    background-color: #263C52;
  height: 80px;
  background-size: cover;
  background-position: center;
  display: flex;
  align-items: center;
  width: 100%;
  position: fixed;
  z-index: 999;
  top: -2px;


}

.baner {
    height: 20%;
    margin-left: 2%;
    }

        .site {
            margin: 0;

        }

    .registration-form {
    max-width: 400px;
    margin: 500px;
    margin-top: 800px; 
    padding: 20px;
    background-color: #fff;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

        h2 {
            text-align: center;
            color: #333;
        }

        form {
            display: flex;
            flex-direction: column;

        }

        label {
            margin-bottom: 8px;
            color: #333;
        }

        input {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            background-color: #333;
            color: #fff;
            margin-left: 20px;
            
        }

        input[type="submit"]:hover {
            background-color: #555;
        }

        .reg_fix {
    margin-top: 250px;
    margin-left: 20px; 
    top: 50px; 
}

.banerr {
    margin-left: auto;
    margin-right: 80px; 
    width: 20%; 
}

.exit {
    width: auto; /* Удалите margin-left: -60px; и установите ширину как auto */
}


    </style>
    <title>Вход</title>
</head>
<body>
    <?php
    $host='localhost';
    $user='root';
    $pass='';
    $base='info';

    $conn=mysqli_connect($host,$user,$pass,$base);
    ?>
        
<header>
    <img class="banerr" align="center" src="img/logo.png">
    <form action="index.html" method="post">
                    <input class="exit" type="submit" name="out" value="Назад">
                </form>
    
</header>
<main>
    <div class="shapka_button2">
                <?php
                if ($_SESSION['login'] != '')
                {
                ?>    
                <form action="index.html" method="post">
                    <input type="submit" name="out" value="Выход">
                </form>
                <?php
                }
                ?>
            </div>
            <div class="reg_fix">
          <?php
          if ($_POST['reg']=='Зарегистрироваться')
          {
            $login=$_POST['login'];
            $mail=$_POST['mail'];
            $pass1=$_POST['pass1'];
            $pass2=$_POST['pass2'];

            if ($pass1 == $pass2)
            {
              $query="INSERT INTO `reg`(`login`, `mail`, `pass`, `img`, `adres`, `tel`, `status`)
                      VALUES ('$login', '$mail', '$pass1', '1.png', '', '0', '0')";
              $result=mysqli_query($conn,$query);
              echo "<br><br>Регистрация прошла успешно <a href='auto.php'>Войдите</a><br><br>";        
            }
            else
            {
              echo "<br><br>Пароли не совпадают, попробуйте ещё раз <a href='registr.php'>Зарегистрироваться</a><br><br>";
            }
          }
          else
          {
          ?>
    <table>   
      <form action="registr.php" method="post">
          <tr>
            <td>Введите логин</td>
            <td><input type="text" name="login" required></td>
          </tr>
          <tr>
            <td>Введите почту</td>
            <td><input type="text" name="mail" required></td>
          </tr>
          <tr>
            <td>Введите пароль</td>
            <td><input type="password" name="pass1" required></td>
          </tr>
          <tr>
            <td>Повторите пароль</td>
            <td><input type="password" name="pass2" required></td>
          </tr>
          <tr>
            <td></td>
            <td><input type="submit" name="reg" value="Зарегистрироваться" required></td>
          </tr>
      </form>
    </table>
    <?php
    }
    ?>
    </div>
</main>
</body>
</html>
