[//]: # (markdownlint-disable MD013 MD041)

# R&D swarm r6 — VERIFIED (2026-07-17)

Supersedes [rnd-swarm-r6-partial.md](rnd-swarm-r6-partial.md) — the verification pass the original
8-lane swarm died mid-run before running (5 scouts completed, 0 verifiers, no critic, no
synthesis). This document is that missing verification pass, run as brief 590.

**Headline: 22 CONFIRMED / 7 PLAUSIBLE / 0 REFUTED, out of 29 findings.** Zero findings were fully
refuted — the scout lanes' factual discipline was unusually high (line numbers, byte counts, and
external quotes reproduced almost exactly across nearly every finding). What verification actually
found was a different failure mode: **currency, not accuracy**. Four findings (three in
`r5-claims-audit`, one in `ov002-arm9-strategy`) describe bugs/gaps that a live agent — this one, in
prior sessions — had *already fixed and merged* by the time this swarm ran or was verified (PRs
#1153, #1157). Several more had their premise partly overtaken by *other* work that landed in the
interim (briefs 582, 584, 585, 586). One finding (`codegen-levers` #2, `-ipa file`) turned out to
directly contradict an explicit prior **CLOSED** verdict from `improvement-swarm-2026-07-12-r4.md`
that the scout never checked against — flagged below, excluded from the top-8, not safe to act on
without reconciliation first.

## Method

Each of the 29 findings was re-verified adversarially (refute-by-default): re-derive the evidence
independently from the repo and/or web — never trust the scout's citation — then check the finding
against the six prior swarm docs (`tool-scout-swarm-2026-06-19.md`,
`speedup-research-swarm-2026-07-03.md`, `improvement-swarm-2026-07-09.md` (r1),
`improvement-swarm-2026-07-09-r3.md` (r3), `improvement-swarm-2026-07-12-r4.md` (r4),
`improvement-swarm-2026-07-15-r5.md` (r5)) for novelty/contradiction. Four findings (the three
where this agent has direct first-hand authorship of the merged fix, plus one where it independently
built the exact tool the finding calls for) were verified directly by the brief-590 agent itself;
the remaining 25 were split across four parallel sub-agents, one per remaining lane section
(`big-function-methodology`; `ov002-arm9-strategy` findings 1–5; `r5-claims-audit` findings 3, 5, 6;
`toolchain-frontier`; `codegen-levers`). The `codegen-levers` lane — which ran without its
safety-classifier review in the original swarm — was additionally constrained to documentation and
peer-repo evidence ONLY: no compiler flags were flipped, no TU was recompiled, `configure.py` and
`build.ninja` were not touched. All verification in this brief was WINE-FREE: no `ninja sha1`,
`ninja rom`, or real carve was run at any point.

## Verdict table

| # | Finding | Lane | Verdict | Reason | Adjusted effort/impact |
|---|---|---|---|---|---|
| 1 | 544B ceiling reframe (3 named ov002/main candidates) | big-function-methodology | PLAUSIBLE | Byte stats re-derive exactly, but the premise (ceiling still unbroken) is stale — briefs 582 and 586 already crossed it (548B, 952B) since the swarm scouted | strategic → tactical; candidates still usable to seed the next round |
| 2 | Evidence-prep protocol + m2c bootstrap blocker | big-function-methodology | PLAUSIBLE | All 3 dossier-error citations and the m2c blocker check out, but brief 582 already adopted `m2c_feed --m2c --context` as standard practice — the "first step" is already executed | high → medium |
| 3 | Pass-ordered 4-pass crack-loop runbook | big-function-methodology | CONFIRMED | Every lever/%/line citation (brief 535, 579, reshape-recipes, gotchas 11/32) reproduces exactly; the proposed doc genuinely doesn't exist yet | unchanged |
| 4 | Peer-validated loop economics (macabeus + chrislewis) | big-function-methodology | CONFIRMED | Both blog posts verified verbatim via WebFetch, but the macabeus half duplicates a citation already in `tool-scout-swarm-2026-06-19.md` — only the chrislewis half + the retriever-building action are new | high → medium |
| 5 | Inline-helper decomposition (unused big-function lever) | big-function-methodology | CONFIRMED | Zero inline defs in src/ confirmed by grep; pokediamond's cited static-inline lines and `-inline on,noauto` flag verified exact | unchanged |
| 6 | Pre-classify walls (frame-size + predication gates) | big-function-methodology | CONFIRMED | Family 4/5 diagnosis and the P-11 range check out at/near cited lines; suggested test subject `ov009:021aaaec` confirmed still parked at 472B | unchanged |
| 7 | Drop b564 ov002 C-queue exclusion | ov002-arm9-strategy | PLAUSIBLE | Citations accurate, PR #1145 genuinely merged, but "only anti-signal is brief-522" is false — briefs 518/519/529/531 document a real, un-cited linker/veneer-avalanche hazard on non-byte-exact ov002 drafts | unchanged; must add the byte-perfect-or-nothing caution before shipping |
| 8 | C-match queue empty, family-census method exhausted | ov002-arm9-strategy | CONFIRMED | Cluster_id byte/% figures reproduce exactly from the live worklist; independently-written mnemonic census corroborates the "can't reach 78% denominator" thesis | unchanged |
| 9 | Singleton re-queue turnkey (INDEX.json candidates) | ov002-arm9-strategy | PLAUSIBLE | Nearly every count reproduces exactly (one function shipped since the snapshot, tracked); one figure ("426 main HIGH ≤128B") does not reproduce under any tried method — real ~524 | unchanged |
| 10 | ov002 MED/E-F KB-anchored, retriage 25/25 tractable | ov002-arm9-strategy | CONFIRMED | Every citation, quote, and both suggested probe candidates (0x022AE718, 0x02216530) verified exact and still uncarved | unchanged |
| 11 | Attempt-provenance column for the re-queue | ov002-arm9-strategy | PLAUSIBLE | brief-512's 0/119 experiment confirmed exact, but "only two briefs ever attempted ov002 C" is false — 6-8 briefs did (498/499/518/519/522/529/531) | hours → high/day; the finding's own "first step" (full attempt range) is more correct than its "what" section |
| 12 | Per-module C% ground truth (ov002 4.5%, arm9 9.9%) | ov002-arm9-strategy | CONFIRMED | Independently built exactly this tool (`progress.py --by-module`, brief 587/PR #1157) — ov002 c_total matches to the byte; arm9's denominator used matched_code instead of total_code, a small methodological slip (9.84% vs claimed 9.9%) | medium/hours → tool-building DONE; only "paste into kickoff" remains |
| 13 | AUDIT: endgame-ledger 61,404B confirmed, live gap 55,540B | r5-claims-audit | CONFIRMED | Independently derived these exact numbers in brief 583, before this swarm ran — the fix is merged (PR #1153); current ledger already IS the byte-derived, corrected version this finding calls for | strategic/hours → DONE, 0 remaining effort |
| 14 | AUDIT: batch_carve returncode conflation, still live post-b577 | r5-claims-audit | CONFIRMED | Same diagnosis independently made in brief 583 — fix (tool-error verdict, "did NOT verify" marker gate) is merged (PR #1153) | high/day → DONE, 0 remaining effort |
| 15 | AUDIT: 544B ceiling crossed by brief 579's 560B match | r5-claims-audit | CONFIRMED | Byte-exact reproduction at both the audited snapshot and live; ceiling has since been crossed twice MORE (briefs 582, 586) since this audit itself was written | strategic/days → DONE (probe already re-run 2x since); ongoing per-shot effort is hours |
| 16 | AUDIT: .thumb routing-tier drop, 4th site in port_to_region.py | r5-claims-audit | CONFIRMED | Same diagnosis independently made in brief 587 — fix (shared `routing_suffixes.py`, exact fold-in the finding recommends) is merged (PR #1157) | medium/hours → DONE, 0 remaining effort |
| 17 | AUDIT: nothing gates main (branch protection) | r5-claims-audit | CONFIRMED | Live `gh api` calls run directly: 404/[]/false confirmed; 17/18 PRs #1129-1146 independently re-counted with failing checks, exact match to both r5 and the scout | high/day → high/hours; the expensive prerequisite (green main) already shipped in brief 584/PR #1152 |
| 18 | AUDIT: four mechanical claims (ninja default, dupe-check, AYXE, AGENTS.md) | r5-claims-audit | CONFIRMED | All 4 sub-claims accurately scouted, but 3 of 4 already shipped in brief 585/PR #1151 (verified by executing the dupe-check repro directly) — only AGENTS.md:18's stale roster text remains untouched | one mechanical wave → single leftover doc-edit PR |
| 19 | objdiff v2.7.1→v3.7.3 bump closes the schema gate | toolchain-frontier | CONFIRMED | All 5 sub-claims hold (schema diffed additive-only at both tags, REPORT_VERSION=2 both, isolated from the sha1 edge); one flag mislabeled ("-f format" is actually pre-existing; the real new flag is "-c/--config") | impact high → medium; doesn't move match-rate, real payoff is diff-accuracy fixes |
| 20 | diff --format json breakage surface (post_edit + suggest_coercion) | toolchain-frontier | CONFIRMED | Both release-note quotes verified byte-exact via WebFetch, but "v3.7.0 restored it" is wrong (restored v3.6.0, broken again differently at v3.7.0); largely restates r5's own already-completed work | unchanged |
| 21 | metroskrew: frozen at 0.1.3, all 5 binaries hash-match | toolchain-frontier | CONFIRMED | Independently recomputed SHA1 on all 5 local toolchain binaries — all match metroskrew's table exactly; core "adopt metroskrew" verdict re-confirms `speedup-research-swarm-2026-07-03.md` | unchanged; impact contingent on Mac wine-lane contention being live (not re-verified) |
| 22 | decomp.dev blocker: PR #1020 never runs `dsd delink` | toolchain-frontier | CONFIRMED | Independently traced `configure.py`'s `objdiff_report` edge — no `delink.yaml` in its implicit deps, confirmed; genuinely novel, zero overlap with any of the 6 prior docs | unchanged; real one-line fix, real silent-failure trap |
| 23 | decomp.dev onboarding decoupled from the objdiff bump | toolchain-frontier | CONFIRMED | Every cited line/regex/cadence claim reproduced exactly; scout mis-cited decomp.dev's actual pinned objdiff-core rev (a pre-v3.0.0 git rev, not v3.7.3) — conclusion (REPORT_VERSION=2 either way) survives | unchanged |
| 24 | Opt-level per-function/TU routing via #pragma | codegen-levers | CONFIRMED | SRA's 7 OPTFLAGS overrides and 5 wirelessManager.c pragma sites verified exact; one sub-claim (wfs.c) cites the wrong pragma (`optimize_for_size`, not `optimization_level`) | unchanged; docs/peer-repo evidence only, no flags flipped |
| 25 | -ipa file missing from CC_FLAGS | codegen-levers | **PLAUSIBLE — DO NOT ACT WITHOUT RECONCILING FIRST** | Flag citations exact, BUT the "non-contradiction" safety check cites a 1-function file as "24 functions" (no file in the tree exceeds 2), AND the finding never checks r4, which already investigated this exact lever and marked it **CLOSED**: "adopting -ipa would break existing matches" | high/hours → medium; first step is now "reconcile with r4's CLOSED verdict," not an A/B test |
| 26 | decomp.me mwcc_30_131 census (~1,400+ scratches) | codegen-levers | CONFIRMED | decomp.me API claims verified LIVE via real browser session (curl/WebFetch get Cloudflare-403'd, a real browser tab clears it) — exact match; SRA's specific "146 unique in-source links" is off (142 unique in src/) and one example citation is wrong | unchanged |
| 27 | Dead-local ballast + same-scalars role-reuse levers | codegen-levers | CONFIRMED | Both SRA in-source comments verified verbatim; confirmed absent from all of recipe-gotchas/codegen-walls/reshape-recipes | unchanged; both peer examples are the SRA dev's own admitted guesswork — generalizability uncertain |
| 28 | (s32)(u16) cast-chain lever for the P-1 wall | codegen-levers | CONFIRMED | FX_SINCOSCAST macro + comment verified at both SRA sites; our P-1 wall citation exact | medium → consider bumping above medium — P-1 is documented as 17/69 (25%) of all drops, the single largest wall class |
| 29 | 2.0 sub-SP probe (sp1p2) for scheduling divergence | codegen-levers | CONFIRMED | SRA's MWCCVER override, in-source comment, AND the cited decomp.me scratch (9f4ui) all verified live and exact; pokeplatinum SP corroboration confirmed | unchanged |

## Already shipped (excluded from the ranking below — no further action needed)

Four findings describe work that is **already merged**, independently converging with this
swarm's own audit from a different angle:

- **#13 + #14** (endgame-ledger, batch_carve returncode) — brief 583, [PR #1153](https://github.com/cntrl-alt-lenny/gx-spirit-caller/pull/1153).
- **#16** (.thumb routing-tier drop) — brief 587, [PR #1157](https://github.com/cntrl-alt-lenny/gx-spirit-caller/pull/1157), including the exact `routing_suffixes.py` fold-in this finding recommended.
- **#12**'s tool half (`progress.py --by-module`) — also brief 587/PR #1157; only its "paste the numbers into a wave kickoff" follow-up remains open.

Also **#15**'s core probe and **#18**'s 3-of-4 mechanical fixes shipped in the interim (briefs
582/586 and 585 respectively) — not by this agent, but by other work landing between the swarm's
scout pass and this verification pass. This is the single clearest pattern across the whole
exercise: **this codebase moves fast enough that "unverified" and "stale" are two different, both
common, failure modes** — several findings were accurate *and* already actioned by the time anyone
got around to checking them.

## Top-8 survivors, ranked by (impact × confidence) / effort

Ranked from the 25 findings that still represent open, actionable work (the 4 already-shipped items
above are excluded — nothing to rank). `#25` (-ipa file) is excluded despite surviving verification,
because it cannot be safely actioned until reconciled against r4's CLOSED verdict — ranking it would
misrepresent it as ready to pick up.

1. **#8 — Retire family-census C-match queueing; re-scope to singleton queueing.** CONFIRMED, high
   impact (stops the campaign wasting cycles on a structurally-exhausted method covering only 2.5-3%
   of the two biggest modules' bytes), hours effort (one doc-header edit).
2. **#17 — Add the branch-protection ruleset.** CONFIRMED, high impact (closes the "red is the
   baseline" integrity gap), now just hours — the expensive prerequisite (green main) already
   shipped.
3. **#28 — (s32)(u16) cast-chain probe on the P-1 wall.** CONFIRMED, potentially the single highest
   upside item on this list — P-1 is 25% of all documented walls — for one direct-mwcc compile
   test.
4. **#22 — Fix the decomp.dev delink blocker.** CONFIRMED, one-line `configure.py` fix, unblocks an
   entire onboarding effort that's otherwise ready.
5. **#5 — Validate the inline-helper lever.** CONFIRMED, cheap byte-gated single-TU test, opens a
   lever class the campaign has never used — and it's the difference between "matched C" and the
   campaign's actual deliverable, readable C.
6. **#3 — Write the 4-pass big-function crack-loop runbook.** CONFIRMED, day-scale, but every future
   big-function attempt compounds off it — pure distillation of levers already proven in briefs 535
   and 579.
7. **#10 — Draw the 544B-probe's next candidates from the ov002 25/25 KB-anchored retriage list.**
   CONFIRMED, both suggested candidates (0x022AE718, 0x02216530) still uncarved and pre-cleared on
   comprehension — directly de-risks the next ceiling round.
8. **#6 — Land the prologue-first frame-size diff gate + shared-temp/union probe on ov009:021aaaec.**
   CONFIRMED, names the cheapest possible test subject (a fully-diagnosed, still-parked 472B pair)
   and could un-park it directly.

## Synthesis

This swarm's scout lanes were factually disciplined — zero of 29 findings were refuted outright, and
nearly every specific number, line citation, and external quote reproduced almost exactly under
independent adversarial re-derivation. What verification actually surfaced was staleness, not
error: four findings describe bugs already fixed and merged (three by this agent's own prior briefs,
converging independently with the swarm's audit), and several more had their premise partly
overtaken by other work landing in the same window. The one genuinely load-bearing catch is `#25`
(`-ipa file`): its safety argument rests on a fabricated "24-function" test file that's actually
1 function, and it silently ignores a prior brief that already investigated and **closed** this exact
lever as match-breaking — a live, unresolved contradiction that must be reconciled before anyone
acts on it, not a green light. The practical lesson for future swarms: a scout's "unverified" finding
against a fast-moving tree has a shelf life measured in days, not weeks — verification should run as
close to the scout pass as possible, and every finding needs an explicit prior-art check, not just a
novelty grep, before it's trusted as a genuine gap.

🤖 Generated with [Claude Code](https://claude.com/claude-code)
