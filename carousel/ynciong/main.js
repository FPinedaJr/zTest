// Jump to line 53
const carousel = document.querySelector('.carousel')
const prevButton = carousel.querySelector('.prev-button')
const nextButton = carousel.querySelector('.next-button')

const contents = carousel.querySelector('.carousel__contents')
const dotsContainer = carousel.querySelector('.carousel__dots')

prevButton.addEventListener('click', e => {
    const currentSlide = contents.querySelector('.is-selected')
    const prevSlide = currentSlide.previousElementSibling
    const currentDot = dotsContainer.querySelector('.is-selected')
    const prevDot = currentDot.previousElementSibling
    const destination = getComputedStyle(prevSlide).left
    
    contents.style.left = '-' + destination

    currentSlide.classList.remove('is-selected')
    prevSlide.classList.add('is-selected')
    currentDot.classList.remove('is-selected')
    prevDot.classList.add('is-selected')

    if (!prevSlide.previousElementSibling) {
        prevButton.setAttribute('hidden', true)
    }

    nextButton.removeAttribute('hidden')
})

nextButton.addEventListener('click', e => {
    const currentSlide = contents.querySelector('.is-selected')
    const nextSlide = currentSlide.nextElementSibling
    const currentDot = dotsContainer.querySelector('.is-selected')
    const nextDot = currentDot.nextElementSibling
    const destination = getComputedStyle(nextSlide).left

    contents.style.left = '-' + destination

    currentSlide.classList.remove('is-selected')
    nextSlide.classList.add('is-selected')
    currentDot.classList.remove('is-selected')
    nextDot.classList.add('is-selected')

    // Hide the next button if last slide
    if (!nextSlide.nextElementSibling) {
        nextButton.setAttribute('hidden', true)
    }

    prevButton.removeAttribute('hidden')
})


// Using Event Delegation
const dots = Array.from(carousel.querySelectorAll('.carousel__dot'))
console.log(dots)
const slides = Array.from(carousel.querySelectorAll('.carousel__slide'))

dotsContainer.addEventListener('click', e => {
    const dot = e.target.closest('.carousel__dot')

    if (dot) {
        let clickedDotIndex 
        
        for (let index = 0; index < dots.length; index++) {
            if (dots[index] === dot) {
                clickedDotIndex = index
            }
        }

        const slideToShow = slides[clickedDotIndex]
        const destination = getComputedStyle(slideToShow).left

        contents.style.left = '-' + destination

        const currentSlide = contents.querySelector('.is-selected')

        currentSlide.classList.remove('is-selected')
        slideToShow.classList.add('is-selected')

        if (!slideToShow.nextElementSibling) {
            nextButton.setAttribute('hidden', true)
            prevButton.removeAttribute('hidden')
        } else if (!slideToShow.previousElementSibling) {
            prevButton.setAttribute('hidden', true)
            nextButton.removeAttribute('hidden')
        } else {
            prevButton.removeAttribute('hidden')
            nextButton.removeAttribute('hidden')
        } 

        dots.forEach(dot => {
            dot.classList.remove('is-selected')
        })

        dot.classList.add('is-selected')
    }
})

const slideWidth = slides[0].getBoundingClientRect().width

slides.forEach((slide, index) => {
    slide.style.left = slideWidth * index + 'px'
})