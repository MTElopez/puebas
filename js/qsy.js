const origenJuegos = 'http://127.0.0.1:5000/api-pc/juegos';
const origenImagenes = 'http://127.0.0.1:5000/api-pc/imagen';

window.addEventListener('DOMContentLoaded', () => {
    console.log('Se cargó la página');

    Promise.all([
        cargarDatos(origenJuegos),
        cargarDatos(origenImagenes)
    ]).then(([juegos, imagenes]) => {
        mostrarDatos(juegos, imagenes);
    })
});

async function cargarDatos(url) {
    const respuesta = await fetch(url);
    return respuesta.json();
}

function mostrarDatos(juegos, imagenes) {
    let seccionJuegos = document.querySelector('.section2');

    juegos.forEach(juego => {
        let juegoDiv = document.createElement('div');
        
        // Crear título h2 para el nombre del juego
        let nombreJuego = document.createElement('h2');
        nombreJuego.textContent = juego.nombre;
        
        // Crear párrafo para la descripción del juego
        let descripcionJuego = document.createElement('p');
        descripcionJuego.textContent = juego.descripcion;
        
        // Encontrar la imagen correspondiente al juego
        let imagenJuego = imagenes.find(imagen => imagen.id_juego === juego.id);
        if (imagenJuego) {
            // Crear imagen
            let imagen = document.createElement('img');
            imagen.src = imagenJuego.url_imagen;
            imagen.alt = `Imagen del juego ${juego.id}`;
            
            // Añadir imagen al div del juego
            juegoDiv.appendChild(imagen);
        }
        
        // Añadir nombre y descripción al div del juego
        juegoDiv.appendChild(nombreJuego);
        juegoDiv.appendChild(descripcionJuego);

        // Añadir div del juego a la sección de juegos
        seccionJuegos.appendChild(juegoDiv);
    });
}
