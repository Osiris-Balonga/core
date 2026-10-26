---
title: "feat(phone): phone.mask() pour afficher un numéro partiellement masqué"
labels: js, python, fixtures, enhancement, niveau: intermediaire
milestone: v0.2
---
## Contexte

Une application affiche souvent un numéro sans l'exposer en entier : « Code envoyé au 06 *** ** 67 ». Chaque développeur le recode, souvent en masquant mal.

## API proposée

```ts
phone.mask('+242061234567')                    // '06 *** ** 67'
phone.mask('061234567', { style: 'international' }) // '+242 06 *** ** 67'
phone.mask('061234567', { char: '•' })          // '06 ••• •• 67'
phone.mask('123')                               // lève une erreur
```

Règle : le préfixe opérateur et les deux derniers chiffres restent visibles, tout le reste est masqué, le groupement est conservé.

## À faire

1. Écrire d'abord `fixtures/phone/mask.json` (au moins 6 cas, dont les erreurs).
2. Implémenter en TypeScript (`packages/js/src/phone.ts`) et en Python (`phone.py`).
3. Documenter dans le README.

## Critères d'acceptation

- [ ] Fixtures vertes en JS et Python
- [ ] Même API dans les deux langages (`mask` / `mask`)
- [ ] Le préfixe visible vient de `data/`, pas d'une valeur en dur
