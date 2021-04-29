document.addEventListener("turbolinks:load", function() {
    let assets = document.querySelector('a-assets');
    let current_image_plane = document.querySelector('#current-image-plane');
    let images_data = document.querySelectorAll('.image-data');
    let images = []
    let current_image = -1
    let zoom = -1

    function add_asset(image_data) {
        let image = document.createElement('img');
        image.setAttribute('id', 'image-' + image_data.dataset.id);
        image.setAttribute('src', image_data.dataset.src);
        image.setAttribute('height', image_data.dataset.height);
        image.setAttribute('width', image_data.dataset.width);

        assets.appendChild(image)
        images[current_image] = image
    }

    function del_asset(i) {
        assets.removeChild(images[i]);
        images[i] = null
    }

    function update_current(image) {
        let width = 1
        let height = width/(image.width/image.height)

        current_image_plane.setAttribute('src', '#' + image.id);
        current_image_plane.setAttribute('height', height);
        current_image_plane.setAttribute('width', width);
        current_image_plane.setAttribute('material', 'width', image.width);
        current_image_plane.setAttribute('material', 'height', image.height);
    }

    function change_zoom(val) {
        zoom += val
        current_image_plane.object3D.position.set(0, 0, zoom);
    }

    function next_image() {
        if (current_image === images.length) {
            return
        }
        current_image += 1
        add_asset(images_data[current_image])
        update_current(images[current_image])
        del_asset(current_image - 1)
    }

    function prev_image() {
        if (current_image === 0) {
            return
        }
        current_image -= 1
        add_asset(images_data[current_image])
        update_current(images[current_image])
        del_asset(current_image + 1)
    }

    next_image()

    document.addEventListener('triggerdown', function (evt) { next_image() });
    document.addEventListener('gripdown', function (evt) { prev_image() });
    document.addEventListener('abuttondown', function (evt) { change_zoom(0.01) });
    document.addEventListener('bbuttondown', function (evt) { change_zoom(-0.01) });
});
