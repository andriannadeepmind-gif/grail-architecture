# GRAIL / World OS — Architecture Model

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

The architecture is modelled in **SysON** (SysML v2), running locally, and edited through the `syson` MCP server.

| What | Where |
|---|---|
| SysON (live model, web UI) | http://localhost:8180 — start with `docker compose -p grail-syson up -d` in `platform/` |
| SysON + PostgreSQL setup | `platform/docker-compose.yml` (from mcp-syson v0.8.7, MIT — see `platform/THIRD-PARTY-LICENSE-mcp-syson.txt`) + `platform/docker-compose.override.yml` (local hardening) |
| MCP connection (this project only) | `.mcp.json` — mcp-syson 0.8.7, network limited to the local SysON |
| Earlier draft (unverified, pre-platform) | `docs/architecture-draft/` — `spine-vocab.md` holds the ID set (114 REQ, 75 CMP — its heading says 76, 32 ICD, 40 INV, 24 KT) to be modelled |
| The creator's law that governs the work | `docs/NOMOS-MI-YPOVATHMISIS.md` — the absolute law of non-degradation, verbatim; three of its articles are gates in `DECISIONS-FOR-CREATOR.md` Δ-8(ια) |
| Phase A discovery (state of the art, gaps, decisions) | `docs/discovery/` |
| Raw material of the creator (verbatim, with SHA-256 manifest) | `docs/ideas-raw/` — imported by `pwsh -File platform/import-ideas.ps1 -Source '<folder>' -Push` |
| When OneDrive will not deliver a file | `pwsh -File platform/stage-local-copy.ps1 -Source '<OneDrive folder>' -Destination C:\IDEES` — copies what is really on the disk and names what must be fetched from onedrive.com. Import a staged copy with `-CompareWith '<the original folder>'`, which refuses to import while a file of the original is absent or renamed. |
| Model exports (SysML v2 text) | `model/` — committed at every milestone; produced by `pwsh -File platform/export-model.ps1 -Project GRAIL-World-OS` (one `.sysml` per SysON document + byte-exact SysON JSON in `model/.syson/`) |
