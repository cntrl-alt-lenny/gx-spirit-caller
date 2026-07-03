# GX Spirit Caller — Ranked Speed-Up Report (Verified Findings Synthesis)

**Date:** 2026-07-03 · **Scope:** 30 verified findings ranked by `(expected campaign impact × confidence) / effort`, grouped by pain point. All findings below survived adversarial verification; corrections from verification are folded in (several findings' original claims were adjusted — noted inline). Campaign context: ~360 EUR functions matched, ~5,800 `.s` remaining, C-match wave campaign live, byte-identical ROM gate (`ninja` sha1) is non-negotiable.

---

## TL;DR — the five moves for this week

| # | Move | Pain | Effort | Why now |
|---|------|------|--------|---------|
| 1 | Cherry-pick objdiff PR #359 (1-line ARM panic fix) onto pinned 2.7.1 | 3 | ~1 hr | Kills the ~20-unit filter permanently; unblocks full report coverage, which gates everything in pain 5 |
| 2 | `dsd sig new-elf` + `sig apply --dry` propagation loop | 4 | ~half day | Already in the pinned binary; smoke-tested end-to-end during verification (found an unnamed JPN sibling in seconds) |
| 3 | Ingest sm64ds-decomp's mwccarm codegen catalog into agent playbooks | 2 | ~1 day | 4,400-pair empirical lever catalog from the closest sibling project in existence; knowledge is drop-in, re-verify per-prior vs 2.0/sp1p5 |
| 4 | xMAP side-branch telemetry (pokeplatinum pattern, run locally post-`ninja rom`) | 1 | ~2 hrs | `build/{region}/arm9.o.xMAP` already exists; one hook gives `git diff` layout-avalanche forensics |
| 5 | metroskrew native-Linux mwccarm for the Codex/CI fleet | 6 | ~1–2 days | Byte-hash verified against our exact `decomper/tools/mwccarm` binaries; breaks the Windows-box compile bottleneck |

Sixth, owner-gated: **unpark decomp.dev issue #1022 / draft PR #1020** — the integration is already fully prepped in-repo; it's blocked only on owner steps (push private image, merge, register), not engineering.

---

## Ranking method

Score = (Impact × Confidence) / Effort, judged qualitatively:
- **Impact**: does it speed the core loop (matches/week) or a support loop (tracking, CI)?
- **Confidence**: all findings are verified-real; confidence here means *confidence it helps THIS campaign*, post-verification-caveats.
- **Effort**: hours / days / weeks, using the verifier's corrected estimate, not the finding's original claim.

Tiers: **S** = do this week · **A** = do this month · **B** = opportunistic / bundle with something else · **C** = marginal, monitor or skip.

---

## Master ranking

| Rank | Tier | Finding | Pain | Impact | Conf. | Effort (corrected) |
|------|------|---------|------|--------|-------|--------------------|
| 1 | S | objdiff PR #359 panic fix (cherry-pick to 2.7.1) | 3 | Med-High | Very high | Hours |
| 2 | S | dsd sig new-elf/apply propagation loop | 4 | Med-High | Very high (smoke-tested) | Half day |
| 3 | S | sm64ds-decomp codegen catalog + lever notes | 2 | High | High (priors need 2.0 re-verify) | 1 day |
| 4 | S | xMAP side-branch layout telemetry | 1 | Medium | Very high | Hours |
| 5 | S | metroskrew Linux-native mwccarm | 6 | High | Very high (hash-verified) | 1–2 days |
| 6 | A | Unpark decomp.dev (#1022/#1020) + server-rendered badges | 5 | Medium | High | Owner steps + small CI work |
| 7 | A | objdiff v3.7.2 upgrade + oneshot JSON diff mode | 3, 6, 2 | Med-High | High | Days (re-validate `suggest_coercion.py`, re-baseline match%) |
| 8 | A | Ghidra BSim (H2, headless) + dsd-ghidra sync | 4, 2 | Med-High | High | 2–3 days |
| 9 | A | "Long Tail" playbook — corrected takeaway: plain opcode-Levenshtein neighbor scheduling + exemplar prompts | 4, 6 | Medium | High | 1–2 days scripting |
| 10 | A | zeldaret/ph CI recipe + dtk-template private-container doc | 5, 6 | Medium | High | Days (subsumed by #6 — same pattern, exact stack) |
| 11 | B | objdiff-cli `report changes` PR-delta bot | 6, 5 | Medium | High (pain-1 gate claim corrected: won't fire pre-link) | Days |
| 12 | B | coddog cluster/compare-n | 4 | Medium | Medium (NDS path parses ARM as Thumb — exact clones only until upstream PR) | Days + small upstream PR |
| 13 | B | melee-decomp harness (claim/SQLite/worktree layer only) | 6 | Medium | Medium | Days to borrow patterns |
| 14 | B | Nigel task-queue orchestrator | 6 | Medium | Medium (Windows blocker: needs WSL or executor patch; "Claude hooks" claim was false) | Days on WSL |
| 15 | B | Kappa ast-grep AST-transformer plugins (encode the ~20 reshape levers) | 2 | Med-High if it works | Medium | Weeks (standalone @ast-grep port, not the extension) |
| 16 | B | ds-decomp PR #60 test vs issue #58 + report upstream | 1 (future) | Low now, Medium later | High | Hours to test, don't bump pinned v0.11.0 |
| 17 | B | NSMB self-hosted Windows runner (alt path to #6) | 5, 6 | Medium | High | Days + security hardening for agent PRs |
| 18 | B | ghidriff pairwise sweeps (overlay-vs-overlay, region-vs-region) | 4, 6 | Low-Med | Medium (ELF import path verified; no raw-bin loader) | Days |
| 19 | B | Mizuchi (steal architecture: Claude-runner loop, failure-context prompts, Atlas embeddings) | 6, 2, 4 | Medium | Medium | Weeks |
| 20 | C | decomp.me scratch loop (browser/GUI only — Cloudflare 403 blocks headless) | 2, 6 | Low-Med | Medium | Drop-in but manual |
| 21 | C | decomp.me DB dump via Discord (corpus mining) | 2, 4 | Unknown yield | Low-Med | Social step + mining work |
| 22 | C | decomp-me-mcp MCP server | 6 | Low | Low (Cloudflare cookie churn, dormant) | Days of fragility |
| 23 | C | rizin rz-sign / FLIRT | 4 | Low | Medium (overlaps dsd sig + existing hashing) | Days |
| 24 | C | BinDiff + BinExport | 4 | Low | Medium (pairwise, Ghidra tier-4, stale extension) | Days |
| 25 | C | QBinDiff similarity-matrix API | 4, 6 | Low | Medium (DIY drive, quiet upstream) | Weeks |
| 26 | C | decomp-permuter re-benchmark | 2 | Low | Medium (#160 rule mischaracterized; plateau classes unchanged) | Hours (existing WSL harness) |
| 27 | C | frogress fallback | 5 | Low | High it works, low it's needed | Admin-dependent |
| 28 | C | Decompedia (docs; contribution opportunity) | 2, 4 | Low | High | Hours |
| 29 | C | Data-symbol diffing v3.1–3.4.4 | 1 | Low standalone | Medium (mostly GUI; CLI exposure unverified) | Bundled with #7 |
| 30 | C | SLaDe neural decompiler | 2 | Very low | Low (GCC-trained; ARM32-vs-AArch64 unresolved) | Skip; keep the LLM4Decompile negative result |

---

## Grouped by pain point

### Pain 1 — Layout avalanche

- **xMAP side-branch telemetry (rank 4, S).** The build already emits `build/{eur,usa,jpn}/arm9.o.xMAP` (~95.7k lines EUR). pokeplatinum's pattern — commit the map to a dedicated branch on every green build (normal commits, *not* force-push; that's what makes the history diffable) — gives agents a one-command `git diff` answering "what shifted, how far" for park-vs-pursue calls. Correction from verification: our CI deliberately never builds the ROM, so this is a **local post-`ninja rom` hook**, not a CI step, until #6 lands.
- **ds-decomp PR #60 (rank 16, B).** The roundtrip build-ROM-and-compare diagnostic is the useful near-term piece; the overlay-grouping rewrite matters for future re-init, not the live campaign. Test the PR branch against our own issue #58 repro and post results upstream while the PR is malleable — cheap, and it either confirms a free fix in the next release or hands the author a repro. Do **not** bump off pinned v0.11.0 now (generated output changes).
- **Honest note:** the `report changes` "avalanche gate" idea from the findings was **debunked in verification** — reports compare per-object *pre-link* with target-side sizes, so untouched units don't drift in reports when a touched unit changes length. The ROM-level avalanche detector remains the sha1 gate + xMAP diff. Nothing in this batch materially improves size-exact codegen itself; the closest thing is better priors (pain 2).

### Pain 2 — Slow manual reshaping to mwccarm codegen

- **sm64ds-decomp catalog (rank 3, S).** See top-5 below.
- **Ghidra BSim (rank 8, A).** Not just clone detection: because BSim vectors exclude registers and constants, siblings-by-BSim are exactly the functions where a cracked reshape recipe transfers. Amplifies every lever discovered.
- **Kappa's AST-transformer pattern (rank 15, B).** The genuinely novel idea: encode our ~20 documented ov-drain levers (min-as-if-assign, bind-call-result-to-temp, orr-shifted-operand-first, :4-bitfield→shift-pair, …) as deterministic `@ast-grep` C rewrites tried *before* spending agent tokens. Verification confirmed the plugin machinery is real and usable standalone outside VS Code; the Agent Mode itself is Copilot-wired — don't adopt the extension, port the pattern. Weeks of work, so B-tier, but it's the highest-ceiling pain-2 item after the sm64ds notes.
- **decomp.me scratch loop (rank 20, C).** Real (our compiler = hosted `mwcc_30_131`, confirmed in our own BUILD.md), but Cloudflare 403s headless access. Usable as a *human/browser* handoff channel for stubborn misses; not a CI primitive. Marginal.
- **decomp-permuter re-benchmark (rank 26, C).** Verification found the promising-sounding #160 rule is a GCC-2.8.1-targeted draft, not the mwcc reshape analog. The 0-recovery result plus the "Long Tail" author independently *removing* permuter from his pipeline is two campaigns' worth of evidence. Spend at most a few hours re-running 20 near-misses on the existing WSL harness; expect nothing.
- **SLaDe (rank 30, C).** Skip. The one actionable output is negative knowledge: **LLM4Decompile cannot ingest ARM** — don't let any agent waste time on it. (Correction: SLaDe weights *do* exist on Zenodo, but GCC-trained + 1024-token limit + unresolved ARM32-vs-AArch64 question = not worth the download for a frontier-LLM campaign.)

### Pain 3 — objdiff report-generate panics

- **PR #359 cherry-pick (rank 1, S).** See top-5 below.
- **objdiff v3.7.2 upgrade (rank 7, A).** 20 stable releases of ARM fixes (unarm 2.0, `.word` boundary fixes, size inference, THM relocations, big diff perf win at our 3,330-unit scale). Config/report schema verified compatible; `OBJDIFF_VERSION` lives at `tools/configure.py:74` and v3 asset names are unchanged. Two verified gotchas: (a) #352 still reproduces on v3.7.2, so carry the #359 patch forward; (b) `tools/suggest_coercion.py` consumes `diff --format json`, which was removed in v3.0 and restored *with a different schema* in v3.6 — re-validate before switching. Expect match-% to shift from size-inference changes; re-baseline.
- **Secondary follow-up (free upstream goodwill):** PR #359's author suspects dsd emits objects missing `$a/$t/$d` ARM mapping symbols on data-only `.text`. Check one of our panic-list delinked ELFs; if confirmed, file it on ds-decomp — fixing at the dsd layer makes stock objdiff work for every dsd project.

### Pain 4 — Clone detection / propagation

- **dsd sig (rank 2, S).** See top-5 below. Key verified scope limit: it's a *cross-region / cross-overlay unique-propagation* tool, **not** an intra-binary family fan-out tool — it refuses on multiple matches. But that refusal is itself a free clone-family detector.
- **BSim + dsd-ghidra (rank 8, A).** The fuzzy complement: stock Ghidra 11.x, file-backed H2 DB, headless `bsim` CLI (3 commands), register/constant-blind clustering over all 5,800 remaining funcs. dsd-ghidra v0.6.0 pins ds-decomp 0.11.0 — our exact version — and syncs our `config/eur/arm9/config.yaml` boundaries/symbols in, so clustering runs on correct function boundaries. Caveats: prebuilt zip targets Ghidra 11.2.1; SyncDsd needs a trivial patch (GUI config-chooser → script arg) for headless use.
- **"Long Tail" corrected recipe (rank 9, A).** Verification *inverted* the finding's headline: the author's fancy composite scorer was self-described as overcomplicated — **plain opcode-Levenshtein over normalized mnemonics performed at least as well**. That's cheaper than what the finding proposed: a day of scripting over the c-match-prep normalized dumps to give every unmatched function its nearest already-matched neighbor, used for (a) scheduling agents family-by-family, (b) in-prompt worked exemplars. ~360 matched EUR funcs + 4,300 ported ships = seed corpus.
- **coddog (rank 12, B).** NDS support is real but verification found the NDS path routes **all** code through `parse_thumb` — our 4-byte ARM-mode output is deterministically misparsed. Exact-byte clones still cluster (identical bytes → identical misparse); near-clone recall will be poor. Test on a known clone family first; the upstream fix (route ARM symbols through unarm's ARM parser) is a small, well-scoped PR to a responsive maintainer (ethteck). Worth doing for `compare-n` across EUR/USA/JPN when the port lane resumes.
- **ghidriff / BinDiff / QBinDiff / rizin (ranks 18, 23–25, C/B).** All real, all verified, all *pairwise or masked-exact* — they overlap heavily with dsd sig + existing byte-normalized hashing + (if adopted) BSim. Honest call: adopt at most one, and only after BSim, and only if a concrete need appears (e.g. ghidriff's JSON output for CI twin-verification before assigning a port). Don't stand up four Ghidra-adjacent pipelines.

### Pain 5 — Progress tracking

- **Unpark #1022 (rank 6, A).** The single most important verification result in this group: **the decomp.dev integration is already fully prepped in this repo** — issue #1022 + draft PR #1020 contain the Dockerfile, CI workflow, and `docs/decomp-dev-setup.md`. It's parked on three owner steps: push the private build image to GHCR, merge #1020, register at decomp.dev/manage/new. The zeldaret/ph workflow (same dsd author, same exact stack, verified line-by-line) and the dtk-template `github_actions.md` doc are the reference implementations of the same private-container pattern #1020 uses. Multi-version `{version}_report.json` in one artifact is confirmed supported (commit 95bd534e), so eur/usa/jpn reports ride one artifact. Once ingesting, the server-rendered badge URLs (`decomp.dev/{owner}/{repo}.svg?mode=shield`) replace the README-SVG-in-CI hack — but note the corrected claim: badges don't eliminate the baserom problem, they *relocate* it into CI report generation, which is why #359 (rank 1) and the private container are prerequisites.
- **NSMB self-hosted runner (rank 17, B).** Proven end-to-end alternative if the private-container path stalls (and the only path giving native-Windows mwccarm in CI). Security caveat is real: a self-hosted runner executes agent-authored PR code — gate with labels/environment approval.
- **frogress (rank 27, C).** Verified alive and ingesting, but: dormant codebase, needs an admin (ethteck) to hand-create the slug, and it does **not** chart (API-only storage — the finding's "charted" was wrong). Only relevant if decomp.dev onboarding fails, which nothing suggests it will.

### Pain 6 — Multi-agent CI / automation

- **metroskrew (rank 5, S).** See top-5 below.
- **oneshot JSON diffs (part of rank 7, A).** `objdiff-cli diff` one-shot JSON (v3.6, hardened v3.7) gives agents per-symbol, per-instruction structured diffs — automated near-miss classification (register-swap vs operand-order vs literal-pool) instead of TUI scraping. The motivating upstream issue (#300) literally describes our use case. Requires the v3 upgrade; keep unit filters (same #352 code path).
- **`report changes` PR bot (rank 11, B).** Verified live *on our own reports with our own pinned binary*. Post per-function fuzzy-%/size deltas as PR comments via github-script — works today, before decomp.dev onboarding. Just don't sell it as an avalanche gate (see pain 1 correction).
- **Nigel / melee-decomp / Mizuchi (ranks 13–14, 19, B).** Three independent verified reference architectures for exactly our campaign shape. None is adoptable wholesale (Nigel: hardcoded Unix syscalls, won't compile on native Windows — WSL or a small executor patch; melee: dormant, Melee-hardcoded modules; Mizuchi: needs mwccarm wiring + our containment gate). The *patterns* worth stealing, in priority order: (1) Nigel's "task only counts as done if the candidate disappears from the source of truth" + verify-gate + auto-reset — the mechanized version of our hard-learned "trust durable pushes, not agent claims" rule; (2) melee's claim/lock + SQLite completion DB + per-agent worktrees for collision-free waves (directly relevant given the b497 worktree-repurposing incident); (3) Mizuchi's failure-context retry prompts. A day or two encoding these into the existing wave scripts likely beats adopting any of the three tools.
- **decomp-me-mcp (rank 22, C).** The parallel-agent claim/release mechanism is a nice design, but Cloudflare cookie churn (manual `cf_clearance` harvesting, IP/UA-bound) makes unattended use fragile. Skip unless decomp.me access is solved some other way.

---

## Top 5 — how we'd adopt each this week

### 1. objdiff #352 panic fix (PR #359) — pain 3, ~1 hour

Clone `LagoLunatic/objdiff` branch `emptymapping` (head `e28a2021`), cherry-pick the single `objdiff-core/src/arch/arm.rs` commit (+1/−1: substitute `fallback_mappings` when a section's mapping-symbol list is empty) onto the **pinned v2.7.1 tag** — safer than jumping to v3.7.2 in the same change — and `cargo build --release -p objdiff-cli`. Drop the resulting exe over the pinned binary in the toolchain, run `report generate` over the previously-filtered ~20 units, and delete the filter from the ninja report edge once all three regions generate clean. Then two 10-minute upstream follow-ups: comment on encounter/objdiff#352 confirming the patch fixes a real project (nudges the merge), and inspect one of the formerly-panicking delinked ELFs for missing `$a/$t/$d` mapping symbols — if absent, file against ds-decomp, since that's the root cause per the PR author. This is rank 1 not because the panic is the biggest pain but because it's an hour of work that unblocks full report coverage, which is the prerequisite for the entire pain-5 chain (#1022 → decomp.dev → badges).

### 2. dsd sig propagation loop — pain 4, ~half day

Everything needed is already installed: `decomper\dsd.exe` is v0.11.0 with `sig new-elf` / `sig apply`. Script the loop: for each matched function, `dsd sig new-elf -i build/eur/src/<module>/<Func>.o -f <Func>` (must be the **per-TU relocatable .o** — the linked `arm9.o` panics, verified), then `dsd sig apply -c config/{usa,jpn}/arm9/config.yaml -s <sig>.yaml --dry` and likewise across the 27 overlay configs. `--dry` makes the first pass a zero-write clone census. Triage the output three ways: unique hits → apply for real (auto-naming USA/JPN/overlay siblings — verification demonstrated this live, finding the unnamed JPN sibling of `SysWork_GetPointDistance` at 0x02018ef8 in seconds); "multiple matching functions" refusals → log as intra-binary clone families to feed the c-match wave scheduler (crack one, the rest are known near-free); no-hit → nothing lost. Two guardrails from adversarial testing: skip trivially small functions (single `bx lr` sigs are non-unique), and post-process propagated names whose relocation targets carry `func_<EUR-addr>` placeholders — applying those cross-region reintroduces the name≠addr drift class b483 fixed. Run a drift pass after each apply wave.

### 3. sm64ds-decomp codegen catalog ingestion — pain 2, ~1 day

Pull `notes/mwccarm-codegen.md`, `notes/research-matching-levers.md`, `notes/pret-idioms.md`, and `notes/crack-loop-runbook.md` from `bmanus2-dotcom/sm64ds-decomp` (active as of today, 68.8% matched, 4,400+ byte-exact pairs behind the catalog). Day plan: (1) diff their lever list against our own ov-drain memory catalogue — expect large overlap plus genuinely new priors (deref-vs-index form flipping r0/r1 ordering, ip/r12 coloring rules — ~8.5% of funcs, never live across `bl` — and pool-load hoisting under `-O4,p`); (2) for each *new* lever, write a 5-minute empirical check against our mwccarm 2.0/sp1p5 on a known function — **this step is mandatory**, they're on 1.2/sp2p3, a full compiler generation away; (3) fold the survivors into the C-match agent brief template as ranked priors. Also internalize their meta-finding, which recalibrates pain 2 itself: regperm-only misses are *rare* (~5/module) — most misses are structural (types/offsets), which means agent effort should go to structure-first diagnosis, not register fiddling. Their `triage.py`/`coloring.py` are recipes to reimplement, not code to run (project-specific imports).

### 4. xMAP layout telemetry branch — pain 1, ~2 hours

Create an orphan branch `xmap` in the decomper repo. Add a post-build step to the local wave workflow (wrapper script or ninja edge after `ninja rom` goes green): normalize each `build/{eur,usa,jpn}/arm9.o.xMAP` into a stable `symbol addr size` dump (strip noise that churns without meaning), commit all three to the `xmap` branch with the matching main-branch SHA in the message, push. From then on, when a candidate C changes byte-length, `git diff xmap~1 xmap` shows exactly which function's size delta cascaded where — turning park-vs-pursue from "re-derive from the ROM diff" into a one-command read for both the brain and the workers. Costs nothing ongoing, uses an artifact the linker already emits, and becomes the evidence base for any future delink-tolerance work. When #6 (CI baserom) lands, lift the same step into CI as pokeplatinum does (append commits, not force-push — the history is the point).

### 5. metroskrew Linux compile fleet — pain 6, ~1–2 days

Verification did the risky part already: **sha1 hashes of all four binaries in `decomper/tools/mwccarm/` match metroskrew's supported table exactly** (mwccarm 2.0/sp1p5 `6153c610`, both legacy 1.2 tiers, and mwldarm; mwasmarm covered too) — so every compiler tier in our per-TU routing runs natively on Linux, no wine, no wibo PE-loader layer. Adoption: on one Linux host (WSL counts), clone metroskrew, `make skrew` against a copy of our `tools/mwccarm` tree (pokeplatinum's `get_metroskrew.sh` + v0.1.3 release is the copyable recipe), then validate the gate that matters: build one region end-to-end and confirm **ninja sha1 byte-identity**, not just successful compiles. If green, two payoffs unlock: Codex workers get compile+objdiff verification on whatever Linux they can reach instead of queueing on the Windows box, and hosted ubuntu GitHub runners become viable for #6's CI (private container carries the compiler EXEs — same licensing posture as the repo today). Treat upstream as stable-frozen (dormant since May 2025, but in pret production CI); pin the release.

---

## Honest assessment of the marginal findings

- **decomp.me anything (ranks 20–22):** the compiler hosting is real and exact-match, but Cloudflare turned the whole surface manual. Until that changes, it's a human-handoff channel, not automation. The Discord DB-dump is a lottery ticket — solved-nds_arm9-mwcc2.0 corpus size is unverifiable from outside.
- **The pairwise-differ pile (ghidriff, BinDiff, QBinDiff, rizin):** all verified real; all solve a problem that dsd sig + BSim + opcode-Levenshtein cover between them. Adopting more than one of these is tool-collecting, not campaign acceleration.
- **decomp-permuter:** three independent data points now (our 0 recoveries, sm64ds's assessment, Long Tail's removal) say permuters don't pay on this class of target. Cap any re-benchmark at an afternoon.
- **SLaDe / neural decompilers:** the deliverable is the negative result (LLM4Decompile can't do ARM; SLaDe is GCC-trained with an unresolved ARM32-vs-AArch64 question). Encode that in agent briefs so nobody burns a session on it.
- **ds-decomp PR #60:** high future value, near-zero present value — the project is initialized and byte-identical; the campaign never re-runs `dsd init`. The hour spent testing it against #58 is upstream citizenship + insurance, priced accordingly.
- **Data-symbol diffing (v3.1–3.4.4):** rides along with the v3 upgrade for free, but the per-data-symbol view is primarily GUI; don't build a containment gate on it until CLI exposure is smoke-tested.
- **Decompedia:** docs, not tooling. The one concrete use: its NDS census (TWEWY, FE11, + pret DS projects) is the target list for cross-project SDK/libc clone imports once coddog's ARM parse is fixed. Contributing our lever catalogue back is goodwill that also makes future agent web-lookups self-serving — do it in downtime.

## Cross-cutting cautions

1. **Compiler-generation drift:** every codegen prior imported from sm64ds (1.2/sp2p3) or GBA-land must be empirically re-verified on 2.0/sp1p5 before entering agent playbooks. Budget the verification, or the playbook poisons itself.
2. **Match-% re-baselining:** the objdiff v3 upgrade changes ARM size inference; snapshot reports before/after and re-baseline dashboards in the same PR, or trend lines lie.
3. **Gates don't move:** every new tool above is exploration/triage machinery. The merge gate stays `ninja` sha1 byte-identity + containment. Scratch-%, fuzzy-%, BSim similarity, and sig hits are scheduling signals only.
4. **Self-hosted runner security:** if the NSMB pattern is ever used, agent-authored PR code executes on the host — require label/environment approval before the runner picks up a PR.
5. **Version pins are load-bearing:** #359 goes onto 2.7.1 first; v3.7.2 is a separate, re-baselined change; dsd stays at v0.11.0 until PR #60 merges *and* a release exists *and* the re-init diff is understood.
