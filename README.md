### Titre du projet  
**DevinciLostFound – Plateforme intelligente de gestion des objets perdus et trouvés**

---

### Description du projet  

**DevinciLostFound** est une application multiplateforme (Web, Android, iOS) destinée aux étudiants et au personnel de l’école Léonard de Vinci à Paris, permettant de signaler un objet trouvé ou de rechercher un objet perdu.  

Lorsqu’un utilisateur trouve un objet, il peut :  
- téléverser une photo,  
- ajouter une description et le lieu de découverte,  
- et publier sans avoir besoin de se connecter.  

L’image est automatiquement floutée par une IA afin de cacher l’objet, puis une modération automatique vérifie que le contenu n’est pas inapproprié.  

Quand une personne recherche un objet perdu, elle peut :  
- saisir des mots-clés (titre, type d’objet, couleur, etc.) pour le retrouver,  
- proposer une description précise de l’objet,  
- et si sa description correspond à celle du déposant (vérifiée par IA), l’image originale se défloute et les coordonnées du trouveur deviennent visibles.  

La plateforme repose sur un **backend Java Spring Boot** relié à une **base PostgreSQL**, une **interface React**, et des **outils IA open source** (*Ollama*, *Whisper*, *OpenCV*).  

Ce projet favorise la **collaboration**, la **responsabilité** et la **sécurité** au sein de la communauté étudiante.
