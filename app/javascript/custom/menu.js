function addToggleListener(sel_id, mnu_id, toggle) {
  let element = document.querySelector(`#${sel_id}`);
  if(element === null){ return;}
  element.addEventListener('click', e => {
    e.preventDefault();
    let menu = document.querySelector(`#${mnu_id}`);
    if(menu == null){ return;}
    menu.classList.toggle(toggle);
  });
}

document.addEventListener('turbo:load', () => {
  addToggleListener('hamburger', 'navbar-menu', 'collapse');
  addToggleListener('account', 'dropdwon-menu', 'active');
});