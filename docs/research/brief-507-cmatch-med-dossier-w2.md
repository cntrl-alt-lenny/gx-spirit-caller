# Brief 507 — C-match MED dossier-guided wave 2

Branch: `decomper/c-match-med-507`

Scope: MED-tier dossier-guided reshaping only. HIGH-tier candidates were not touched. A function counted as matched only after direct objdiff/object comparison showed zero mismatches and the relevant region `ninja sha1` gate reported byte-identical.

## Summary

- Attempted: 28 EUR MED dossier candidates.
- EUR matches accepted: 15.
- USA ports accepted: 15.
- JPN ports accepted: 15.
- Parked: 13.
- Deferred as new `.s`: 0.
- Yield: 15 / 28 = 53.6%.
- Stop reason: target reached at 15 confirmed EUR matches, with all 15 ported and gated in USA/JPN.
- Remaining MED runway: still large. `docs/research/dossiers/INDEX.md` has 498 total dossiers; waves 505 and 507 have accepted 25 total dossier-guided EUR matches, leaving hundreds of MED candidates before done-skip filtering. The highest-yield remaining approach is cluster-first matching, especially exact bit/flag/setter clones.

## Accepted matches

| EUR | USA | JPN | Notes |
| --- | --- | --- | --- |
| `src/main/func_0208f6b0.legacy.c` | `src/usa/main/func_0208f5c8.legacy.c` | `src/jpn/main/func_0208f5c8.legacy.c` | f8 DMA clone cluster; explicit legacy-object diff zero |
| `src/main/func_0208f718.legacy.c` | `src/usa/main/func_0208f630.legacy.c` | `src/jpn/main/func_0208f630.legacy.c` | f8 DMA clone cluster |
| `src/main/func_0208f780.legacy.c` | `src/usa/main/func_0208f698.legacy.c` | `src/jpn/main/func_0208f698.legacy.c` | f8 DMA clone cluster |
| `src/main/func_0208f7e8.legacy.c` | `src/usa/main/func_0208f700.legacy.c` | `src/jpn/main/func_0208f700.legacy.c` | f8 DMA clone cluster |
| `src/main/func_0208f210.legacy.c` | `src/usa/main/func_0208f128.legacy.c` | `src/jpn/main/func_0208f128.legacy.c` | DMA base template cluster |
| `src/main/func_0208f2f4.legacy.c` | `src/usa/main/func_0208f20c.legacy.c` | `src/jpn/main/func_0208f20c.legacy.c` | DMA base template cluster |
| `src/main/func_0208f3e4.legacy.c` | `src/usa/main/func_0208f2fc.legacy.c` | `src/jpn/main/func_0208f2fc.legacy.c` | DMA base template cluster; fixed literal-pool/order by direct dst/handle locals |
| `src/main/func_0208f52c.legacy.c` | `src/usa/main/func_0208f444.legacy.c` | `src/jpn/main/func_0208f444.legacy.c` | DMA base template cluster; explicit base locals avoided address fusion |
| `src/main/func_0200c65c.c` | `src/usa/main/func_0200c640.c` | `src/jpn/main/func_0200c640.c` | flag set/clear clone at field `+0x6c`; object diff zero |
| `src/main/func_0200c6ac.c` | `src/usa/main/func_0200c690.c` | `src/jpn/main/func_0200c690.c` | flag set/clear clone at field `+0x70` |
| `src/main/func_0200c6fc.c` | `src/usa/main/func_0200c6e0.c` | `src/jpn/main/func_0200c6e0.c` | flag set/clear clone at field `+0x74` |
| `src/main/func_0200af24.c` | `src/usa/main/func_0200af08.c` | `src/jpn/main/func_0200af08.c` | nested task-list walk, cells `+0xc`, inner bound 13 |
| `src/main/func_0200afc8.c` | `src/usa/main/func_0200afac.c` | `src/jpn/main/func_0200afac.c` | nested task-list walk, cells `+0x8`, inner bound 5 |
| `src/main/func_02026ed8.c` | `src/usa/main/func_02026e84.c` | `src/jpn/main/func_02026e84.c` | object flag twin at field `+0x154` |
| `src/main/func_02026f28.c` | `src/usa/main/func_02026ed4.c` | `src/jpn/main/func_02026ed4.c` | object flag twin at field `+0x158` |

## Parked candidates

Every parked candidate was restored to `.s`; no fallback `.s` ships were added.

| Address | Reason |
| --- | --- |
| `021c9c54` | ov006 candidate true diff count was 82 after correcting the objdiff parser; parked |
| `021ca4b8` | ov006 candidate diff count 36; parked |
| `021b2514` | ov015 candidate diff count 86; parked |
| `021ab364` | ov020 candidate diff count 38; parked |
| `021ab43c` | ov020 candidate diff count 38; parked |
| `020125ac` | main candidate resisted with register-allocation differences; final diff count 16 |
| `0207e54c` | alloc-wrapper anchor: default route pushed `r3`; legacy route emitted `ldm {...,lr}; bx lr`; SP3 was not a usable quick route |
| `0207e664` | same alloc-wrapper clone-family epilogue/route mismatch as `0207e54c` |
| `0207e6f0` | same alloc-wrapper clone-family epilogue/route mismatch as `0207e54c` |
| `0207e748` | same alloc-wrapper clone-family epilogue/route mismatch as `0207e54c` |
| `02011620` | sin/cos matrix fill first-pass diff count 50; scheduler/permuter-class load/store interleave |
| `02011688` | sin/cos matrix fill first-pass diff count 22; scheduler/permuter-class load/order tail |
| `020116ec` | sin/cos matrix fill first-pass diff count 30; `stmib`/register grouping risk |

Inspected but not attempted: `021aab7c`; dossier was stale/truncated relative to the actual 480-byte state-machine assembly.

## Cluster yields

- f8 DMA clone cluster: 4 / 4 accepted.
- DMA base template cluster: 4 / 4 accepted after address-expression reshapes.
- Main flag set/clear clone cluster: 3 / 3 accepted from the existing `0200c74c` shape.
- Nested task-list walk pair: 2 / 2 accepted using the matched `0200b06c` separate-epilogue shape.
- Object flag twins: 2 / 2 accepted using the proven flag set/clear shape.
- Alloc-wrapper clone family: 0 / 4; this should go to permuter/compiler-route investigation, not more hand reshaping.
- Sincos matrix family: 0 / 3; likely scheduler/permuter territory.

## Final gates

Final gates were run after all code changes and report/index updates:

```text
gx-spirit-caller_eur.nds: OK
gx-spirit-caller_usa.nds: OK
gx-spirit-caller_jpn.nds: OK
```

## Throughput and contention

Approximate active wall time was about 3.5 hours across the pre-compaction checkpoint and this continuation, including long formal `ninja objdiff`/`ninja sha1` passes for three regions. That gives roughly:

- EUR attempt rate: 28 / 3.5h = 8.0 candidates/hour.
- Confirmed EUR match rate: 15 / 3.5h = 4.3 matches/hour.
- Confirmed three-region ship rate: 15 / 3.5h = 4.3 shipped functions/hour.

Local build note: a stale `build/brief506_driver.py` process from an older lane was still running in this same worktree and repeatedly spawned `ninja sha1` jobs against the generated build files. After waiting for normal child jobs to clear, the stale runner and its leftover child processes were stopped with targeted native Windows process IDs so Brief 507 could keep a coherent configure/build state. No POSIX lock workarounds, `pgrep`, `pkill`, or Wine tools were used.

## Notes for next MED pass

- The direct `objdiff-cli diff --format json-pretty` output should be checked by counting `diff_kind` occurrences, not by looking for a top-level `mismatches` array.
- `.legacy.c` entries sometimes need explicit object-to-object diffs because generated objdiff shortcuts can point at stale non-legacy object paths.
- The most productive pocket this wave was exact clone propagation: once a source shape is proven, immediately scan for sibling field-offset or address-shift clones.
- The `0207e54c` alloc-wrapper family is close but compiler-route blocked: default route gives `push {r3,r4,r5,lr}`, legacy route gives `ldm {...,lr}; bx lr`, while original needs `ldm {...,pc}`.
