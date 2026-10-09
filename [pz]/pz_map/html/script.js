

$(document).ready(function () {
    const canvas = document.getElementById('mapCanvas');
    const ctx = canvas.getContext('2d');
    let drawing = false;
    let currentStroke = [];
    let strokes = []; // Array para armazenar os traços desenhados

    // Ajusta o canvas para o tamanho do container
    canvas.width = $('.map-container').width();
    canvas.height = $('.map-container').height();

    let color = $('#colorPicker').val();
    let thickness = $('#thicknessPicker').val();

    // Para armazenar waypoints
    let waypoints = [];
    $('#waypointText').on( "keyup", function () {
        const waypointText = $('#waypointText').val();
        if (waypointText !== '') {
            $('#addWaypointBtn').show()
            $('#addWaypointBtn').attr('disabled', false);
        }else{
            $('#addWaypointBtn').hide()
            $('#addWaypointBtn').attr('disabled', true);
        }
    })

    $('#addWaypointBtn').click(function () {
        const waypointText = $('#waypointText').val();
        if (waypointText) {
            $('#mapCanvas').one('click', function (e) {
                const pos = getMousePos(e);
                waypoints.push({ x: pos.x, y: pos.y, text: waypointText });
                drawWaypoints();
                $('#waypointText').val('');
                $('#addWaypointBtn').hide();
            });
        }
    });

    function drawWaypoints() {
        waypoints.forEach(waypoint => {
            drawWaypoint(waypoint);
        });
    }

    function drawWaypoint(waypoint) {
        ctx.fillStyle = "#ff0000"; // Cor do pin no mapa
        ctx.beginPath();
        ctx.arc(waypoint.x, waypoint.y, 5, 0, 2 * Math.PI);
        ctx.fill();
        ctx.fillStyle = "#ffffff"; // Cor do texto
        ctx.fillText(waypoint.text, waypoint.x + 10, waypoint.y);
    }


    $('#colorPicker').change(function () {
        color = $(this).val();
    });

    $('#thicknessPicker').change(function () {
        thickness = $(this).val();
    });

    // Eventos de mouse para desenhar
    $('#mapCanvas').mousedown(function (e) {
        drawing = true;
        currentStroke = [];
        const pos = getMousePos(e);
        currentStroke.push({ x: pos.x, y: pos.y, color: color, thickness: thickness });
    });

    $('#mapCanvas').mousemove(function (e) {
        if (drawing) {
            const pos = getMousePos(e);
            currentStroke.push({ x: pos.x, y: pos.y, color: color, thickness: thickness });
            drawStroke(currentStroke);
        }
    });

    $('#mapCanvas').mouseup(function (e) {
        if (drawing) {
            drawing = false;
            strokes.push(currentStroke);
        }
    });

    $('#mapCanvas').mouseleave(function (e) {
        if (drawing) {
            drawing = false;
            strokes.push(currentStroke);
        }
    });

    function getMousePos(e) {
        const rect = canvas.getBoundingClientRect();
        return {
            x: e.clientX - rect.left,
            y: e.clientY - rect.top
        };
    }

    function drawStroke(stroke) {
        ctx.clearRect(0, 0, canvas.width, canvas.height);
        redrawAllStrokes();
    }

    function redrawAllStrokes() {
        for (let stroke of strokes) {
            drawSingleStroke(stroke);
        }
        if (drawing) {
            drawSingleStroke(currentStroke);
        }
        drawWaypoints();
    }

    function drawSingleStroke(stroke) {
        if (stroke.length < 2) return;
        ctx.beginPath();
        ctx.moveTo(stroke[0].x, stroke[0].y);
        for (let i = 1; i < stroke.length; i++) {
            ctx.lineTo(stroke[i].x, stroke[i].y);
        }
        ctx.strokeStyle = stroke[stroke.length - 1].color;
        ctx.lineWidth = stroke[stroke.length - 1].thickness;
        ctx.stroke();
    }

    const mapSelector = document.getElementById('mapSelector');
    const mapBackground = document.getElementById('mapBackground');
    let selectedMap = '';

    // Recebe mensagens do Lua (NUI)
    window.addEventListener('message', function (event) {
        const data = event.data;
        if (data.action === 'open') {
            $('#addWaypointBtn').hide();
            $("#mainContainer").css("display", "flex").hide().fadeIn();

            // $('#mapBackground').attr('src', data.mapImage);
            if ($('#mapSelector').children().length === 0) {
                data.mapList.forEach(map => {
                    const option = document.createElement('option');
                    option.value = map.path;
                    option.textContent = map.name;
                    mapSelector.appendChild(option);
                });
                if (data.mapList.length > 0) {
                    mapBackground.src = data.mapList[0].path;
                }
            }
        }
        if (data.action === 'loadDrawing') {
            const map = data.mapList.find(obj => obj.name === data.mapType);
            console.log(JSON.stringify(map))
            $('#mapBackground').attr('src', map.path);
            $("#mapSelector").val(map.path);
            if (data.drawingData) {
                const drawingData = JSON.parse(data.drawingData);
                strokes = drawingData.strokes || [];
                waypoints = drawingData.waypoints || [];
                ctx.clearRect(0, 0, canvas.width, canvas.height);
                redrawAllStrokes();
            }
        }
    });

    // Ações dos botões
    $('#mapSelector').change(function (data) {
        var optionSelected = $(this).find("option:selected");
        $('#mapBackground').attr('src', optionSelected.val());
        selectedMap = optionSelected.text();
    });

    // Ações dos botões
    $('#saveBtn').click(function () {
        const drawingData = {
            strokes: strokes,
            waypoints: waypoints
        };
        $.post('https://' + GetParentResourceName() + '/saveDrawing', JSON.stringify({ drawingData: JSON.stringify(drawingData), mapType: selectedMap }), function () {
            $("#mainContainer").fadeOut();
        });
    });

    $('#closeBtn').click(function () {
        $.post('https://' + GetParentResourceName() + '/closeMap', JSON.stringify({}), function () {
            $("#mainContainer").fadeOut();
        });
    });

    $('#replicateBtn').click(function () {
        $.post('https://' + GetParentResourceName() + '/replicateMap', JSON.stringify({}));
    });

    // Fechar interface ao pressionar ESC
    $(document).keyup(function (e) {
        if (e.key === "Escape") {
            $.post('https://' + GetParentResourceName() + '/closeMap', JSON.stringify({}), function () {
                $("#mainContainer").fadeOut();
            });
        }
    });
});
