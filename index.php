<?php

$conn = pg_connect("host=127.0.0.1 port=5452 dbname=bankapp1 user=postgres password=1")
or die("Ошибка подключения: " . pg_last_error());

$query = "SELECT id, firstname, secondname, thirdname, birthdate, username, password_hash FROM users";
$result = pg_query($conn, $query) or die("Ошибка подключения: " . pg_last_error());

echo "<table border='1'>";
while ($row = pg_fetch_assoc($result)) {
    echo "<tr>
            <td> {$row['id']} </td>
            <td> {$row['firstname']} </td>
            <td> {$row['secondname']} </td>
            <td> {$row['thirdname']} </td>
            <td> {$row['birthdate']} </td>
            <td> {$row['username']} </td>
            <td> {$row['password_hash']} </td>
            
        </tr>";
}
echo "</table>";

?>