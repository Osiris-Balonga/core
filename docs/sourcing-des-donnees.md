# Sourcer les données

La valeur de ce projet tient à une promesse : **chaque donnée est vérifiable**. Un préfixe d'opérateur faux ou une commune mal rattachée rend la bibliothèque nuisible pour ceux qui l'utilisent.

## Le bloc `verification`

Chaque entrée de `data/` en contient un :

```json
"verification": {
  "status": "verifie",
  "source": "Journal officiel de la République du Congo, n° …, p. …",
  "sourceUrl": "https://…",
  "verifiedAt": "2026-11-02",
  "verifiedBy": "github-handle"
}
```

| Champ | Obligatoire si `verifie` | Contenu |
|---|---|---|
| `status` | toujours | `verifie` ou `a_verifier` |
| `source` | oui | Référence précise : titre du document, numéro, date, page |
| `sourceUrl` | recommandé | Lien direct, ou lien d'archive (web.archive.org) |
| `verifiedAt` | oui | Date à laquelle vous avez consulté la source (AAAA-MM-JJ) |
| `verifiedBy` | recommandé | Votre identifiant GitHub |

La CI (`npm run validate`) refuse une entrée `verifie` sans `source` ni `verifiedAt`. En mode strict (release v1.0), elle refuse toute entrée `a_verifier`.

## Hiérarchie des sources

Utilisez la source la plus haute disponible :

1. **Texte officiel** : loi, décret, arrêté publié au Journal officiel (découpage territorial, création de communes).
2. **Autorité compétente** : décision ou plan publié par l'autorité de régulation des communications électroniques (ARPCE) pour la numérotation ; Institut national de la statistique pour les codes et listes administratives.
3. **Administration locale** : site ou document d'une mairie, d'une préfecture.
4. **Référentiel international** : ISO 3166-2:CG pour les codes de subdivisions, en vérifiant qu'il est à jour après une réforme.

**Ne sont pas des sources** : Wikipédia (utile pour trouver la source primaire, pas comme source), un blog, un forum, « tout le monde sait que », un autre paquet open source, une réponse d'IA.

## Cas fréquents

**Le découpage a changé.** Ajoutez la nouvelle entrée sourcée. Ne supprimez pas l'ancienne : renseignez `validUntil` et, si possible, `replacedBy`. Une application peut avoir des adresses anciennes à interpréter.

**Plusieurs orthographes circulent.** Le nom officiel va dans `nom`, les variantes d'usage dans `aliases` (« Pte-Noire », « Bzv », « Potopoto »). Les variantes n'ont pas besoin d'une source officielle : leur fonction est de reconnaître des saisies réelles.

**Je n'ai qu'une source faible.** Ajoutez l'entrée en `a_verifier` et expliquez dans la PR ce que vous avez trouvé. C'est une contribution utile : quelqu'un d'autre pourra la confirmer.

**Les sources se contredisent.** Ouvrez une issue avec le label `besoin-source`, citez les deux. Un mainteneur tranche en privilégiant la source la plus haute et la plus récente.

## Relecture

Toute PR touchant `data/` est relue par une personne qui **ouvre la source citée** et vérifie qu'elle dit bien ce que l'entrée affirme. Une PR qui ne cite que des sources inaccessibles reste ouverte jusqu'à ce qu'un relecteur puisse les consulter.
