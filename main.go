package main

import (
	"fmt"
	"forum/helper"
	"net/http"

	"github.com/gofrs/uuid"
)

var u1 = uuid.Must(uuid.NewV4())

func main() {
	fmt.Println(u1)

	http.Handle("/view/", http.StripPrefix("/view/", http.FileServer(http.Dir("view"))))

	http.HandleFunc("/", Index)

	fmt.Println("Listening in http://localhost:3000/")

	http.ListenAndServe(":3000", nil)
}

func Index(w http.ResponseWriter, r *http.Request) {

	err := helper.RenderTemplateWithLoyout(w, "pages/comment","layout", nil)
	if err != nil {

		fmt.Println(err)
		return
	}

}
