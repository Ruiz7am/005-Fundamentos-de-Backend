SELECT posts.titulo, COUNT(*) num_etiquetas
FROM posts
  INNER JOIN posts_etiquetas ON posts.id = posts_etiquetas.post_id
  INNER JOIN etiquetas ON etiquetas.id = posts_etiquetas.etiqueta_id
GROUP BY post.id;