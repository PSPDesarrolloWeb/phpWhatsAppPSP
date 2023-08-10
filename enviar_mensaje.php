<?php

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "apiwhatsapp";


$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}


$sql_emisor = "SELECT * FROM sender WHERE id_emisor = 1"; //Existen datos para cada emisor en la tabla message
$result_emisor = $conn->query($sql_emisor);

if ($result_emisor->num_rows > 0) {
    $row_emisor = $result_emisor->fetch_assoc();
    $idSender = $row_emisor['id_emisor'];
    $nameEmisor = $row_emisor['name_emisor'];
    $telEmisor = $row_emisor['tel_emisor'];
    $dirEmisor = $row_emisor['dir_emisor'];
    $emailEmisor = $row_emisor['email_emisor'];


    $sql_message = "SELECT * FROM message WHERE message_id_sender = 2"; //Se debe cambiar el valor de id sender para que el mensaje cambie

    if ($result_message->num_rows > 0) {
        $row_message = $result_message->fetch_assoc();
        $typeMessage = $row_message['type_message'];
        $textMessage = $row_message['text_message'];
        $imageMessage = $row_message['image_message'];
        $linkMessage = $row_message['link_message'];


        $message = "Emisor: $nameEmisor | Teléfono: $telEmisor | Dirección: $dirEmisor | Correo: $emailEmisor | Tipo: $typeMessage | Texto: $textMessage | Imagen: $imageMessage | Enlace: $linkMessage";


        $response = array("message" => $message);
    } else {
        $response = array("error" => "No se encontraron mensajes asociados al emisor $nameEmisor");
    }
} else {
    $response = array("error" => "No se encontraron emisores en la base de datos");
}

$conn->close();

header('Content-Type: application/json');
echo json_encode($response);
?>
