---
title: "data(geo): commune et arrondissements de Brazzaville, avec variantes"
labels: data, besoin-source, niveau: accessible
milestone: v0.2
---
## Contexte

Les formulaires d'adresse à Brazzaville ont besoin de la liste des arrondissements, et le nettoyage de données a besoin des variantes réellement saisies.

## À faire

1. Ajouter la commune de Brazzaville dans `data/geo/communes.json` (dépend de l'issue sur les départements).
2. Ajouter ses arrondissements dans `data/geo/arrondissements.json` : `nom` officiel, `numero`, `commune`, `verification`.
3. Collecter les **variantes réelles** dans `aliases` : abréviations, numéros seuls (« 4e arrondissement »), orthographes sans tiret ni accent. Sources possibles pour les variantes : formulaires anonymisés, annonces, enquêtes. Les variantes n'exigent pas de source officielle, le nom officiel si.
4. Activer `fixtures/geo/find.json` (passer `status` à `active`) en adaptant les cas.

## Critères d'acceptation

- [ ] Chaque arrondissement est sourcé et `verifie`
- [ ] Au moins 2 variantes par arrondissement
- [ ] `npm run check` vert, fixtures `geo/find` actives
