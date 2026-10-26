---
title: "ci: vérifier automatiquement que JS et Python exposent la même API"
labels: ci, js, python, niveau: avance
milestone: v0.1
---
## Contexte

La règle « même API dans les deux langages » n'est aujourd'hui vérifiée qu'à la relecture. Une fonction ajoutée d'un seul côté passe la CI si aucune fixture ne l'appelle.

## À faire

Écrire `scripts/check-api-parity.mjs` qui :

1. liste les fonctions exportées par chaque module du paquet JS compilé (`phone`, `money`, `geo`, `text`) ;
2. liste les fonctions publiques de chaque module Python (sans `_`), via un petit script Python appelé depuis Node ou un fichier JSON produit par Python ;
3. compare en convertissant `camelCase` ↔ `snake_case` ;
4. échoue en listant précisément les écarts.

L'ajouter à `npm run check` et à la CI.

## Critères d'acceptation

- [ ] Le script échoue si on supprime une fonction d'un seul côté (démontré dans la PR)
- [ ] Une liste d'exceptions explicite est possible, avec justification obligatoire
- [ ] Documenté dans `docs/architecture.md`
