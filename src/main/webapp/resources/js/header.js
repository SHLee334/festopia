// 검색 애니메이션
/*=============== SEARCH BAR JS ===============*/


window.addEventListener("DOMContentLoaded", (event) => {

    const toggleSearch = (search, button) =>{

        const searchBar = document.getElementById(search),
              searchButton = document.getElementById(button)
    
        searchButton.addEventListener('click', () =>{
            searchBar.classList.toggle('show-search')
        })
     }
  
     toggleSearch('search-bar', 'search-button')

    });
