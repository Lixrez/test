<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Расписание</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
            margin-left: -9px;
        }

        th, td {
            border: 1px solid black;
            padding: 4px;
            text-align: left;
            font-size: 14px; 
        }

        th {
            background-color: #f2f2f2;
        }

        @media screen and (max-width: 600px) {
            
            th, td {
                padding: 1px; 
                font-size: 11px; 

            }
        }
    </style>
</head>
<body>
    <?php
    $host = 'localhost';
    $user = 'root';
    $pass = '';
    $base = 'info';

    $conn = mysqli_connect($host, $user, $pass, $base);

    if (!$conn) {
        die("Ошибка подключения: " . mysqli_connect_error());
    }

    if (isset($_POST['group'])) {
        $group = $_POST['group'];

        $sql = "SELECT * FROM raspisanie WHERE group_name='$group'";
        $result = mysqli_query($conn, $sql);

        if (mysqli_num_rows($result) > 0) {
            echo "<h2>Расписание для группы $group</h2>";
            echo "<table>";
            echo "<tr><th>День недели</th><th>Пара 1</th><th>Пара 2</th><th>Пара 3</th><th>Пара 4</th><th>Пара 5</th><th>Пара 6</th></tr>";
            while ($row = mysqli_fetch_assoc($result)) {
                echo "<tr>";
                echo "<td>" . $row['day'] . "</td>";
                echo "<td>" . $row['pair1'] . "</td>";
                echo "<td>" . $row['pair2'] . "</td>";
                echo "<td>" . $row['pair3'] . "</td>";
                echo "<td>" . $row['pair4'] . "</td>";
                echo "<td>" . $row['pair5'] . "</td>";
                echo "<td>" . $row['pair6'] . "</td>";
                echo "</tr>";
            }
            echo "</table>";
        } else {
            echo "Расписание для группы $group не найдено.";
        }
    } else {
        echo "Выберите группу.";
    }

    mysqli_close($conn);
    ?>

    <h1>Расписание</h1>
    <form action="schedule.php" method="post">
        <label for="group">Выберите группу:</label>
        <select name="group" id="group">
            <option value="КИТ">КИТ</option>
            <option value="ФЛФ">ФЛФ</option>
            <option value="ИЕН">ИЕН</option>
            <option value="ЮФ">ЮФ</option>
            <option value="ИП">ИП</option>
            <option value="ИФ">ИФ</option>
            <option value="ПИ">ПИ</option>
        </select>
        <input type="submit" value="Показать расписание">
    </form>
    <form action="index.html" method="post">
                    <input class="exit" type="submit" name="out" value="Назад">
                </form>
</body>
</html>
