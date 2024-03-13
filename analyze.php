<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Log Analysis Result</title>
    <link rel="stylesheet" href="style.css">
    <!-- Include Google Charts library -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</head>
<body>
    <h1>Log Analysis Result</h1>

    <?php
    if ($_FILES && $_FILES['logFile']['error'] == UPLOAD_ERR_OK) {
        // Read the content of the uploaded log file
        $logContent = file_get_contents($_FILES['logFile']['tmp_name']);

        // Log file details
        echo "<h2>Log File Details</h2>";
        echo "<p>File Name: " . $_FILES['logFile']['name'] . "</p>";
        echo "<p>File Size: " . $_FILES['logFile']['size'] . " bytes</p>";
        echo "<hr>";

        // Log analysis
        echo "<h2>Log Analysis</h2>";

        // Extract IP addresses using regex
        preg_match_all('/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/', $logContent, $ipMatches);

        // Count occurrences of each IP address
        $ipCounts = array_count_values($ipMatches[0]);

        // Display IP address counts
        echo "<h3>IP Address Analysis</h3>";
        echo "<ul>";
        foreach ($ipCounts as $ip => $count) {
            echo "<li>$ip: $count occurrences</li>";
        }
        echo "</ul>";

        // Word frequency analysis (optional)
        // You can add this analysis if needed

        // Display graph (example using Google Charts)
        echo "<h3>IP Address Analysis - Graph</h3>";
        echo "<div id='chart_div' style='width: 100%; height: 400px;'></div>";

        // Display IP location (placeholder)
        echo "<h3>IP Location</h3>";
        echo "<div id='ip_location_map' style='width: 100%; height: 400px; border: 1px solid #ccc;'>IP location map placeholder</div>";

        // JavaScript for rendering Google Charts and IP location map (you'll need to implement this in script.js)
        echo "<script src='script.js'></script>";
    } else {
        // Error handling for file upload
        echo "<p>Error uploading file.</p>";
    }
    ?>

    <a href="index.php">Back</a>
</body>
</html>
