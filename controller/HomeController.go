package handler

import (
	"fmt"
	"forum/helper"
	"net/http"
)

func Index(w http.ResponseWriter, r *http.Request) {

	err := helper.RenderTemplate(w, "pages/home", nil)
	if err != nil {

		fmt.Println(err)
		return
	}

}
