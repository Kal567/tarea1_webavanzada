<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>CRUD - List</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<script src="https://example.com/example-framework.js"
        integrity="sha384-oqVuAfXRKap7fdgcCY5uykM6+R9GqQ8K/uxy9rx7HNQlGYl1kPzQho1wx4JwY8wC"
        crossorigin="anonymous"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js" type="text/javascript"></script>
<div>
  <a href="/home" class="btn btn-link btn-outline-primary"style="margin-top:20px; margin-bottom:20px">Home</a>
  <a href="/registrar-estudiante/" class="btn btn-link btn-outline-primary">Student registry</a>
</div>

<table class="table">
  <thead>
  <tr>
    <th scope="col">ID</th>
    <th scope="col">Matricula</th>
    <th scope="col">Nombre</th>
    <th scope="col">Apellido</th>
  </tr>
  </thead>
  <tbody>
  <#if student?size != 0>
  <#list student as stu>
  <tr>
    <td>${stu.id}</td>
    <td>${stu.matricula}</td>
    <td>${stu.nombre}</td>
    <td>${stu.apellido}</td>
    <th>
      <div class="modal fade" id="modalLoginForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
           aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <form method="post" action="/update-estudiante/${stu.id}">
              <div class="modal-header text-center">
                <h4 class="modal-title w-100 font-weight-bold">Edit - STUDENT</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" >
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body mx-3">
                <div class="form-group">
                  <label for="ident">ID:</label>
                  <input name="identification" type="text" class="form-control" id="ident" disabled>
                </div>
                <div class="form-group">
                  <label for="mat">Matricula</label>
                  <input name="matricula" type="text" class="form-control" id="mat">
                </div>
                <div class="form-group">
                  <label for="nombre">First Name</label>
                  <input name="nombre" type="text" class="form-control" id="nombre">
                </div>
                <div class="form-group">
                  <label for="apellido">Last Name</label>
                  <input name="apellido" type="text" class="form-control" id="apellido">
                </div>
              </div>
              <div class="modal-footer d-flex justify-content-center">
                <button type="submit" class="btn btn-default">Edit</button>
              </div>
            </form>
          </div>
        </div>
      </div>
      <div class="text-center">
        <button id-stu="${stu.id}" mat="${stu.matricula}" nombre="${stu.nombre}" apellido="${stu.apellido}" id="edit" class="btn btn-block btn-secondary" data-toggle="modal" data-target="#modalLoginForm">Edit</button>
      </div>
    </th>
    <th>
      <form method="post" action="/delete-estudiante/${stu.id}">
        <button type="submit" class="btn btn-block btn-danger">Delete</button>
      </form>
    </th>
  </tr>
  </#list>
</#if>
</tbody>
</table>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<script type="text/javascript">
    $(document).ready(function(){
        var id;
        var action;
        $('.table').on('click', 'button#edit', function(){
            id = $(this).attr('id');
            $(".modal-title").text('Edit student');
            accion = "/update-student/"+id;
            var id = $(this).attr('id-stu');
            var matricula = $(this).attr('mat');
            var nombre = $(this).attr('nombre');
            var apellido = $(this).attr('apellido');
            $("#ident").attr('value', id);
            $("#mat").attr('value', matricula);
            $("#nombre").attr('value', nombre);
            $("#apellido").attr('value', apellido);
            $("#ident").prop('required',false);
            $("#mat").prop('required',false);
            $("#name").prop('required',false);
            $("#lastname").prop('required',false);
        });
    });
</script>

</body>
</html>