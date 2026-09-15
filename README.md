# GRAIL / World OS — Architecture Model

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

The architecture is modelled in **SysON** (SysML v2), running locally, and edited through the `syson` MCP server.

| What | Where |
|---|---|
| SysON (live model, web UI) | http://localhost:8180 — start with `docker compose -p grail-syson up -d` in `platform/` |
| SysON + PostgreSQL setup | `platform/docker-compose.yml` (from mcp-syson v0.8.7, MIT — see `platform/THIRD-PARTY-LICENSE-mcp-syson.txt`) + `platform/docker-compose.override.yml` (local hardening) |
| MCP connection (this project only) | `.mcp.json` — mcp-syson 0.8.7, network limited to the local SysON |
| Earlier draft (unverified, pre-platform) | `docs/architecture-draft/` — `spine-vocab.md` holds the ID set (114 REQ, 76 CMP, 32 ICD, 40 INV, 24 KT) to be modelled |
| Model exports (SysML v2 text) | `model/` — committed at every milestone |
