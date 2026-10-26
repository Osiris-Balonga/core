---
title: "data(geo): commune et arrondissements de Pointe-Noire, avec variantes"
labels: data, besoin-source, niveau: accessible
milestone: v0.2
---
## Contexte

Même travail que pour Brazzaville, pour la deuxième ville du pays. Attention : « Pointe-Noire » désigne à la fois un département et une commune. Vérifiez que `geo.findAll('Pointe-Noire')` renvoie bien les deux, chacun avec son `level`.

## À faire

1. Commune de Pointe-Noire dans `communes.json`, arrondissements dans `arrondissements.json`.
2. Variantes usuelles (« Pte-Noire », « PNR »… à relever dans des saisies réelles).
3. Ajouter un cas de fixture `geo.find` avec l'option `level` pour lever l'ambiguïté département / commune.

## Critères d'acceptation

- [ ] Entrées sourcées et `verifie`
- [ ] Cas d'ambiguïté couvert par une fixture
- [ ] `npm run check` vert
