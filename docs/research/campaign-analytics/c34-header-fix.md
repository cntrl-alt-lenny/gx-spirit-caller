# Main C-34 header correction

Snapshot: Brief 655 correction pass, 2026-07-22. The mechanical
`wall_aware_headroom.py --coercible --json` count was **58 main C-34-coded
files before** and **28 after**. The 30-entry reduction is the requested
classifier cleanup; 28 live `.s` headers were edited, while any already-
shipped members had no `.s` header left to edit.

## Live headers corrected

The following 28 live `src/main/*.s` headers carried the bulk-stamped Vanilla
Brief-207/202 C-34 citation and were changed to an honest “no duplicate-
address evidence / never assessed” note:

`02000f84`, `020061bc`, `02006524`, `02007f38`, `0200ed48`, `0201904c`,
`0201a32c`, `0201fbe0`, `020323f4`, `0203244c`, `02034094`, `0203c70c`,
`0203cff8`, `0203d078`, `020644a4`, `02067850`, `0206d79c`, `0207391c`,
`0207c20c`, `0207db8c`, `0207dbf8`, `0207f8d8`, `0207f914`, `0209aa48`,
`0209bf18`, `0209d788`, `020a7368`, `020aee58`.

The six genuine duplicate-pool examples and the two jump-table records were
left untouched. Their remaining C-34 markers are still visible for future
wall handling; this pass only removes unsupported Vanilla citations.

## Gate evidence

- Before: `total_candidate=6093`, `total_coercible=116`, `main C-34=58`.
- After: `total_candidate=6093`, `total_coercible=88`, `main C-34=28`.
- `python tools/gate3.py --scope eur --no-tests` — **not runnable in this
  build-free worktree**; preflight stopped at missing `./dsd`. No source
  bytes changed: all 28 edits are assembler comments.

## EUR-capable rerun (2026-07-22)

The corrected tree was rechecked from `kb-types`. `python tools/wall_aware_headroom.py`
reports the corrected totals (`total_candidate=6088`, `coercible=88`,
`main C-34=28`), and `python tools/gate3.py --scope eur --no-tests` passed:

```text
[eur] SHA1 PASS
==================== GATE PASS ====================
Verifying SHA-1 of orig\baserom_eur.nds...
  OK  (1da50df7c210fae96dc69b3825554b9ce13b4f75)
```

This rerun changed no source files; the header correction remains byte-neutral.

