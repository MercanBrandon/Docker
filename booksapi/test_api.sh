curl 127.0.0.1:5000/books | json_pp \
&& echo 'Recherche du livre Android in Action, Second Edition' \
&& curl 127.0.0.1:5000/book/1935182722 | json_pp