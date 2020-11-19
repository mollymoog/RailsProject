search: view, project/index
form_tag input #search

controller: project_controller
index params[:search_input]
search all project names.include(input)

prject model: class method: search all names

controller: with matching names

view: iterate @match_names
