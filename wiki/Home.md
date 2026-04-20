<p align="center">
  <img src="https://raw.githubusercontent.com/cntrl-alt-lenny/gx-spirit-caller/main/assets/github-banner.png" alt="GX Spirit Caller decomp banner" width="100%">
</p>

<h1 align="center">GX Spirit Caller Decomp Wiki</h1>

<p align="center">
  A matching decompilation of <em>Yu-Gi-Oh! GX Spirit Caller</em> for the Nintendo DS.<br>
  Goal: a <strong>byte-identical ROM</strong> rebuilt from clean C source, verified via SHA-1.
</p>

---

## Start Here

| If you want to...                      | Read                                                         |
|----------------------------------------|--------------------------------------------------------------|
| Build the ROM for the first time       | [Getting Started](Getting-Started)                           |
| Understand the decomp inner loop       | [Matching Workflow](Matching-Workflow)                       |
| See what compilers & versions we use   | [Toolchain](Toolchain)                                       |
| Know where to put your code            | [Project Conventions](Project-Conventions)                   |
| Bootstrap `config/<ver>/` from scratch | [Bootstrapping Config](Bootstrapping-Config)                 |
| Check round-trip module status         | [Build Status](Build-Status)                                 |
| Contribute a patch                     | [Contributing](Contributing)                                 |

## ROM Versions

| Region | Game code | Baserom path              | Status                  |
|--------|-----------|---------------------------|-------------------------|
| `usa`  | `AYXE`    | `orig/baserom_usa.nds`    | hashed                  |
| `eur`  | `AYXP`    | `orig/baserom_eur.nds`    | hashed (En,Fr,De,Es,It) |
| `jpn`  | `AYXJ`    | `orig/baserom_jpn.nds`    | hashed                  |

The version is a positional arg to `tools/configure.py` and appears in
`config/<ver>/` and `build/<ver>/` subpaths. All three may coexist; pick
one per run.

## Project Goals

- **Byte-identical rebuild** — `ninja`'s output SHA-1 must match the original dump.
- **Multi-region from day one** — `usa` (AYXE), `eur` (AYXP), `jpn` (AYXJ).
- **Readable C source** — no hand-written assembly beyond what the compiler emits.
- **Reproducible on any host** — one `ninja` invocation pulls the toolchain, extracts the ROM, delinks every object, and verifies the rebuild.

## About This Wiki

Wiki content is maintained as markdown in [`wiki/`](https://github.com/cntrl-alt-lenny/gx-spirit-caller/tree/main/wiki)
on the main repo and synced to the GitHub wiki by a workflow on merge
to `main`. **Edit the files in the repo via PR, not the wiki UI directly** —
direct wiki edits will be overwritten on the next sync.
