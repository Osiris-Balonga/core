---
title: "feat(geo): recherche tolérante aux fautes de frappe"
labels: js, python, fixtures, enhancement, niveau: avance
milestone: v0.3
---
## Contexte

`geo.find` ne reconnaît que des correspondances exactes après normalisation. Les saisies réelles contiennent des fautes (« Brazaville », « Pointe Noir », « Talangai »).

## À faire

1. Proposer l'approche dans l'issue **avant** de coder : distance de Levenshtein bornée, n-grammes, phonétique adaptée aux noms locaux… Comparez au moins deux options.
2. Signature proposée : `geo.find(name, { fuzzy: true, maxDistance?: number })`, résultat enrichi d'un `score` entre 0 et 1.
3. Constituer `fixtures/geo/find-fuzzy.json` à partir d'au moins 30 saisies réelles **anonymisées** (formulaires, enquêtes).
4. Implémenter en JS et Python, sans dépendance externe.

## Critères d'acceptation

- [ ] Au moins 95 % du jeu de saisies réelles reconnu correctement
- [ ] Aucun faux positif sur une liste de noms hors Congo fournie dans les fixtures
- [ ] Performance : moins de 5 ms par recherche sur l'ensemble des données (mesure jointe à la PR)
