<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Редактирование и добавление новостей</title>
    <link rel="stylesheet" type="text/css" href="style.css">
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

    // Проверяем, был ли передан идентификатор новости для редактирования
    if (isset($_GET['edit'])) {
        $id = $_GET['edit'];

        // Получаем данные о выбранной новости из базы данных
        $sql = "SELECT * FROM news WHERE id=$id";
        $result = mysqli_query($conn, $sql);
        $row = mysqli_fetch_assoc($result);
    }

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        // Получаем данные из формы
        $id = $_POST['id'];
        $title = $_POST['title'];
        $content = $_POST['content'];

        // Проверяем, была ли отправлена новая картинка
        if ($_FILES['image']['size'] > 0) {
            $image = $_FILES['image']['name'];
            $target_dir = "uploads/";
            $target_file = $target_dir . basename($_FILES["image"]["name"]);
            move_uploaded_file($_FILES["image"]["tmp_name"], $target_file);

            // Обновляем запись в базе данных с новой картинкой
            $sql = "UPDATE news SET image='$image', title='$title', content='$content' WHERE id=$id";
        } else {
            // Если новая картинка не была отправлена, обновляем запись без изменения картинки
            $sql = "UPDATE news SET title='$title', content='$content' WHERE id=$id";
        }

        if (mysqli_query($conn, $sql)) {
            echo "Новость успешно сохранена.";
        } else {
            echo "Ошибка: " . mysqli_error($conn);
        }
    }

    // Закрываем соединение с базой данных
    mysqli_close($conn);
    ?>

    <h2>Добавление и редактирование новостей</h2>
    <form id="newsForm" enctype="multipart/form-data">
        <input type="hidden" id="newsId" name="id" value="<?php echo isset($row) ? $row['id'] : ''; ?>">
        <label for="image">Картинка:</label>
        <input type="file" id="image" name="image"><br>
        <label for="title">Заголовок:</label>
        <input type="text" id="title" name="title" value="<?php echo isset($row) ? $row['title'] : ''; ?>"><br>
        <label for="content">Текст новости:</label><br>
        <textarea id="content" name="content" rows="5" cols="50"><?php echo isset($row) ? $row['content'] : ''; ?></textarea><br>
        <input type="submit" value="Сохранить">
    </form>

    <script>
        document.getElementById("newsForm").addEventListener("submit", function(event) {
            event.preventDefault();

            // Получаем данные из формы
            var formData = new FormData(this);

            // Отправляем данные на сервер
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "index.php", true);
            xhr.onload = function() {
                if (xhr.status === 200) {
                    // Обработка успешного ответа от сервера
                    console.log(xhr.responseText);
                } else {
                    // Обработка ошибки
                    console.error(xhr.responseText);
                }
            };
            xhr.send(formData);
        });
    </script>
</body>
</html>
