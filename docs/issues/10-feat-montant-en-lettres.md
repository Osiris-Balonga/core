---
title: "feat(money): money.toWords(), montant en lettres en français"
labels: js, python, fixtures, enhancement, niveau: avance
milestone: v0.2
---
## Contexte

Factures, reçus, chèques et contrats exigent le montant en lettres. Les règles d'accord du français sont piégeuses, et la plupart des implémentations qui circulent se trompent sur `quatre-vingts`, `cents` et `de francs`.

La spécification est **déjà écrite** : `fixtures/money/to-words.json` (31 cas, statut `pending`). Votre travail consiste à la faire passer.

## Règles à respecter (orthographe traditionnelle, par défaut)

- `vingt` et `cent` prennent un **s** quand ils sont multipliés et terminent le nombre : `quatre-vingts`, `deux cents` ; mais `quatre-vingt-un`, `deux cent un`, et devant `mille` : `quatre-vingt mille`, `deux cent mille`.
- `mille` est invariable et ne prend jamais `un` devant.
- `million` et `milliard` sont des noms : ils s'accordent (`deux millions`) et appellent `de` quand le montant est rond (`un million de francs CFA`).
- Trait d'union entre dizaines et unités sous cent, sauf avec `et` : `vingt et un`, `soixante et onze`.
- Option `orthographe: '1990'` : traits d'union entre tous les numéraux (`cent-vingt-cinq-mille`).
- Singulier `franc` pour 0 et 1.

## À faire

1. Implémenter `toWords` dans `packages/js/src/money.ts` et `to_words` dans `money.py`.
2. Passer `fixtures/money/to-words.json` en `"status": "active"`.
3. Ajouter vos propres cas limites (999 999, 1 000 001, 100 000 000…).

## Critères d'acceptation

- [ ] 31 fixtures existantes vertes dans les deux langages, plus au moins 5 nouvelles
- [ ] Aucune table de 1 000 entrées en dur : l'algorithme doit composer les règles
- [ ] Relecture par une personne attentive à l'orthographe (pas forcément développeuse)

Conseil : découpez en fonctions `< 100`, `< 1000`, puis groupes de trois chiffres.
