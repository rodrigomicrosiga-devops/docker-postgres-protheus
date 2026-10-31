# Changelog

Formato [Keep a Changelog](https://keepachangelog.com/pt-BR/1.1.0/). Cada tag publicada no Docker Hub vira uma entrada; o digest é a identidade real da imagem.
Toda melhoria atualiza `[Unreleased]` no mesmo commit; ao publicar versão nova, `[Unreleased]` vira `[x.y.z] - data`.

## [Unreleased]

### Changed
- CI: a publicação passou a ser manual (`workflow_dispatch`). `push=false` é o padrão (só constrói local); `push=true` recusa tag já existente
  no Hub e `allow_overwrite` é a única forma de sobrescrever. A tag é o `IMAGE_TAG` do workflow. Antes, todo push em `main`/`develop`
  sobrescrevia a tag em uso, que o Image Updater rastreia.

## Baseline - 2026-10-31

Imagem: `rodrigomicrosiga/postgres-dev`

- `16` — `b04bd200d428` (digest conferido no Hub em 2026-10-31). Postgres 16 com HEALTHCHECK; roda no cluster e no Compose.
