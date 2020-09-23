function pullDown() {

  const pullDownButton = document.getElementById("fitness")
  const pullDownParents = document.getElementById("pull-down")
  const pullDownChild = document.querySelectorAll(".pull-down-list")

  pullDownButton.addEventListener('mouseover', function(){
    pullDownButton.setAttribute("style", "color:gray;")
  })

  pullDownButton.addEventListener('mouseout', function(){
    pullDownButton.removeAttribute("style", "color:gray;")
  })

  pullDownButton.addEventListener('click', function(){
    if (pullDownParents.getAttribute("style") == "display:block;") {
      pullDownParents.removeAttribute("style", "display:block;")
    } else {
      pullDownParents.setAttribute("style", "display:block;")
    }
  })
  pullDownChild.forEach(function(list) {
    list.addEventListener('mouseover', function() {
        list.setAttribute("style", "color:gray;")
    })
    list.addEventListener('mouseout', function() {
      list.removeAttribute("style", "color:gray;")
    })
  })
}
window.addEventListener('load', pullDown)