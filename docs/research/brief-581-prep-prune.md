# Brief 581 — c-match-prep cleanup

Build-free mechanical cleanup from `origin/main`, 2026-07-15.

## Result

| Measure | Count |
|---|---:|
| Scaffold `.c` files scanned | 3,990 |
| Superseded scaffolds pruned | **473** |
| Scaffolds kept as reference | **3,517** |
| Brief 567 superseded count | 45 |
| Delta versus Brief 567 | **+428** |

The census matched on the eight-digit address appearing in any tracked
`src/**/*.c` filename, including `.thumb.c`, `.legacy.c`,
`.legacy_sp3.c`, overlay, USA, and JPN variants.

`build.ninja` was checked before pruning and has no `c-match-prep`
reference. The final worktree contains only the two documentation edits and
confirmed superseded scaffold deletions. No build or tests were run.

