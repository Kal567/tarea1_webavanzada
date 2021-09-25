<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>CRUD - Insert</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        *{ margin-left:5%
        }
    </style>
</head>
<body>
<div>
    <a href="/listado-estudiantes" class="btn btn-link btn-outline-primary">Listado estudiantes</a>
</div>
<form action = "/registrar-estudiante" method="post">
    <div class="form-row">
        <div class="form-group col-md-6">
            <label for="id">ID</label>
            <input name="id" type="number" class="form-control" id="id" placeholder="1">
        </div>
        <div class="form-group col-md-6">
            <label for="matricula">Matrícula</label>
            <input name="matricula" type="text" class="form-control" id="matricula" placeholder="20101314">
        </div>
        <div class="form-group col-md-6">
            <label for="nombre">Nombre</label>
            <input name="nombre" type="text" class="form-control" id="nombre" placeholder="William">
        </div>
        <div class="form-group col-md-6">
            <label for="apellido">Apellido</label>
            <input name="apellido" type="text" class="form-control" id="apellido" placeholder="Diaz">
        </div>
        <div class="form-group col-md-6">
            <label for="telefono">Teléfono</label>
            <input name="telefono" type="text" class="form-control" id="telefono" placeholder="8096543210">
        </div>
    </div>
    <button type="submit" class="btn btn-primary" style="margin-left: 50px">Registrar</button>
</form>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>
</html>