<html>
    <style>
        .top{
            color: green;
        text-align: center;
	    }
    </style>
    <head>
        <title>Search for song</title>
    </head>
    <body>
        <h1 class='top'> CSCI 466 Project</h1>
        <form method="post">
            <label for="searchForSong">Search for song by:</label>
            <select name="searchForSong" id="searchForSong">
                <option value="artistName">Artist name</option>
                <option value="titleOfSong">Title of song</option>
                <option value="nameOfContributer">Name of contributer</option>
            </select>
            <br>
                <label for="searchWord">Enter search:</label>
                <input type="text" name="searchWord" id="searchWord">
                <input type="submit" name="submitSearch" value="Search" class="submitbuttonS"></input>
        </form>

        <?php
            if(isset($_POST['submitSearch'])){
                $searchCriteria = $_POST['searchForSong'];
                $searchWord = $_POST['searchWord'];
                $result = "";

                switch($searchCriteria){
                    case "artistName":
                        $result = "SELECT * FROM Song WHERE Artist LIKE '%$searchWord'";
                        break;
                    case "titleOfSong":
                        $result = "SELECT * FROM Song WHERE Title LIKE '%$searchWord'";
                        break;
                    case "nameOfContributer":
                        $result = "SELECT * FROM Contributor WHERE ContributorName LIKE '%$searchWord'";
                        break;
                    default:
                        echo "Couldnt search, try again!";
                }

                if(!empty($result)){
                    $username = 'z2003886';
                    $password = '2001Dec13';
                    try {
                        $dsn = "mysql:host=courses;dbname=z2003886";
                        $pdo = new PDO($dsn, $username, $password);
                        $res = $pdo->query($result);
                        echo "<h2>Results:</h2>";
                        echo "<ul>";
                        while ($row = $res->fetch(PDO::FETCH_ASSOC)){
                            echo "<li>{$row['Title']} by {$row['Artist']}</li>";
                        }
                        echo "</ul>";
                    } catch (PDOException $e) {
                        echo "Connection failed: " . $e->getMessage();
                    } 
                }
            }
        ?>
    </body>
</html>

