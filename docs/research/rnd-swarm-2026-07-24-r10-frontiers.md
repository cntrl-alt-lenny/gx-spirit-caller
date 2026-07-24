# R&D Swarm Meta-Synthesis — Round 10: New Frontiers (2026-07-24)

**Method:** 12 lenses, refute-by-default, deduped vs r3–r9. **59 findings raised, 25 survived** adversarial verification (each independently reproduced against live repo state — brain HEAD 5e0fa4fd). **This round hunts UNWORKED frontiers** — data decompilation, type/struct recovery, symbol naming at scale, cross-region port leverage, and readable-C quality — **not** the exhausted function-match, wall-audit, or rate/targeting lanes prior rounds already mined.

## The frontier map

Candidate new lanes, ranked by size × tractability × rate-of-number-movement:

| # | Frontier | Size | Tractability | Number-movement (today) | Verdict |
|---|---|---|---|---|---|
| 1 | **Cross-region port backlog** | 340 turnkey ports (26 KB readable, +0.55 pt ×2) | **Maximal** — verifier drove it end-to-end, full USA rebuild = sha1 OK, gate stays green | **Highest measured** — closes ~44% of the 1.26-pt EUR gap at day-effort | **OPEN NEXT** |
| 2 | **Data retype** | 501 KB / 245 record-shaped blobs | High (byte-identical by construction) — gated on metric-fix + codegen canary, both hours | 0 today (metric-blind); huge once unblocked | Biggest new chapter; 2 cheap prereqs |
| 3 | **Naming at scale** | 499-fn DWC subtree + 232 string-ref fns; ~3,683 unnamed matched fns | High — byte-neutral, cannot regress the gate | Moves soft "named %"; needs peer clone + seed | Byte-neutral, sha1-gated |
| 4 | **Types / headers** | 2,040 protos, 463 conflicts, empty `include/` | Medium — enabler; 142 ABI-significant are gate-bound | Indirect (unblocks matches + quality) | Substrate for 1–3 |
| 5 | **Readable-C quality** | 309 safe headers + opacity scorer | High, build-free | 0 until a readability metric exists | Measurement-enabler |

**Open cross-region next.** It is the only lane a verifier drove all the way through — `port_to_region` → flip `.s`→`.c` → full USA rebuild → `gx-spirit-caller_usa.nds: OK` (sha1-identical), then reverted clean — so its +0.55-pt × 2-region lift (~44% of the EUR gap) is proven-executable at day-effort with near-zero gate risk. The bigger long-run chapter is **data** (501 KB surface, self-oracle `.inc`, feeds m2c → more matches), but it moves *zero* numbers until two hours-effort prerequisites land — the typed-array metric fix and the CharParam+PresentCard codegen canary — so run those two in parallel to unlock it while cross-region ships. Caveat on #1: cross-region ports are DERIVATIVE under the standing phased-EUR-first strategy; treat this as a cheap, gate-safe harvest that runs alongside EUR work, not a pivot away from the EUR frontier.

## Top frontier bets (ranked)

**1. 170-fn HIGH-confidence turnkey port backlog per region — 340 free byte-verified ports** *(cross-region, S)* — Realized port rate is already 79–82% (above the "72–77% ceiling" the prior map cited), and an enumerated 170/region byte-sim≥0.99 backlog remains; a verifier ran port_to_region → flip → full USA rebuild → `usa.nds: OK`, then reverted. +0.55 pt USA & JPN each, ~44% of the 1.26-pt EUR gap; concentration main ~111–132, ov002 ~42–45, ov008 8. *Action:* sweep `port_to_region.py --confidence-floor HIGH` over the 170, then `gate3.py --scope all`; start main+ov002. *Effort:* day.

**2. CharParam+PresentCard `.inc` oracle — 2 byte-VERIFIED arm9 retypes + the codegen canary** *(data, S)* — BSC `.inc` fragments with per-struct-stride padding byte-match `data_020b5b80` (CharParam 96×7 s8) and `data_020b5e20` (PresentCard 71×[3][10] s16), an adjacent baked cluster, both shipping opaque today; parsed .inc == shipping dump == unique arm9.bin bytes. Zero struct-typed data array exists repo-wide, so this doubles as the mwcc struct-array codegen canary. *Action:* retype as structs from the .inc initializer, gate on 3-region sha1, run FIRST. *Effort:* hours.

**3. Named-struct sub-tier for the typed-array metric — retype is invisible until fixed** *(data/quality, A)* — `_DATA_ARRAY_DECL_RE` matches the opaque carve placeholder identically to a real struct array, so `summarize_data_readability` (1.69%) holds 0 B of genuinely struct-typed data; retyping the oracle moves it by 0. *Action:* add a named-struct tier excluding primitive-element arrays; land it BEFORE scaling retype. *Effort:* hours.

**4. Ship the empty, already-wired `include/` shared-header layer** *(types, A)* — `-i include` is on all 4 mwcc rules yet `include/` holds only `.gitkeep`; 63 headers are all `ovNNN_core.h`, main-arm9 has 0. *Action:* create `include/game/{types,prototypes}.h` + per-module `*_core.h` as the canonical home — no configure.py edit needed. Do this FIRST; it is the substrate bets 5/8 write into. *Effort:* hours.

**5. Canonical `prototypes.h` — 463 conflicting inline externs, 142 ABI-significant** *(types, S)* — 4,712 extern decl-sites for 2,040 fns (2,672 pure duplicates), 463 with contradictory signatures (`func_ov002_021ff320` = 17 sigs / 21 files); 142 ABI-significant contradictions block first-try byte-match. *Action:* emit one canonical prototype per fn into the new header; prioritize the ~30 declared >20 ways, then the 142 ABI-significant. *Effort:* days.

**6. Wire the built-but-idle SDK/DWC naming pipeline vs a 499-fn GameSpy subtree** *(naming, S)* — The full external-oracle toolchain exists but never ran (no `nitro_dict.json`); in-ROM `__FILE__` strings attribute 80 placeholders to specific files, and the span 0x02053c34–0x0206b47c holds exactly 499 fns, 0 named. Byte-neutral (symbols.txt only → cannot regress the gate). *Action:* vendor peer sources → fingerprint index → `rename_symbol.py --cascade` only under triple-agreement (in-ROM file-string + peer fingerprint + public API). *Effort:* days.

**7. Byte-neutral LLM naming loop gated by `ninja sha1`** *(naming/external, S)* — A rename edits `symbols.txt` not bytes (brief 492), so the 3-region sha1 gate is a *free deterministic safety verifier* no external tool (ReSym/GenNm/DIRTY, on non-recompilable output) possesses; ~3,683 matched-but-unnamed EUR fns (ov002 alone = 1,024). *Action:* `naming_llm.py` proposes ModuleName_Verb from {body, caller/callee names, comments} → `--cascade` → accept only sha1-clean batches; start arm9+ov002. *Effort:* days.

**8. `build_struct_bank --verify` — prove-by-rebuild closes the open oracle loop** *(types/strategy, S)* — The miner emits UNVERIFIED headers (0 ninja/sha1 calls); its 2 mined structs have 0 usages while the hand-derived applied structs are sha1-proven. Retype accessors → one `ninja sha1` proves the layout across all 3 regions at once; batch_sha1's bisection pins the wrong field on failure; each proven struct feeds m2c `--context` → more matches. *Action:* add `--verify` mode, seed on ov002_core.h's field-evidenced symbols. *Effort:* days.

## data

### S

**CharParam+PresentCard .inc oracle: 2 byte-VERIFIED arm9 retypes, shovel-ready** — BSC `.inc` fragments packed with per-struct-stride padding byte-match `data_020b5b80` (CharParam, 96×7 s8 = 672B) and `data_020b5e20` (PresentCard, 71×[3][10] s16 = 4260B); adjacent contiguous cluster (0xB5B80+0x2A0=0xB5E20), both currently shipping as opaque `const unsigned char[N]`. Independently re-verified: parsed .inc == shipping dump == unique arm9.bin bytes. Load-bearing: flat concat fails at `{-1}` sentinel rows — per-struct zero-pad is mandatory. **Action:** retype as `EventCharParam[96]`/`PresentCard[71]` structs using the .inc as initializer; run FIRST as the mwcc struct-codegen canary; gate on 3-region ninja sha1. **Effort:** hours.

### A

**Volume lane sized: 939 record-shaped blobs = 501KB, 46% of mass in 74 >1KB blobs** — 71% of the 704,875 placeholder data-bytes are ≥64B record-array-shaped; retyping the ~245 largest (74 >1KB + 171 in the 257–1024B band) captures the bulk of the surface. Plus 221 raw `data_*.s` blobs that don't even count toward the metric (carve-to-.c = pure gain). The .inc oracle covers only 2–3 of these; the rest need `build_struct_bank.py` stride/width/signedness inference (pointed at ONE header to date). **Action:** run `build_struct_bank.py` on the 74+171 tier + the 41-symbol arm9 BSC cluster; carve the 221 `.s` blobs. **Effort:** days.

**Typed-array metric counts ZERO structured bytes — retype is currently invisible** — `summarize_data_readability` (1.69%, 80,740B) holds 0B / 0 TUs of genuine struct-typed arrays; `_DATA_ARRAY_DECL_RE` matches the opaque carve-placeholder `unsigned char data_X[N]=` identically to a real struct array, so it measures "has any []-decl" = the goal state. Consequence: retyping the oracle (S) moves the metric by 0 — type-recovery is invisible to the metric built to measure it. **Action:** add a named-struct sub-tier excluding primitive-element arrays; land it BEFORE scaling retype so the chapter is scorable. **Effort:** hours.

**Per-hour economics favor data-retype, gated on one codegen unknown** — retype is byte-identical by construction (near-certain 3-region PASS, no wall-rate) vs function-matching's real hit-rates (ov002 56%, main 20–22%) + wine build; one confirmed blob = 672–4260B readable in a single paste vs ~50–300 readable-C bytes per function match. The one real risk: ZERO struct-typed data array exists repo-wide, so mwcc struct-array codegen (align-1 7-byte struct at a 4-aligned address) is gate-UNVERIFIED. **Action:** prove with the CharParam+PresentCard canary (S) before scaling. **Effort:** hours.

### B

**Oracle clean-subset is only ~5KB — steer effort away from CharMove** — only 2 of 7 BSC `.inc` are cleanly baked + matchable; CharMove.inc (20,016 ints, the largest oracle) is absent from arm9 + all overlays (runtime-loaded, metric-neutral); UFileTbl is partially baked (matches ov000 as u16 but flat concat diverges after 2/275 values — non-flat/index layout). Empirically refutes r6's blanket "byte-verifiable against arm9.bin." **Action:** treat the .inc oracle as a high-confidence SEED (2–3 tables), not the volume driver; skip CharMove-class runtime assets; defer UFileTbl until its ov000 loader layout is decoded. **Effort:** hours.

**Biggest opportunity:** the ~245 largest record-shaped blobs (501KB of byte-identical, wall-free retypes) are the volume lane — but land the metric fix (A) and prove the CharParam+PresentCard codegen canary (S) first, or the gain is both invisible and unverified.

## types

**S — Consolidate the extern-prototype debt into a shared header layer**
Claim: no shared prototype home exists, so every TU re-declares each callee's `extern` inline and independently guesses its signature — and the guesses contradict. Evidence (reproduced on brain HEAD 5e0fa4fd): 4,712 extern decl-sites for only 2,040 distinct functions (2,672 pure duplicates); 463 functions declared with 2+ mutually-contradictory signatures; `func_ov002_021ff320` = 17 sigs across 21 files; `func_02094504` (truly `void(int,void*,int)`) appears 8 ways; `func_020498f0` = 10 distinct return types. After stripping cosmetic param-name diffs, 366 keep genuine type conflicts, 166 contradict on return type, 142 are ABI-significant (change call-site codegen → block first-try byte-match). Action: emit one canonical prototype per fn into `include/…prototypes.h`, resolving the 463 conflicts; prioritize the ~30 functions declared >20 ways (ov002 sinks, DMA/fill helpers), then the 142 ABI-significant ones. Effort: days.

**A — Ship the empty, already-wired `include/` shared-header layer**
Claim: `-i include` is on all 4 mwcc rules (build.ninja:21/29/37/45, verified) yet `include/` holds only `.gitkeep` — a zero-config drop-in slot sitting empty. 63 headers exist, all `ovNNN_core.h` (21×3 regions, mostly sketch `extern char data_x[]`); only ov002_core.h has real field decls (~198 lines); main-arm9 (1,968 .c, ~4,047 funcs) has 0 headers. Action: create `include/game/types.h`, `include/game/prototypes.h`, per-module `main_core.h` as the canonical home; instantly includable, no configure.py edit. Effort: hours. Caveat: infrastructure enabler, not itself a metric-mover — it's the substrate the S and second-A lanes both write into. Do this FIRST.

**A — Build a pointer-parameter / call-graph struct miner (`mine_ptr_struct.py`)**
Claim: the only struct tool, `build_struct_bank.py`, is ABS32-global-only (`_RELOC_RE = R_ARM_ABS32` at line 70, verified; base-reg tracker fires only on ABS32 pool labels — no path seeds a base from r0-r3). But the dominant struct pattern is a pointer parameter threaded through a call graph: 268 EUR .c files / 2,701 `*(T*)(ident+0xNN)` accesses (240 clean matched C), 477 distinct (file,base) clusters, 59 with ≥4 fields; overlay004 alone = 39 distinct offsets. The tool structurally cannot mine these. Action: new miner — treat r0-r3 at entry as candidate struct pointers, collect `[rN,#off]` accesses, follow pointers into `bl` callees (map caller arg-reg→callee param-reg) to union layout across the call graph, emit `struct FooN *` and retype externs + m2c `--context` feed (m2c_feed.py already consumes `*_core.h`). Effort: days. Note: this is a net-new sibling lane, NOT "run build_struct_bank more"; the call-graph-union step is the unproven part (the sampled callees weren't yet C).

Biggest opportunity in this frontier: stand up the already-wired `include/` layer (hours) and land canonical prototypes into it — one deliverable that removes 2,672 duplicate decls, fixes 142 match-blocking signature contradictions, and becomes the retype target for the struct miner.

## naming

**S — Wire the built-but-idle external-SDK/DWC naming pipeline against a 499-function GameSpy/DWC subtree**
- *Claim+evidence:* The full external-oracle toolchain (`find_external_source.py` w/ pokediamond@2.0/sp1 + pokeheartgold@2.0/sp2p2 incl. `lib/NitroDWC`, `list_named_tier_callees.py`, `nitro_dict.py`, `nitro_suggest_renames.py`, `vendor_external_sources.py`) exists but has never run — no `nitro_dict.json`, `tools/_vendor` holds only unrelated m2c. Meanwhile arm9.bin embeds ~21-26 GameSpy/DWC `.c` source-name strings + the `Assertion (%s) failed in "%s", function "%s", line %d` format. `kind:load` relocs → `__FILE__` addrs attribute **80** placeholders to specific files (darray.c=12, gt2Callback.c=10, hashtable.c=8, gpiPeer.c=7); the contiguous span 0x02053c34–0x0206b47c holds **exactly 499 funcs, 0 named**, 155 already C-matched. pokeheartgold ships the exact middleware as a compiler-family peer. CONFIRMED against brain HEAD 5e0fa4fd.
- *Action:* `vendor_external_sources.py` → build fingerprint index → `rename_symbol.py --cascade` only where in-ROM file-string + peer byte-fingerprint + public API all agree (never-guess gate). Order: darray.c/hashtable.c/nonport.c (small, exact APIs) → gpi*/gt2*/sb_*. Byte-neutral (symbols.txt only) — cannot regress the gate. `__func__` strings (gpiInitialize, gpiProcessOperation…) are in rodata for direct naming.
- *Effort:* days (one-time peer clone is the only network step).

**A — Build the function→string xref naming pass; it's computable today, not "locked"**
- *Claim+evidence:* Config has **0** kind:ascii/string symbols (only data/function/bss/label exist in dsd), so the #1 peer-decomp oracle looks absent. But it is NOT structurally locked: from existing `config/eur/arm9/relocs.txt` (`kind:load`) + a byte scan, **232 distinct arm9-main functions reference rodata strings, all still `func_*`** — a real, un-worked, sized target (overlays untested, add more). Each string already carries an anonymous `data_ADDR` symbol (e.g. data_020c3d9c=`/font/%s.bin`, data_02101544=`gt2Message.c`). 4,474 printable runs ≥6 / ~91KB ASCII incl. behavior strings `/font/%s.bin`, `/LCFont/%s.LZbin`, `font/fw_r0808a.bin`. GameSpy strings are open-source → nameable AND C-matchable.
- *Action:* Emit the string→referencing-function index from relocs+bytes (no dsd change). Rename existing `data_ADDR` by content, then behavior-name loader/format funcs and feed the S-item's file attribution. Corrected framing: don't wait on a "kind:ascii carve" — it's not a dsd kind; act on existing data_ symbols.
- *Effort:* day.

**B — Sequence SDK-naming before call-graph propagation; the seed is too small to self-cascade**
- *Claim+evidence:* Only **1,069/9,737 (11.0%)** EUR placeholders call any named function; seed = **112** named funcs total. ov002 — biggest module, ~39% of the pool, 3,777 funcs — is **2.1%** with **0** internal named seeds (its named callees resolve into main). main 15.7%, ov013 63.6%. Reproduced via repo's own `naming_census.py`. Call-graph naming starves until the S/A items grow the seed.
- *Action:* Don't build call-graph heuristics yet; re-measure reach after S/A land, then propagate from named SDK roots (callers-of-named + sole-callee) under an evidence gate. main + high-reach overlays can seed some propagation now.
- *Effort:* hours (measurement only).

**Biggest opportunity in this frontier:** run the already-built external-SDK fingerprint pipeline to name the 499-function GameSpy/DWC subtree — 0/499 named, byte-neutral, gated by triple-agreement (in-ROM file string + peer fingerprint + public API), and it unblocks call-graph propagation everywhere downstream.

## cross-region

**S — 170-fn HIGH-confidence turnkey port backlog per region (340 free byte-verified ports); cross-region is NOT drained at ceiling.**
Claim: prior map called cross-region "near-drained at 72-77% ceiling." Refuted by census — realized port rate is already 79-82% (2406/2937 USA, 2408 JPN), ABOVE that ceiling, AND an enumerated 170/region HIGH-confidence unported backlog remains, all byte-sim≥0.99 (i.e. byte-match on port). Evidence: verifier reproduced via `find_region_siblings.find_siblings(byte_disambiguate=True)` (250/region HIGH, 225 at sim=1.0 = larger than claimed), and ran the action end-to-end — port_to_region → flip delinks .s→.c → full USA rebuild → `gx-spirit-caller_usa.nds: OK` (sha1 byte-identical), then reverted clean. Concentration: main ~111-132, ov002 ~42-45, ov008 8. Lift: 13,104 B → +0.549 pts each region, closes ~44% of the 1.26-pt EUR gap, gate stays green (already valid .s ships). Caveat: ~25/region at sim 0.92-0.98 must stay .s; the byte-exact 225/region subset backs the headline.
Action: sweep `tools/port_to_region.py <eur.c> --target usa|jpn --confidence-floor HIGH` over the enumerated 170 (scratchpad list_high.py), then `gate3.py --scope all`; start main+ov002 concentration.
Effort: day.

**B — Porting carries typed structs + prose verbatim → struct/type recovery auto-propagates 3x; the port is a QUALITY multiplier.**
Claim: any EUR fn given typed-struct recovery propagates the struct, field names, and doc-comment into USA+JPN for free — port_to_region rewrites only `func_/data_<8hex>` address tokens. Evidence: verifier reproduced `port_to_region.py src/main/func_02037dc0.c --target usa --dry-run` — emits full USA source with `typedef struct Entry68 {...}`, field names (f04/f1a/f34/f6a/_pad_*), and prose UNCHANGED; SYMBOL_RE confirmed not to touch struct/field names; `apply_substitutions()` (L766-786) is pure token sub over a copied source. So each typed EUR fn seeds three typed regions per cycle.
Action: sequence struct-recovery (build_struct_bank.py) on EUR BEFORE the port sweep; report a combined "typed-and-ported" metric to surface the 3x leverage. Caveat: each region still needs its own build+ninja sha1; tension with active phased-EUR-first deferral — treat as sequencing guidance, not per-ship auto-port.
Effort: hours.

Biggest opportunity in this frontier: drain the enumerated 170/region HIGH backlog (340 free byte-verified ports, +0.55 pts USA & JPN, ~44% of the EUR gap) — verified executable end-to-end with the gate staying green.

## quality

**S — Ship a build-free quality agent on the provably zero-risk safe slice**
Claim+evidence: The byte-neutral lift is real and scoped. All 309 stale `UNVERIFIED`/`CAMPAIGN-PREP` headers sit on delinks-`complete` (already-matched) TUs — 309/309 cross-checked against every `config/eur/**/delinks.txt`, 0 incomplete — so comment rewrites cannot alter compiled bytes regardless of match state (e.g. `src/main/func_02000e34.c`, `func_02000c4c.c` both `complete`). Constant `#define`s (preprocessor-neutral) and link-symbol renames (brief-492 byte-neutral) join the safe slice. Struct-typing and expression-splitting change the token stream, can shift mwcc reg-alloc, and MUST clear the 3-region `ninja sha1` gate — route those to the existing gated struct lane, not this agent.
Action: Spin one build-free, no-wine agent = (1) header-hygiene sweep of the 309 complete TUs (factual one-liner replaces "UNVERIFIED draft" prose), (2) constant `#define` pass, (3) symbol renames. Explicitly exclude type/expression work.
Effort: day.

**A — Add a within-natural-C readability gradient to progress.py**
Claim+evidence: `classify_c_source` (`tools/progress.py:233-244`) returns `asm-c` only on a `\b(?:__asm|asm)\b` hit, else `natural-c` — so a fully-opaque matched body counts identically to hand-readable C. `docs/STATE-LOG.md:28,97` concedes the metrics "track a `.s` ship identically to a real C match, so none of them track 'readable C'," while Track-2's goal (`:1027`) and the README are "human-readable C." The 8.6% metric is binary asm-void (0.14% separated), not readability.
Action: Emit a `readable` vs `opaque-C` split per matched TU from an opacity-signal density (unnamed-ref, raw-offset-cast, magic-literal, guessed-`f_N` counts). Static scan of committed src + delinks; makes Track-2 measurable and sortable.
Effort: hours.

**B — Materialize the opacity scorer as a worst-first worklist**
Claim+evidence: Independently reproduced — 4,153 matched `.c` (excl usa/jpn), only **32.7%** (1,357) carry zero opacity signals; 67.3% carry ≥1. Raw `*(T*)(base+off)` casts: 20.3% (842); guessed `f_N` fields: 3.6% (150); stale headers: 7.4% (309). The intersection "pure address-arithmetic opaque" (unnamed `func_`/`data_` ref AND offset cast) = **492 files (11.8%)** — technically-C, tells a reader nothing. Sub-percent deltas on re-derivation are regex-boundary noise; the one-third-clean / enumerable-ugly-tail shape holds.
Action: Ship `tools/readability_worklist.py` — per-module ranked list, highest opacity density first; the 492 pure-address-arith files are the seed tranche feeding both the S-agent and A-metric.
Effort: hours.

Dedup note: A and B are the same scorer (opacity-signal density) with two outputs — the metric split (A) and the ranked worklist (B); S consumes that scorer's output. Only the header sub-signal overlaps prior F7/r5 work, and only there as a comment sweep — the `complete`-TU zero-risk proof and the safe-vs-gated boundary are new.

**Biggest opportunity in this frontier:** stand up one build-free quality agent on the 309 provably-byte-safe header TUs + constant/symbol naming, backed by an opacity-density scorer that finally makes "readable C" measurable and worklist-sortable — turning the 8.6% asm-void number into a real quality gradient.

## external

Five findings, all verified `refuted:false`. Two share the LLM-propose + sha1-safety-gate mechanism (naming, struct fields); two share the m2c-as-generator pipeline (data initializers, struct typing); one is a cheap enabler; one is a corrective guardrail.

### S — opens a fresh chapter, unique structural advantage

**Byte-neutral LLM naming loop gated by `ninja sha1`** — A rename here edits `config/<ver>/**/symbols.txt` not compiled bytes (rename_symbol.py, brief 492), so the existing 3-region sha1 gate is a *free deterministic safety verifier* that external tools (ReSym/GenNm/DIRTY, all on non-recompilable Hex-Rays/Ghidra) categorically lack: any LLM-proposed rename batch that still builds byte-identical provably broke nothing. Frontier is ~3,683 matched-but-unnamed EUR functions (real-named ≈1.14%, corrected from claim's 1.65%; ov002 alone = 1,024 matched func_ files). LLM proposes for quality, gate enforces safety → hallucination bounded to "imperfect-but-harmless name." *Action:* tools/naming_llm.py feeds {body, caller/callee names, comments} → ModuleName_Verb proposal → rename_symbol.py --cascade → accept only sha1-clean batches; start arm9+ov002. *Effort:* days.

### A — ready-made generators on named greenfield frontiers

**m2c data-decompilation mode — a typed-data generator already installed** — m2c (already vendored/run for function matching) emits typed C initializers for data/rodata/bss given `--context` + `--globals=all`, ARM/APCS confirmed and executable live (verifier reproduced a byte-faithful nested-struct initializer on real src/main/data/data_020c3188.s). Pairs directly with build_struct_bank.py to feed the new 1.69% typed-data metric across 258 typed + 60 raw data blobs. Bounded limit: no bitfield initializers. *Action:* prototype `m2c <blob>.s --context <struct_bank>.h` on one typed ov002 symbol, gate-check, then wire struct-bank→m2c as a batch typed-data emitter. *Effort:* days.

**build_struct_bank.py + LLM FieldDecoder = ReSym's exact hybrid** — The tool already IS the program-analysis half (mines per-field offset/width/sign/bitfield across every .o, flags disagreement); the one missing step is ReSym's LLM half: propose struct name + field names from aggregated access sites. Run against only 1 of 63 *_core.h (hardcoded to data_ov002_ prefix). Dual payoff: readability + m2c --context yields more function matches (brief 609). Wine-free. *Action:* emit the per-field evidence table as an LLM prompt, write named typed structs into *_core.h, sweep all 63. *Effort:* days.

> Note: S-finding-4 + A-finding-5 are the same mechanism (LLM propose, byte-neutral gate) applied to functions vs struct fields; A-finding-1 + A-finding-5 chain into one pipeline (mine layout → LLM names fields → m2c emits typed initializer). Treat as one coordinated struct/data/naming program.

### B — cheap enabler + guardrail

**Bump the 6-week-stale vendored m2c pin** — pinned at ce05217 (2026-06-08); 59 upstream commits since include 2026-07-21 "arm: support 'label+offset' in jtbl loads" (ARM jump-table correctness) and 2026-07-20 negative struct/array-index fix (cleaner type output). Context-only usage (m2c_feed.py, m2ctx standalone) = zero gate/wine risk. *This de-risks and improves every m2c-based lane above — do it first.* *Action:* bump M2C_COMMIT in m2c_bootstrap.py, re-run bootstrap, re-feed a jtbl + struct-heavy func. *Effort:* hours.

**Correction: NitroSDK/pret headers are NOT license-clean (refutes ledger F8)** — ntrtwl/NitroSDK (comprehensive os/gx/fx/fs/snd headers, pushed 2026-07-23) and pret/poke{heartgold,platinum,diamond} all report license=None / require proprietary NitroSDK; this repo is MIT → bulk-import violates licensing both ends. *Action:* drop the bulk-import plan; use them only as a fair-use reference oracle (no redistribution) to name/type dsd-identified SDK symbols into this project's own libs/; prefer the 48 in-repo extract/**/*.inc oracles. *Effort:* days (guardrail, not new lane).

**Biggest opportunity in this frontier:** the byte-neutral LLM + `ninja sha1` gate loop — spanning function naming (S) and struct-field naming (A) — because the sha1 gate is a free deterministic verifier no external decomp tool possesses, converting cheap LLM proposals into provably-harmless quality across thousands of symbols; bump m2c (B) first to enable it.

## strategy

**S — Close build_struct_bank's oracle loop via prove-by-rebuild**
Claim: build_struct_bank.py mines struct layouts statically but emits UNVERIFIED headers — 0 `ninja`/`sha1` calls (line 371 hit is an error string; only side effect is header.write_text:461, no --verify/--apply mode). Evidence: the 2 tool-mined structs (Ov002D016c/Ov002Ce288) have 0 usages in any matched .c, while hand-derived Ov002Self(106)/Ov002Slot(60) ARE applied and sha1-proven — corroborating the open loop. The byte oracle can PROVE any layout: retype accessors → one `ninja sha1` → byte-identity proves it across all 3 regions at once; batch_sha1.py's existing recursive bisection (docstring 12-16) pins the wrong field/user on failure. Each proven struct feeds m2c --context to unlock downstream matches. Action: add `--verify` mode, seed on ov002_core.h's field-evidenced symbols. Effort: days. (Caveat: "unfalsifiable guessing" overstated — the oracle always could falsify; the tool's OUTPUT loop is what's open.)

**A — Enum reconstruction from stringized NitroSDK name tables (self-oracle)**
Claim: arm9.bin holds ordered value→string pointer tables — WM_ERRCODE at VA 0x20c63bc (SUCCESS=0,FAILED=1,OPERATING=2...), WM_STATECODE at 0x20c6440/68, WH_SYSSTATE at 0x20c6390 — where array index = enum value, matching public NitroSDK ordering. EUR src defines 0 enums repo-wide, so every wireless status switch/return is stuck on magic ints. Reconstruction WITH correct integer values is executable from arm9.bin alone (no external SDK clone). Action: strings_oracle.py enum-mode — extract table, join pointer/index table for value order, emit `typedef enum` into libs/nitro header, retype sites. Effort: days. (Calibration: direct surface is one ~87-func wireless module <1% of .text, not "every function" — but first-enum precedent for a 0-enum codebase.)

**A — Readable-C / naming regression ratchet is entirely absent from CI**
Claim: ninja-sha1 guards correctness but NOTHING guards that natural-C%, named-func/data counts monotonically rise. progress-badge.yml is regen-only (no fail path); match-invariants.yml fails only on `errors>0` (missing-TU/rebase drift), never metric direction; no baseline JSON exists. A PR can revert a rename, swap a natural-C body for an asm stub, or drop a typed-data decl and stay 100% byte-matched — leaving ~206KB readable-C + 163 names + the new 1.69% data metric unprotected. (ci_format_diff_reasons.py exists but is unwired to any workflow and tracks match-% buckets, not readability.) Action: progress_ratchet.py + required CI job diffing config/-derived metrics vs committed baseline; `[ratchet-drop-ok]` title override; reuses progress.py counters, no build/wine. Effort: day.

**B — GameSpy/DWC source-file provenance from embedded __FILE__ + assert-condition text**
Claim: arm9.bin statically links GameSpy/Nintendo-DWC with debug metadata intact — 23 distinct .c filename strings (darray/hashtable/gpiConnect/gt2Main/sb_server...), live rodata pointer refs (darray.c=12, hashtable.c=8), and verbatim assert-condition text uniquely locating each function/line — against a PUBLIC SDK with a documented per-file symbol inventory. This bulk-names a whole networking module by file+inventory rather than one function at a time (arm9 = 91/4047 named). Action: strings_oracle.py provenance-mode — walk rodata `__FILE__` refs back to referencing funcs via .o relocations, cluster by source file, map to GameSpy inventory, emit byte-neutral renames. Effort: days. (Correction: the "__func__ / real name as string literal" framing is FALSE — binary holds essentially one func-name string (gpiInitialize); leverage is __FILE__ clustering + assert-condition text, not __func__.)

**Biggest opportunity in this frontier:** wire the byte oracle into type recovery (build_struct_bank `--verify`) — it converts struct/enum inference from static guessing into sha1-proven fact and compounds into downstream function matches via m2c --context.

## Not a frontier (recorded)

- **CharMove.inc (the largest BSC oracle) — runtime-loaded, metric-neutral.** 20,016 ints, absent from arm9 and every overlay in all encodings; decompiling it moves no in-ROM byte metric. Refutes r6's blanket "`.inc` byte-verifiable against arm9.bin." Skip CharMove-class assets.
- **UFileTbl.inc — only partially baked, non-flat layout.** Matches ov000 as u16 for 2/275 values then diverges (index/offset table, not a flat stride); needs loader RE, not a turnkey retype. Defer until the ov000 loader layout is decoded.
- **"Sweep all 7 `.inc` as the volume driver" — the clean oracle subset is only ~5 KB.** Only 2–3 of 7 are cleanly baked+matchable; the `.inc` is a high-confidence SEED, not the volume lane (that is the 245 record-shaped blobs via build_struct_bank).
- **Bulk-import NitroSDK/pret headers "for free, license-clean" — FALSE.** ntrtwl/NitroSDK and all pret decomps report license=None / require proprietary NitroSDK; this repo is MIT → violates licensing on both ends. Refutes ledger F8. Use only as a fair-use reference oracle; prefer the in-repo extract/**/*.inc.
- **Call-graph naming propagation NOW — the seed is too small to cascade.** Only 1,069/9,737 (11%) placeholders call any named fn; seed = 112; ov002 (39% of the pool) is 2.1% with 0 internal named seeds. Re-measure after the SDK layer (bet 6) grows the seed.
- **"Real function names via embedded __func__" — the binary holds essentially one (gpiInitialize).** Naming leverage is __FILE__ clustering + verbatim assert-condition text vs the public SDK inventory, not per-function __func__ strings.
- **"Run build_struct_bank across all 63 headers" ≠ the struct frontier.** The tool is ABS32-global-only and structurally cannot mine the dominant pointer-parameter / call-graph struct pattern (268 files / 2,701 accesses); that needs a net-new `mine_ptr_struct.py`, not more runs.
- **"Add a kind:ascii/kind:string carve pass" — not a dsd kind, and the xref is already computable.** Every referenced string already carries a `data_ADDR` symbol; the function→string index builds from existing relocs today. The real action is renaming existing `data_` symbols + naming the 232 referencing fns, not a carve.
- **Typed-array metric as a scoreboard as-is — it counts the goal state.** `_DATA_ARRAY_DECL_RE` scores the opaque carve placeholder identically to a real struct; until a named-struct sub-tier lands, "raise the typed-data metric" is unscorable, so treat the metric fix as a prerequisite, not a lane.
