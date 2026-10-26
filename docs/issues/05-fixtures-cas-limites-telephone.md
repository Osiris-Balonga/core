---
title: "test(fixtures): cas limites de saisie des numéros (Unicode, copier-coller)"
labels: fixtures, js, python, good first issue, niveau: intermediaire
milestone: v0.1
---
## Contexte

Les vraies saisies viennent de copier-coller (WhatsApp, PDF, tableurs). Elles contiennent des caractères invisibles que les fixtures actuelles ne couvrent pas.

## À faire

Ajouter dans `fixtures/phone/parse.json` des cas pour :

- espace insécable (U+00A0) et espace fine insécable (U+202F) entre les groupes ;
- tiret cadratin ou demi-cadratin (`–`, `—`) comme séparateur ;
- tabulation, retour à la ligne en fin de saisie ;
- chiffres pleine chasse (`０６…`) : décider s'ils sont acceptés ou rejetés, et le justifier dans la PR ;
- numéro précédé de `tel:` (lien cliquable copié).

Puis faire passer les tests **dans les deux langages**. Les expressions régulières JS et Python ne traitent pas l'Unicode de la même façon : c'est le cœur de l'exercice.

## Critères d'acceptation

- [ ] Au moins 6 nouveaux cas, chacun avec un `name` explicite
- [ ] JS et Python donnent le même résultat sur chaque cas
- [ ] Si le comportement change, `CHANGELOG.md` est mis à jour
