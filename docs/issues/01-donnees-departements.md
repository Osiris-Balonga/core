---
title: "data(geo): ajouter la liste sourcée des départements"
labels: data, besoin-source, good first issue, niveau: accessible
milestone: v0.1
---
## Contexte

`data/geo/departements.json` est vide. C'est la base de tout le module `geo` : sans départements, pas de communes ni d'arrondissements.

## À faire

1. Trouver le **texte officiel en vigueur** qui fixe le découpage en départements. Le découpage a pu évoluer récemment : vérifiez la date du texte et s'il a été modifié depuis.
2. Pour chaque département, ajouter une entrée : `id` (kebab-case, ex. `pointe-noire`), `nom` officiel, `chefLieu`, `aliases` (variantes usuelles), `iso3166_2` si le code existe, et le bloc `verification` complet.
3. Si un département a été créé ou supprimé par une réforme, renseigner `validFrom` / `validUntil` / `replacedBy`.
4. `npm run sync` puis `npm run check`.

## Critères d'acceptation

- [ ] Toutes les entrées sont en `"status": "verifie"` avec une source précise (titre, numéro, date) et un lien si disponible
- [ ] La PR explique en deux lignes comment la source a été trouvée
- [ ] `npm run check` vert

## Pour démarrer

Lire [docs/sourcing-des-donnees.md](../sourcing-des-donnees.md). Wikipédia peut aider à **trouver** le texte officiel, mais ne compte pas comme source.

Cette issue peut être faite à deux : une personne collecte, l'autre vérifie la source avant la PR.
