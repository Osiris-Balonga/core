---
title: "ci: générer les types TypeScript depuis les schémas JSON"
labels: ci, js, niveau: avance
milestone: v0.3
---
## Contexte

`packages/js/src/types.ts` duplique à la main les schémas de `data/schema/`. Les deux peuvent diverger sans que personne ne le voie.

## À faire

1. Générer `packages/js/src/generated/types.ts` depuis les schémas, au moment de `npm run sync` (outil au choix, en dépendance de développement uniquement : `json-schema-to-typescript` ou équivalent, à justifier).
2. Remplacer `types.ts` par une réexportation des types générés.
3. Étendre `npm run sync -- --check` pour qu'il échoue si les types sont périmés.

## Critères d'acceptation

- [ ] Modifier un schéma sans relancer `sync` fait échouer la CI (démontré dans la PR)
- [ ] Les types publics exportés par le paquet restent identiques (aucune rupture d'API)
- [ ] `npm run check` vert
