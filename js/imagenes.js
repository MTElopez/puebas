const origen1 = 'http://127.0.0.1:5000/api-pc/imagen';


window.addEventListener('DOMContentLoaded', () => {
    console.log('Se cargó la página');
    cargarDatos(origen1)
        .then(datos => mostrarImagenes(datos));
});

async function cargarDatos(url) {
    const respuesta = await fetch(url);
    return respuesta.json();
}

function mostrarImagenes(datos) {
    let seccion = document.querySelector('.section1');
    datos.forEach(d => {
        let bloque = document.createElement('div');
        let imagen = document.createElement('img');
        imagen.src = d.url_imagen;
        imagen.alt = `Imagen del juego ${d.id_juego}`;
        seccion.appendChild(imagen);
    });
    bloque.appendChild()
}




// const origen1= 'http://127.0.0.1:5000/api-imagen'


// window.addEventListener('DOMContentLoaded', evento =>{
//     console.log('se cargó la página');
//     cargarDatos(origen1)
//     evento.preventDefault();
// });


// async function cargarDatos(url) {
//     let datos = await fetch(url)
//                          .then(respuesta => respuesta.json())   
//                          .then(datos => datos);

//     console.log(datos);
//     let seccion = document.querySelector('#section1')  
//     for (d of datos) {        
//         let logo = document.createElement('img');  
//         logo.src = d.url_img;
//         // logo.appendChild(logo);
//     }
//     seccion.appendChild(logo);
// };


// Carga de los datos externos
// const cargarDatos = function() {
//     let contenido = document.querySelector('.articulos');
//     fetch('http://127.0.0.1:5000/api-imagen')
//         .then(respuesta => respuesta.json())
//         .then(datos => cargar(contenido, datos));
// }

// // Modificación del HTML
// function cargar(contenido, datos) {
//     for (let d of datos) {
//         let curso = document.createElement('article');
//         let nombre = document.createElement('h3');
//         nombre.className = "bold";
//         nombre.innerHTML = d.tema;
//         let imagenes = document.createElement('div');
//         imagenes.className = 'contImg'
//         for (let i of d.imagenes ) {
//             let logo = document.createElement("img");
//             logo.src = i.url_img;
//             logo.alt = i.texto_alt
//             logo.className = 'imgCurso';
//             imagenes.appendChild(logo);
//         }
//         let masInfo = document.createElement('button');
//         masInfo.className = "color4";
//         masInfo.innerHTML= "Más información"
//         curso.append(nombre, imagenes, masInfo);
//         contenido.appendChild(curso);
//     }
// }
