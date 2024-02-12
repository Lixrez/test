<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Редактирование расписания</title>
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

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $group_name = $_POST['group_name'];
        $day = $_POST['day'];
        $pair1 = $_POST['pair1'];
        $pair2 = $_POST['pair2'];
        $pair3 = $_POST['pair3'];
        $pair4 = $_POST['pair4'];
        $pair5 = $_POST['pair5'];
        $pair6 = $_POST['pair6'];

        $sql = "UPDATE raspisanie SET pair1=?, pair2=?, pair3=?, pair4=?, pair5=?, pair6=? WHERE group_name=? AND day=?";
        $stmt = mysqli_prepare($conn, $sql);
        mysqli_stmt_bind_param($stmt, "ssssssss", $pair1, $pair2, $pair3, $pair4, $pair5, $pair6, $group_name, $day);
        if (mysqli_stmt_execute($stmt)) {
            echo "Редактирование расписания.";
        } else {
            echo "Ошибка: " . mysqli_error($conn);
        }
        mysqli_stmt_close($stmt);
    }

    mysqli_close($conn);
    ?>

    <h2>Изменение расписания</h2>
    <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
        <label for="group_name">Группа:</label>
        <select name="group_name" id="group_name">
            <option value="КИТ">КИТ</option>
            <option value="ФЛФ">ФЛФ</option>
            <option value="ИЕН">ИЕН</option>
            <option value="ЮФ">ЮФ</option>
            <option value="ИП">ИП</option>
            <option value="ИФ">ИФ</option>
            <option value="ПИ">ПИ</option>
        </select><br>
        <label for="day">День недели:</label>
        <select name="day" id="day">
            <option value="Понедельник">Понедельник</option>
            <option value="Вторник">Вторник</option>
            <option value="Среда">Среда</option>
            <option value="Четверг">Четверг</option>
            <option value="Пятница">Пятница</option>
            <option value="Суббота">Суббота</option>
            <option value="Воскресенье">Воскресенье</option>
        </select><br>
        <label for="pair1">Пара 1:</label>
        <input type="text" name="pair1"><br>
        <label for="pair2">Пара 2:</label>
        <input type="text" name="pair2"><br>
        <label for="pair3">Пара 3:</label>
        <input type="text" name="pair3"><br>
        <label for="pair4">Пара 4:</label>
        <input type="text" name="pair4"><br>
        <label for="pair5">Пара 5:</label>
        <input type="text" name="pair5"><br>
        <label for="pair6">Пара 6:</label>
        <input type="text" name="pair6"><br>
        <input type="submit" value="Сохранить">
    </form>
    <form action="loginindex.html" method="post">
                    <input class="exit" type="submit" name="out" value="На главную">
                </form>
</body>
</html>
