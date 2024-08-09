# Tarea #4 y 5 - (8%)
_Fecha de entrega Viernes 9 de Agosto_

Investigacion acerca de Identity, login y seguridad. Esta tarea consta de 2 partes:

## Parte 1:
> Se han agregado tres archivos `database.sql` que contiene al script de generacion de la bd, `entity_framework.sh` que contiene los scripts de instalacion de EF y `README.md` que contiene las instrucciones.

### Instrucciones

> Debe entregar un pdf con la respuesta a las siguientes preguntas y mostrando el codigo implementado asy como intentar implementar el codigo en el proyecto y entregarlo con los cambios.

El codigo se ha creado para Autenticar el usuario `SecurityRepository` este valida si el usuario existe contra la base de datos. Para ver este paso funcionando debera implementar la nueva version de la base de datos. Sin embargo se dara cuenta de que cuando se loguea y se valida el usuario como el controller de Home tiene el filtro implementado:  `[ServiceFilter(typeof(CustomAuthorizationFilter))]` este redirecciona siempre a la pagina de login.

    - Se puede hacer algo para evitar que se redireccione a login sin quitar el filtro?
    - Existe alguna forma de notificar o validar si el usuario esta logueado o autenticado?
    - Como esto correria todas las veces, lo que significa que haria una peticion a la BD cada vez que accesa algun controller que tiene ese filtro implementado existe alguna forma mas eficiente?
    - Se puede utilizar la memoria en sesion para mantener el usuario?
    - Si lo mantiene en la sesion que peligros habria, o no habrian peligros?
    
## Parte 2 (4%)
> Utilizando el proyecto proporcionado por el profesor `APS`

### Instrucciones 
> Esta segunda parte consta de la implementacion de la libreria Identity de Microsoft que permitira agregar seguridad y manejarlo en sesion de manera segura.

1. Habra el libro gratuito [El Pequeño Libro De ASP NET Core](https://github.com/wkrea/little-aspnetcore-book-ES/blob/spanish/ElPeque%C3%B1oLibroDeASPNETCore.pdf) en la pagina 81 e implemente el identity de acuerdo a los pasos.
- Puede revisar otras fuentes para apoyar su implementacion:
    - [Security & Identity](https://github.com/wkrea/little-aspnetcore-book-ES/tree/spanish/chapters/6.security-and-identity)
    - [Authentication & Identity](https://learn.microsoft.com/en-us/aspnet/core/security/authentication/identity?view=aspnetcore-8.0&tabs=visual-studio)
    - [Create registration and login](https://www.c-sharpcorner.com/article/create-registration-and-login-functionality-in-asp-net-core-using-identity/)
    - [User Registration and Login](https://sajadshafi.com/blog/dotnet-webapi-user-registration-login)
2. Debe implementar una seccion para registrar el usuario y luego para el ingreso de la aplicacion (login)
3. No existe receta magica o exacta la manera como lo logre implementar siempre y cuando se registre (creando el usuario en la base de datos) y se loguee es valido para el puntaje








