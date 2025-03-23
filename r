<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>100m Run Simulator</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
        }
        .track-container {
            width: 100%;
            overflow: hidden;
        }
        .track {
            width: 100%; /* Full width of the browser */
            height: 80px;
            background: red;
            position: relative;
            overflow: hidden;
            margin-top: 20px;
            border: 2px solid black;
        }
        .runner {
            width: 50px;
            height: 50px;
            position: absolute;
            top: 15px;
            left: 0;
        }
        .lady-runner {
            width: 50px;
            height: 50px;
            position: absolute;
            top: 15px;
            left: 0;
        }
        .track-labels {
            width: 100%;
            display: flex;
            justify-content: space-between;
            margin-top: 5px;
            font-size: 18px;
            font-weight: bold;
        }
        .clock {
            font-size: 24px;
            font-weight: bold;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <h1>100m Run Simulator</h1>
    <button onclick="startRun()">Start Running</button>
    <div class="clock" id="clock">0.000s</div>
    <div class="track-container">
        <div class="track">
            <img src="https://via.placeholder.com/50" alt="Kalvitha" class="runner" id="runner">
        </div>
        <div class="track">
            <img src="https://via.placeholder.com/50" alt="World Champion" class="lady-runner" id="ladyRunner">
        </div>
    </div>
    <div class="track-labels">
        <span>0m</span>
        <span>100m</span>
    </div>
    <script>
        function startRun() {
            let runner = document.getElementById("runner");
            let ladyRunner = document.getElementById("ladyRunner");
            let clock = document.getElementById("clock");
            let kidDistance = 0;
            let ladyDistance = 0;
            let kidSpeed = 100 / 50; // Kalvitha takes 50 seconds for 100m
            let ladySpeed = 100 / 10; // World Champion takes 10 seconds for 100m
            let trackWidth = window.innerWidth - 100; // Adjust to fit screen width
            let scaleFactor = trackWidth / 100;
            let startTime = performance.now();
            
            let timerInterval = setInterval(() => {
                let elapsedTime = (performance.now() - startTime) / 1000;
                clock.innerText = elapsedTime.toFixed(3) + 's';
            }, 10);

            let interval = setInterval(() => {
                if (kidDistance >= 100 && ladyDistance >= 100) {
                    clearInterval(interval);
                    clearInterval(timerInterval);
                    alert("Both runners have finished!");
                } else {
                    if (kidDistance < 100) {
                        kidDistance += kidSpeed;
                        runner.style.left = (kidDistance * scaleFactor) + "px";
                    }
                    if (ladyDistance < 100) {
                        ladyDistance += ladySpeed;
                        ladyRunner.style.left = (ladyDistance * scaleFactor) + "px";
                    }
                }
            }, 1000); // Update every second to match real-time speeds
        }
    </script>
</body>
</html>
