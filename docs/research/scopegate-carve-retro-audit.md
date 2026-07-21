# `scope_gate --kind carve` C-Match Retro-Audit

_Audit of the ten most recent merged source-bearing C-match PRs._

## Method

Each PR was checked at its merge commit against the merge commit's first
parent, using the regions and shipped-function target claimed by that PR. The
command was:

```text
python3.13 tools/scope_gate.py --kind carve --base <first-parent> \
  --regions <regions> --target <claimed-total>
```

This is a retro-audit only. No source, delinks, or build input was changed.

## Results

| PR | Claimed target | Regions | Scope result | Reconciliation result | Audit outcome |
| ---: | ---: | --- | --- | --- | --- |
| #1216 | 1 | EUR | FAIL: delta 0 | FAIL: new complete 1, sources 1, delta 0 | would flag |
| #1215 | 2 | EUR | FAIL: delta 0 | FAIL: new complete 18, sources 15, delta 0 | would flag |
| #1211 | 10 | EUR | FAIL: delta 0 | FAIL: new complete 14, sources 11, delta 0 | would flag |
| #1210 | 2 | EUR | FAIL: delta 0 | FAIL: new complete 1, sources 1, delta 0 | would flag |
| #1203 | 6 | EUR | FAIL: delta 0 | FAIL: new complete 36, sources 33, delta 0 | would flag |
| #1202 | 12 | EUR | FAIL: delta 0 | FAIL: new complete 30, sources 27, delta 0 | would flag |
| #1196 | 10 | EUR | FAIL: delta 0 | FAIL: new complete 46, sources 43, delta 0 | would flag |
| #1189 | 12 | USA/JPN | PASS: delta 12 | FAIL: new complete 56, sources 12, delta 12 | would flag |
| #1133 | 21 | EUR/USA/JPN | PASS: delta 1166 | FAIL: new complete 1282, sources 1230, delta 1166 | would flag |
| #1129 | 48 | EUR/USA/JPN | PASS: delta 1808 | FAIL: new complete 1972, sources 1913, delta 1808 | would flag |

Summary: **0/10 passed the carve reconciliation check**. Seven also failed
the target check. The two older broad diffs (#1133 and #1129) exceeded their
targets but still failed reconciliation; their large deltas reflect the
historical tree state visible at those merge commits, not an under-shipped
claim in the PR body.

## Finding

This is a false-premise audit for readable-C conversions. A C-match replaces a
complete `.s` TU with a complete `.c` TU. The carve gate keys its unit identity
to `(region, delinks path, source)`, so a source replacement is not a positive
cardinality delta: the old `.s` tuple disappears while the new `.c` tuple
appears. The gate therefore sees `complete_units delta = 0` even when the PR
adds the expected C source and updates the delinks block. It then reports the
replacement as a reconciliation failure.

The result does **not** show that these C-match PRs under-shipped. It shows
that `--kind carve` is intentionally strict for new carve units and is not a
valid completeness metric for `.s`-to-`.c` replacement work. A future scope
gate extension should model replacement pairs explicitly, or C-match PRs
should continue to use their existing byte-identity and three-region gates.

The tooling-only cmatch_loop PR #1198 was not included in the ten
source-bearing ranges; it has no carve deliverable to audit.
