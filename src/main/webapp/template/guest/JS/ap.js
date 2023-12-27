var imgfeature = document.querySelector('.img-feature')
var listimg = document.querySelectorAll('.list-image img')
var prevbtn = document.querySelector('.prev')
var nextbtn = document.querySelector('.next')

var currentindex = 0;

function updateimageindex(index) {
    document.querySelectorAll('.list-image div').forEach(item => {
        item.classList.remove('active')
    })
    currentindex = index
    imgfeature.src = listimg[index].getAttribute('src')
    listimg[index].parentElement.classList.add('active')
}

listimg.forEach((imgElement, index) => {
    imgElement.addEventListener('click', e => {
        imgfeature.style.opacity = '0'
        setTimeout(() => {
            updateimageindex(index)
            imgfeature.style.opacity = '1'
        }, 400)

    })
})

prevbtn.addEventListener('click', e => {
    if (currentindex == 0) {
        currentindex = listimg.length - 1
    } else {
        currentindex--;
    }
    imgfeature.style.opacity = '0'
    setTimeout(() => {
        updateimageindex(currentindex)
        imgfeature.style.opacity = '1'
    }, 400)
})
nextbtn.addEventListener('click', e => {
    if (currentindex == listimg.length - 1) {
        currentindex = 0
    } else {
        currentindex++;
    }
    imgfeature.style.opacity = '0'
    setTimeout(() => {
        updateimageindex(currentindex)
        imgfeature.style.opacity = '1'
    }, 400)
})