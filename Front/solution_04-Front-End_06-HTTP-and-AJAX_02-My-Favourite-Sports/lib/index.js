// TODO: write your code here!
const sports = document.querySelectorAll('.clickable');

const toggleActiveClass = (event) => {
  event.currentTarget.classList.toggle('active');
};

const toggleActiveOnClick = (sport) => {
  sport.addEventListener('click', toggleActiveClass);
};

sports.forEach(toggleActiveOnClick);
