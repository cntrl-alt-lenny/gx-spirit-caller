# ITCM reachability diagnosis

**Queue item:** `q-itcm-reach`  
**Date:** 2026-07-22  
**Scope:** read-only investigation; no config, source, or tool change in this
item.

## Diagnosis

ITCM is not missing from the linker's configuration anymore. The current
tree has a split condition:

1. The function-level census path was fixed by Brief 583. `size_census.py`
   now explicitly yields `arm9/itcm/symbols.txt` and
   `arm9/itcm/delinks.txt`, and `progress.py` explicitly discovers the same
   `itcm` delinks tier.
2. The readable-C candidate path still excludes ITCM. `wall_aware_headroom.py`
   scans tracked assembly with this file-level regex:

   ```python
   _MODULE_RE = re.compile(r"^src/(main|overlay\d+)/[^/]+\.s$")
   ```

   ITCM sources live below `src/main/itcm/`, so the nested path does not
   match. The resulting `wall_aware_headroom.py --json` output has
   `total_candidate: 6117` and no `itcm` module. The generated
   `docs/research/c-match-worklist.json` likewise has no `itcm` rows.

This explains the “invisible 27th module” wording: the linker and byte
progress tools can see ITCM, but the C-match candidate/worklist lane is still
hard-coded to top-level `src/main/*.s` and `src/overlayNNN/*.s` files.

## Exact evidence

### Config and section routing

All three regions declare ITCM as an ARM9 autoload in
`config/<region>/arm9/config.yaml`:

```yaml
- kind: Itcm
  name: itcm
  object: ../../../build/<region>/build/itcm.bin
  delinks: itcm/delinks.txt
  symbols: itcm/symbols.txt
  relocations: itcm/relocs.txt
```

EUR's `config/eur/arm9/itcm/delinks.txt` has the ITCM section
`.text start:0x01ff8000 end:0x01ff886c` and its own TU claims, including:

```text
src/main/itcm/func_01ff8400.s:
src/main/itcm/func_01ff86c4.legacy.c:
src/main/itcm/func_01ff86fc.s:
src/main/itcm/func_01ff8770.legacy.c:
```

The main module's `config/eur/arm9/delinks.txt` is not the ITCM ledger; using
only that file is therefore the wrong reachability test.

### Function-level counts

The build-free `size_census.py` output is:

| Region | ITCM functions | Unmatched functions | Unmatched bytes |
|---|---:|---:|---:|
| EUR | 14 | 10 | 1,884 |
| USA | 14 | 14 | 2,156 |
| JPN | 14 | 14 | 2,156 |

Commands used:

```text
python tools/size_census.py --version eur --module itcm --json
python tools/size_census.py --version usa --module itcm --json
python tools/size_census.py --version jpn --module itcm --json
```

The EUR split is eight unmatched functions below `0x100` (1,232 bytes) and
two in `0x100-0x200` (652 bytes). The 10 EUR unmatched functions are
function-level gap symbols; only two unmatched EUR source files currently
exist under `src/main/itcm/` (`func_01ff8400.s` and
`func_01ff86fc.s`). That distinction matters: a file-level `.s` scan cannot
invent source paths for the other eight gap symbols.

For comparison, `python tools/progress.py --version eur --by-module` already
prints an `itcm` row (`272/2156` code bytes and `136/2156` C bytes in this
tree). This is further confirmation that the reachability defect is in the
C-match candidate feeder, not in the config or progress parser.

### DTCM is not the same problem

`size_census.py` includes DTCM for symmetry, but its symbols files contain no
`kind:function` entries. DTCM is data-only here; it should not be added to a
function C-match queue merely because it is another ARM9 autoload.

## Concrete proposal

Make the candidate feeder module-aware in two layers:

1. **Immediate file-level correction:** replace the regex-only module test in
   `wall_aware_headroom.py` with path-part classification that maps
   `src/main/itcm/*.s` to module `itcm`, retains `src/main/*.s` as `main`, and
   retains `src/overlayNNN/*.s` as `ovNNN`. Keep the existing live-delinks
   check, so only actual build inputs enter the pool. This exposes the two
   existing EUR ITCM `.s` candidates without changing their paths.
2. **Complete function-level feeder:** when building the unified C-match
   worklist, union the file-level wall scan with `size_census.py`'s unmatched
   function rows for `itcm`. Use module `itcm`, the function address/size as
   the key, and the existing `src/main/itcm/func_<addr>.s` path only where a
   source file actually exists. For symbol-only gaps, emit the normal
   address-based scaffold target rather than pretending a source file exists.
   This makes the full EUR 10-row ITCM floor and the USA/JPN 14-row floors
   reachable to the carve/decomp lane.

The implementation should share `size_census._module_paths()` or a small
public module-path helper rather than adding a second hard-coded module list.
Add a regression test for `src/main/itcm/func_01ff8400.s` and for one
symbol-only ITCM gap, and assert that `dtcm` contributes zero function rows.

## Gate and capability

This was a build-free investigation. No baserom, generated build tree, or
compiler is present in `kb-map`, so no compile, delink, objdiff, or SHA-1
gate was attempted or forced. The evidence above uses committed config,
symbols, delinks, and the available build-free Python census commands.
