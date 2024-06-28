const origen= 'http://127.0.0.1:5000/api-pc/juegos'


window.addEventListener('DOMContentLoaded', evento =>{
    console.log('se cargó la página');
    cargarDatos(origen)
    evento.preventDefault();
});


async function cargarDatos(url) {
    let datos = await fetch(url)
                         .then(respuesta => respuesta.json())   
                         .then(datos => datos);

    console.log(datos);
    let seccion = document.querySelector('.section2')
    let lista = document.createElement('div');
    for (d of datos) {
        let item = document.createElement('p');
        let texto = `${d.id}, ${d.id_consola}, ${d.nombre}, ${d.descripcion}`;
        item.innerHTML = texto
        lista.appendChild(item);
    }
    seccion.appendChild(lista);
};

