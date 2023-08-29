modal_form_btn=document.getElementById("show-modal")
modal_form=document.getElementById("modal-f")
modal_close=document.getElementById("close_modal")

modal_form_btn.addEventListener("click", () => {
    console.log("here")
    modal_form.style.display = "flex"
}, false)


modal_close.addEventListener("click", () => {
    console.log("close")
    modal_form.style.display = "none"
})

// document.addEventListener("click", () => {
//     if (modal_form){
//         console.log("close")
//         modal_form.style.display = "none"
//     }
// })