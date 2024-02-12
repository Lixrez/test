<? session_start(); 

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="style.css">
    <style>
        
        body {
            font-family: Arial, sans-serif;
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

        .site {
            margin: 0;
        }

        .registration-form {
            max-width: 400px;
            margin: 50px auto;
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

.banerr {
    margin-left: auto;
    margin-right: 70px; 
    width: 20%; 
}

.exit {
    margin-right:   10px;
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

<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['auto']) && $_POST['auto'] == 'Войти') {
        $login = $_POST['login'];
        $pass1 = $_POST['pass1'];

        $query = "SELECT * FROM reg WHERE login='$login' AND pass='$pass1' ";
        $result = mysqli_query($conn, $query);
        $num = mysqli_num_rows($result);
        $row = mysqli_fetch_array($result);

        if ($num == 1) {
            echo "<br><br>Вы вошли, пройдите в <a href='kabin.php'>Редактировать новости</a><br><br>";
            $_SESSION['login'] = $login;
            $_SESSION['pass1'] = $pass1;
            $_SESSION['status'] = $row['status'];
            if ($row['status'] == 1) {
                echo "<br><br>Добро пожаловать АДМИНИСТРАТОР <br><br>";
            }
        } else {
            echo "<br><br>Данные не верные, попробуйте ещё раз <a href='auto.php'>Войти</a><br><br>";
        }
    }
}
?>

<main>
    <div class="reg_fix">
            <?
            if ($_POST['auto']=='Войти')
            {
                $login=$_POST['login'];
                $pass1=$_POST['pass1'];

                $query="SELECT * FROM `reg` WHERE `login`='$login' AND `pass`='$pass1' ";
                $result=mysqli_query($conn,$query);
                $num=mysqli_num_rows($result);
                $row=mysqli_fetch_array($result);

                if ($num == 1)
                {
                    echo "<br><br> <a href='loginindex.html'>Вы вошли: Вернуться на главную</a><br><br>";
                    $_SESSION['login']=$login;
                    $_SESSION['pass1']=$pass1;
                    $_SESSION['status']=$row[6];
                    if ($row[6] == 1) echo "<br><br><a href='admin.php'>Редактировать расписание</a><br><br>";
                }
                else
                {
                    echo"<br><br>Данные не верны, попробуйте ещё раз <a href='auto.php'>Войти</a><br><br>";
                }   
            }
            else
            {
            ?>  
    <table>   
      <form action="auto.php" method="post">
          <tr>
            <td>Введите логин</td>
            <td><input type="text" name="login" required></td>
          </tr>
          <tr>
            <td>Введите пароль</td>
            <td><input type="password" name="pass1" required></td>
          </tr>
          <tr>
            <td></td>
            <td><input type="submit" name="auto" value="Войти"></td>
          </tr>
      </form>
    </table>
    <?
    }
    ?>
    </div>      
        </main>
</body>
</html>

