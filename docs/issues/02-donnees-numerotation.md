---
title: "data(phone): confirmer le plan de numérotation +242 avec une source officielle"
labels: data, besoin-source, niveau: accessible
milestone: v0.1
---
## Contexte

`data/phone/numerotation.json` contient des valeurs de démarrage marquées `a_verifier` : longueur nationale de 9 chiffres, préfixes `06` (MTN) et `05` (Airtel). Elles ont permis d'écrire le code, mais rien ne prouve qu'elles sont exactes ni complètes. Tant que la liste est incomplète, `phone.parse` rejette des numéros valides (`unknown_prefix`).

## À faire

1. Trouver le plan de numérotation national publié par l'autorité de régulation des communications électroniques (ARPCE), ou une décision d'attribution des préfixes.
2. Confirmer ou corriger : longueur du numéro national, groupement d'affichage (`nationalGrouping`), chaque préfixe mobile et son opérateur.
3. Ajouter les préfixes manquants : autres préfixes mobiles éventuels, numéros fixes (`"type": "fixe"`), numéros spéciaux si documentés.
4. Passer chaque entrée confirmée en `verifie`. Mettre à jour les fixtures si une valeur change.

## Critères d'acceptation

- [ ] Plus aucune entrée `a_verifier` dans ce fichier, ou une explication écrite pour celles qui restent
- [ ] Fixtures `phone/*` mises à jour si besoin, `npm run check` vert
- [ ] Aucun vrai numéro de personne dans les fixtures : utiliser des suites fictives (`123 45 67`)

## Attention

Un opérateur peut avoir changé de nom ou fusionné. Dans ce cas, `operator` porte le nom commercial **actuel** et `note` explique l'historique.
