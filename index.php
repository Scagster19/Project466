<html>
    <style>
        .top{
            color: green;
        text-align: center;
	    }
    </style>
    <head>
        <title>Group Project</title>
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
                echo '<div>';
                echo "$searchCriteria";
                echo "$searchWord";
                echo '</div>';
            }
        ?>
    </body>
</html>
