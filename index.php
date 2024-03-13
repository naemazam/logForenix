<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Log Analyzer</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h1>Log Analyzer</h1>
    <form action="analyze.php" method="post" enctype="multipart/form-data">
        <label for="logFile">Upload Apache Access Log File:</label>
        <input type="file" id="logFile" name="logFile" accept=".log" required>
        <button type="submit">Analyze</button>
    </form>
    <div id="chartContainer" style="height: 370px; width: 100%;"></div>
    <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>
