package helper

import (
	"html/template"
	"net/http"
)

func RenderTemplate(w http.ResponseWriter, s string, Data interface{}) error {
	page, err := template.ParseFiles("view/" + s + ".html")
	if err != nil {
		return err
	}

	return page.Execute(w, Data)
}
func RenderTemplateWithLoyout(w http.ResponseWriter, s string, layout string, Data interface{}) error {
	page, err := template.ParseFiles("view/layout/header.layout.tmpl","view/layout/logAndRegister.layout.tmpl", "view/layout/footer.layout.tmpl", "view/"+s+".html")
	if err != nil {
		return err
	}

	return page.ExecuteTemplate(w, layout , Data)
}
