# Brief 624: cmatch-loop classification sweep

This is a EUR-only, classify-only sweep of matched `.s` function TUs. For each
module, the matched `.s` TUs are temporarily unclaimed and hidden while the
loop drafts a C candidate, compiles and fastmatches it; all source and delink
content is restored after the module. The loop does not run `batch_sha1.py` or
ship anything.

The documented cmatch-loop canary reproduced two current complete C matches at
100%: `func_02000c44` and `func_02000cb4`.

## Module results

| Module | Candidates | Accept | Iterate | Park | Accept list |
| --- | ---: | ---: | ---: | ---: | --- |
| ov001 | 4 | 0 | 4 | 0 | none |
| ov023 | 2 | 0 | 2 | 0 | none |
| ov013 | 9 | 0 | 9 | 0 | none |
| ov014 | 22 | 0 | 22 | 0 | none |
| ov022 | 12 | 0 | 12 | 0 | none |
| ov012 | 16 | 0 | 16 | 0 | none |
| ov009 | 17 | 0 | 17 | 0 | none |
| ov007 | 10 | 0 | 10 | 0 | none |
| ov019 | 25 | 0 | 25 | 0 | none |
| ov003 | 18 | 0 | 18 | 0 | none |

**Batch total:** 135 candidates, 0 accepts, 135 iterates, 0 parks. The
accept-list is empty. The iterate classifications were compile failures from
the generated temporary C drafts; no candidate reached the three-attempt park
cap in this single classification pass.

## Method

Candidate files are derived from EUR `config/eur/arm9/overlays/*/delinks.txt`
entries whose complete TU source is a `func_*.s` file. Each module is run with
`--candidates-file`, a module-specific state file, and no `--gate-real`.

## Rest-of-queue classification (Brief 632)

The same classify-only path was applied to the next module. No candidate was
shipped and no gate was run.

| Module | Candidates | Accept | Iterate | Park | Accept list |
| --- | ---: | ---: | ---: | ---: | --- |
| ov000 | 59 | 0 | 59 | 0 | none |
