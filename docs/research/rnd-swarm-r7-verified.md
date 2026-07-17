[//]: # (markdownlint-disable MD013 MD041)

# R&D swarm r7 — rate-of-progress frontier (2026-07-18)

**Method.** 10 throughput-focused scout lanes → 2 independent refute-by-default
verifiers per finding → completeness critic. **119 agents, 114 completed**
(the 3 gap-lanes + the auto-synthesis died on the Claude session-limit reset;
**this synthesis is the brain's**, from the fully-completed scout+verify pass).
**52 findings scouted; 81 verdicts refuted / 12 confirmed / 10 plausible** —
a harsh, appropriate filter given the mandate to dedupe against 7 prior swarm
docs and the just-shipped retriever/permuter/ledger work. Full raw findings:
the workflow journal (`wf_05209332-366`).

The finding IDs below (`r7-N`) match the raw-findings ordering.

## Executive summary

The frontier is readable-C (~8%), and the binding constraint is the single
wine/compile lane. The swarm's strongest, most-consequential finding is that
**that constraint is largely self-inflicted**: every agent compiles against the
one shared `~/.wine` prefix, so the whole Mac has exactly one wineserver — but
wine spawns one server *per* `WINEPREFIX`, and nobody sets it per-worktree
(`transform_dep.py:6-8`, confirmed). If a spike holds, isolated prefixes turn
1 iterate lane into 4. Around that, three programs compound: a **type/struct
bank** mined from the delink disassembly (fixes the match-critical
guess-and-fail-on-field-types loop — the 13-bit-bitfield class), a **batched
draft→compile→score loop** fed by **dossiers** (not bare m2c, which is
near-useless), and an **honest metric** (the tractable-C ceiling is ~14-24%,
NOT 100% — most rounds should stop selling headline byte-%). A dozen do-not-build
verdicts (embeddings, hybrid rerank, decomp.me puller, metroskrew-on-Mac, m2c
bump) save the most time of all.

## THE ONE BET — parallel wine lanes via per-worktree WINEPREFIX (r7-3)

`transformational / hours`. The whole project is coordinated around "Mac = one
wine lane" — but that is a shared-**prefix** artifact, not a property of wine.
Set `WINEPREFIX=<worktree>/.wine` per lane → each gets its own wineserver → all
4 agents run their compile+objdiff iterate loops concurrently, and the specific
GPTK deadlock the repo works around (two `mwldarm.exe` writing `arm9.o` at once)
disappears. **Confirmed statically:** `transform_dep.py` already reads
`WINEPREFIX` from env and defaults to `~/.wine`, set by nobody; the entire
`batch_carve` `_wait_wine_quiet`/`_kill_orphans` machinery is a workaround for a
lock isolation would delete.

The sharp boundary (from the repo's own `.ninja_log` timings the finding cites):
the **compile is ~1 s and CPU-light → parallelizes near-linearly**; the
**full-ROM link is ~81 s and Rosetta2-CPU-bound → keep a flock only around the
`mwld` link step** (2 concurrent 81 s links thrash the M1). So: isolate prefixes
for the compile/iterate lane, serialize only the link.

**First step (brief 608, top priority):** two-worktree spike — each worktree a
distinct `WINEPREFIX`, run both agents' `post_edit` compile loops (plus a
`batch_carve` wave) concurrently, confirm zero deadlock, measure aggregate
compiles/min vs the single-lane baseline. If green, wire a per-worktree
`WINEPREFIX` default into worktree setup and drop `_wait_wine_quiet` from the
compile path (retain it only for `mwld`). Complements **r7-11** (route the 81 s
link to the owner's PC's *native* mwldarm — no wine, no Rosetta — and schedule
"gates = PC rounds" explicitly).

## Ranked top program (interlocking)

**A. Break the throughput ceiling**
- **r7-3** parallel wine lanes (the one bet, above).
- **r7-11** `high/hours` — route the 81 s Rosetta link to the PC's native mwldarm lanes; make "gates = PC rounds" an explicit schedule.
- **r7-21** `medium/hours` — enforce one-`ninja`-per-worktree (a self-collision already cost a full gate cycle).

**B. Type/struct bank — kill the guess-and-fail-on-types compile class**
- **r7-1** `transformational/days` — mine field width/signedness/bitfield from the 815 delink `.o` per `data_*` symbol; emit typed `struct`s into `*_core.h` so `m2c --context` renders `slot.id:13` not `*(int*)(base+0xNN)`. Match-CRITICAL: `ov002_core.h:37-38` documents that a 13-bit field written as `(v<<19)>>19` fails the byte match unless typed as a real bitfield; 1,518 matched `.c` already hit this. core.h today = 16 structs serving 10,263 funcs.
- **r7-19** `medium/hours` — cheapest slice first: promote the 64 curated comment field-maps already in core.h into typed structs.
- **r7-4** `high/day` — add SYMBOL-keyed few-shot (rank corpus rows by shared `data_*` reloc symbols) — orthogonal to b604's mnemonic-BM25, catches same-struct siblings whose control flow differs (they carry the field types).
- **r7-5** `high/day` — build the bank ONCE for EUR, port field-maps to USA/JPN core.h (3× multiplier; de-risks the in-flight b601).

**C. The production loop + dossiers**
- **r7-2** `transformational/days` — `tools/cmatch_loop.py`: batch offline drafting (3 wine-free agents) + ONE serialized compile+`fastmatch` sweep + classify accept/iterate/park + hand accepts to `batch_sha1`. Composes the already-built pieces (retriever, fastmatch-RESOLVED, batch_sha1) that nothing currently chains.
- **r7-6** `high/days` — steady-state allocation: 1 wine decomper + 1 **dossier** builder (matched-sibling `.c` + its struct decls + `suggest_coercion` routing tier + m2c skeleton) + 2 Luna compute playlists; queue kept ≥2× drain depth. **Sharp correction: m2c alone is near-useless (mis-resolves pool literals → `?`/`void*`); the dossier, not the bare m2c draft b606 emits, is the lever** (b582 evidence).
- **r7-7** `high/hours` — iterate with `fastmatch` (resolved objdiff), batch the sha1 gate → closes the objdiff-≠-link trap (our b453/b597 recurring bug) at 1/N wine cost.
- **r7-10** `high/hours` — attempt-cap = 3, not the peer's 28: one lane makes long-tail attempt economics infeasible.
- **r7-26** `medium/hours` — cap autonomy at draft/compile/score: two gate gaps survive fastmatch-RESOLVED, so the loop must NOT auto-ship; brain still gates.

**D. Honest metric + roadmap**
- **r7-14** `high/days` — **the tractable-C ceiling is ~14-24% of headline bytes (2-3× current), NOT 100%** — a tiered, wall-enriched estimate. The single most important number for honest rate-of-progress.
- **r7-13** `high/day` — north-star = attainment ratio (C / tractable-C) with an explicit ov002 denominator fork; not headline byte-% C.
- **r7-15** `high/day` — "meaningfully done" at the module tier: 14 finishable modules (~92 kB `.s`) are a closeable backlog; ov002+main are asymptotic by construction.
- **r7-16** `high/day` — ship it: extend `progress.py --by-module` (built b587) with tractable-ceiling + attainment + done-class columns (build-free dashboard).
- **r7-33/34** — honest ships/day has fallen ~20× as the easy-clone tier drained; and "matched-C" (m2c dumps + placeholder names) ≠ "readable-C" — don't conflate the numerator.

**E. Reg-alloc ceiling — the one remaining crack candidate**
- **r7-12** `high/days` — **opt-level is the one codegen axis permuter can't search**, is peer-required on our bit-identical twin (SRA), and was NEVER run on the reg-alloc-plateau class. The one lever left after permuter's confirmed death (b602).
- **r7-31** `medium/days` — static-inline helper decomposition is the likely CAUSE of the dispatcher-class residual (extends r6 #5).
- **r7-32** — the true permanent-`.s` floor is only scratch-register-field-only residue.

**F. Naming at scale (post-coverage mountain, ~1% named)**
- **r7-18** `high/hours` — adopt the 44 clean `libs/nitro` upstream NitroSDK names (byte-neutral, restarts a plateaued cascade). Quick win.
- **r7-39** `medium/day` — dsd sig DB from the vendored pokediamond NitroSDK → `sig apply -a` to NAME un-ported SDK funcs (brief-280's coercion objection doesn't apply to naming).
- **r7-40** — cross-region twin propagation is a 3× MULTIPLIER on EUR naming, not a standalone lane (standalone ceiling ~10, already measured zero).
- **r7-41** `medium/days` — automate the one human step in the plateaued `nitro_suggest_renames`: an LLM picks the right name from ~5-10 narrowed candidates over ~1,200 targets.

## Quick wins (hours, confirmed)

r7-19 (promote 64 comment field-maps), r7-18 (44 NitroSDK names), r7-21 +
r7-22 (one-ninja-per-worktree; make CANARY/BASE-PREFLIGHT a kickoff-template
lint since Luna doesn't self-check), r7-28 (fix the stale canonical doc that
still cites an 85 s loop — the inner loop is already link-free/live for all 4
agents), r7-23 (time-slice R&D swarms against worker rounds — shared quota; the
lesson this very run re-proved).

## DO-NOT-BUILD (the biggest time-savers)

- **r7-43/45/46** — no local code-embedding model, no hybrid BM25+embedding rerank: representation is the ceiling and retrieval is not the binding constraint (BM25 family-hit@5 already 95.8%). *But* gate any retriever-V2 work on a proven downstream ship-rate lift, and note r7-25: that 95.8% rests on a 24-query uncommitted probe — build a ≥200-query harness before ANY A/B.
- **r7-29** — no native-mwcc on the Mac and hosted CI can never run the gate: don't chase metroskrew-on-Mac or cloud-CI offload. (r7-30: a private owner-controlled Linux box CAN serve as a batch/**gate** lane — latency makes it a gate lane, not an iterate lane.)
- **r7-48/49** — no decomp.me puller (Cloudflare-blocked + scraping prohibited; preset is redundant with self-serve SRA); keep SRA read-only (no license file → do NOT vendor/commit its source — resolves the r7-42 tension).
- **r7-50** — do not bump m2c (~30 commits since our pin = SH2/PPC/MIPS + robustness, ZERO ARM/mwcc gains). **r7-38** — do not do the full objdiff v2.7.1→v3.7.3 migration for throughput (inner loop is fastmatch+sha1, not objdiff-scored); get v3's ARM diff accuracy via a config-independent diff-only sidecar if wanted.
- **r7-51** — no new throughput-relevant scene tool since 2026-06-19. **r7-52** — no debug-string naming (retail NDEBUG build, strings stripped).

## Honest ceiling + rate

- Tractable readable-C ≈ **14-24% of headline bytes** (r7-14), i.e. 2-3× the current ~8%, NOT 100%. ov002 + arm9 (78% of the denominator) are asymptotic by construction (reg-alloc walls + the by-rule ov002 exclusion).
- 14 modules (~92 kB `.s`) are a **finishable** backlog (r7-15) — that is the honest "done" target for the closeable tier.
- Ships/day has fallen ~20× since the easy-clone tier drained (r7-33): project **months** to close the finishable modules, **never** for the asymptotic ones. The levers above raise the constant, not the asymptote.

## Recommended next 3 rounds (4-agent roster, one→N wine lanes)

1. **Prove the ceiling-breaker + start the bank.** Wine: brief 608 (WINEPREFIX spike, brain or CC-Decomper). Sonnet judgment: r7-1 struct-bank miner prototype on `data_ov002_022d016c`. Luna: r7-18 (44 NitroSDK names, byte-neutral) + r7-19 (promote 64 field-maps) as a playlist; r7-16 (dashboard columns).
2. **If 608 green → re-plan around 4 lanes** and build r7-2 `cmatch_loop.py` + r7-6 dossiers; extend the bank EUR→USA/JPN (r7-5). If 608 red → the one-lane pipeline stands; focus the bank + dossiers to make the single lane maximally fed.
3. **Attack the reg-alloc ceiling honestly** (r7-12 opt-level matrix on the plateau class) and stand up the naming program (r7-39 sig DB). Publish the honest tractable-ceiling metric (r7-13/14) so rate-of-progress is measured against the real target.

**Superseded:** the r6 top items (retriever, singleton re-queue, branch protection, P-1) are done or in flight; this report is the current frontier.
