[//]: # (markdownlint-disable MD013 MD041)

# Tool-scout swarm (2026-06-19) — GitHub/PyPI/decomp-community tool survey

**Run by the brain** (Opus 4.8, ultracode) as a 225-agent Workflow swarm at cntrl_alt_lenny's request (spare-token budget). 17 finder lanes -> completeness critic -> gap-fill -> per-candidate deep-read + adversarial-verify -> synthesis. Stats: 211 raw candidates, 100 unique, 100 verified -> **1 adopt / 10 pilot / 12 watch / 77 reject**. ~7.1M subagent tokens, ~48 min.

**TL;DR verdict:** the toolchain (dsd/objdiff/m2c/permuter/asm_escape/port_to_region) is the scene-standard stack and the project is at/ahead of the frontier; 77 candidates rejected (platform-locked, duplicates-ours, or wrong-layer). Real leverage = a few MULTIPLIERS on lanes that already work (embedding few-shot retriever, thin batch-driver, peer-corpus idiom mining, a 3-region dashboard). **LLM-assisted byte-exact matching is a real partial win for the easy-mid tier (size-knee <=~0x100) but NOT the unlock for reg-alloc/scheduling walls or RE giants — corroborates the b405 verdict that fan-out solves understanding, not codegen.**

---

# Tool-Scout Report: gx-spirit-caller Decomp

**Bottom line:** The deep-read covered ~60 candidates. The honest verdict is that **almost nothing new clears the bar** — the toolchain (dsd/objdiff/m2c/permuter/asm_escape/port_to_region) is already the scene-standard stack, and the team is at or ahead of the frontier on every axis. The real leverage is concentrated in **three** moves: an embedding-based few-shot retriever, a thin batch-driver pattern, and a peer-corpus mining pass. Everything else is reject/watch.

---

## 1. Headline — Highest-Leverage Moves

| # | Move | Why it wins | Owner |
|---|------|-------------|-------|
| 1 | **Embedding retrieval of already-matched funcs as few-shot draft seeds** (Mizuchi/Macabeus mechanism: jina-embeddings-v2-base-code over normalized asm → top-k matched `.c↔asm` neighbors into the prompt) | Automates the team's hand-curated MEMORY "family" recipes (row-group-rebuild, object-builder, popcount twins). We already own ideal index material: thousands of matched EUR `.c↔asm` pairs. ~1-file Python indexer feeding the existing prompt builder — no TS runner. Hits leverage #1 (.s→readable-C) and #7 (mwcc-idiom drafting). | **decomper** |
| 2 | **Thin batch-driver for the .s/region-port grind** (Nigel pattern, re-implemented ~150 LOC Python: shell-candidate → templated prompt → `ninja sha1` verify → commit-on-pass/reset-on-fail, sharded across worktrees) | The deterministic SHA-1 gate makes a cheap driver SAFE (weaker driver = fewer ships, not wrong ships — per the integrity-posture memo). Maps 1:1 onto the mechanical .s-carve and region-port lanes. | **brain** (new tool) |
| 3 | **Peer-corpus mining: pret pokediamond/pokeplatinum + RushRE/SonicRushAdventure** | RushRE is **bit-identical compiler** (mwccarm 2.0/sp1p5); pret is one sub-rev off (sp1p2). Harvest matched-C mwcc idioms for the reg-alloc/scheduling residue + NitroSDK names/struct conventions. Read-only, no build, ~half-day per source. Hits #1/#5/#7. | **decomper** (idioms) + **brain** (SDK names) |
| 4 | **decomp.dev 3-region dashboard** (one CI step uploading per-region objdiff report.json) | Only genuinely-additive net-new capability with a low cost: per-region/per-PR progress visibility for the fast-climbing USA/JPN port lane. Reporting only — does not move match rate. | **brain** (CI) |

A note of restraint: moves 1–3 are **multipliers on lanes that already work**, not new capabilities. None of them crack the hard residue (reg-alloc/scheduling walls, RE giants). That residue is codegen-bound, and the project's own b405 swarm verdict stands: **fan-out solves understanding, not codegen.**

---

## 2. EXPONENTIAL Watch — Sober Read on LLM-Assisted Byte-Exact Matching

**Is "auto-convert byte-matched .s → matched readable C at scale" here yet? No — but the data says it's a real partial win, not vapor.**

The single best evidence is the Macabeus 60-function benchmark (Claude Sonnet 4.6, agentic objdiff loop): **74% avg / 80% best match; ~half of successes on attempt 1; if not matched by attempt 3, eventual-match probability drops to ~1/4; 12 funcs never matched. Crucially, on the ARM-Thumb set m2c+permuter alone matched ZERO — the LLM was the entire unlock.** This is the same model family the team uses, on an ARM target, with a byte-exact criterion. It corroborates the team's own b412/413 finding that the LLM (not m2c/permuter) is the lever.

**What would have to be true for this to become exponential here, and why it isn't yet:**

- **The benchmark wasn't run on mwcc/DS.** It was GBA/agbcc + N64/IDO. Those compilers don't share mwcc's hard quirks (divmod-helper-must-be-called, byte-pack peepholes, ror signed-mod, cached-base, pool-resolution). The team's hardest residue is precisely the reg-alloc/scheduling class — the exact failure mode the benchmark also tails off on. So expect the **74% to be lower** on our hard tier.
- **The gate gap is load-bearing.** Every automated loop in the candidate set (Mizuchi, Kappa, m3c, Nigel) verifies against **objdiff (object-level)**, while the team's truth is the linked **3-region ROM `ninja sha1`**. Memory repeatedly shows objdiff-100% ≠ link (b453 divergent-port "complete"; ov010 divmod-at-link). **Any LLM loop must keep `ninja sha1` as the external gate.** A passing objdiff run is necessary, not sufficient.
- **The economics merely match the team's manual numbers** (~5–8 clean-C/wave) — they don't beat them. The win is *throughput per human-hour*, not a new match ceiling.

**Verdict:** The exponential prize is real for the **tractable/easy-mid tier** (size-knee ≤~0x100), where it can compress the manual loop. It is **not** the unlock for reg-alloc walls or RE giants — those stay codegen-bound. Pursue it as moves #1+#2 above (retriever + batch driver), not as adopting any single orchestrator wholesale.

---

## 3. ADOPT NOW

Honestly, only one item is both net-new and cheap enough to adopt outright. The other high-value moves are pilots (Section 4) because they need a gate-bridge or a yield measurement first.

**decomp.dev (3-region dashboard)** — *owner: brain*
- **Sketch:** Add a CI matrix job that runs `objdiff-cli report generate` per region (EUR/USA/JPN), uploads each as `<REGION>_report.json` artifact, register the repo + install the GitHub App. Precondition (report.json) already met.
- **Effort:** ~1 day. **Caveat:** inherits the objdiff Thumb under-count verbatim — it displays the same numbers, doesn't fix them; `ninja sha1` stays the ship gate. Gated by whether you want to run the slow wine build in CI (solve caching first, or upload from local).

---

## 4. PILOT — gate behind a named test

**P1. Embedding few-shot retriever** (move #1) — *owner: decomper*
- **Build:** ~1-file Python indexer (jina-embeddings-v2-base-code over normalized asm) over matched EUR `.c↔asm` pairs; inject top-5 neighbors into the decomper draft prompt.
- **TEST:** A/B one wave's drafts *with* retrieval vs. no-retrieval baseline. **Ship-gate:** measurable first-try/near-try lift over the manual family-picking baseline. Skip the difficulty model (the ≤~0x100 size-knee heuristic already covers it). Days, not weeks.

**P2. Thin batch-driver** (move #2) — *owner: brain*
- **Build:** ~150 LOC Python (do NOT take the Go/Nigel binary — no license, fights worktree+PR flow), baking in `ninja sha1` + kind:data preflight + integrity-paste capture.
- **TEST:** Run on one .s-carve lane wave and one region-port wave. **Ship-gate:** clean ship rate ≥ manual baseline with zero wrong-ships (the SHA-1 gate guarantees this; you're measuring throughput).

**P3. Peer-corpus mining** (move #3) — *owner: decomper + brain*
- **Do:** Bounded read-only pass — grep RushRE (mwccarm 2.0/sp1p5, **identical**) and pokeplatinum (~100% matched C) for the team's *open* wall classes (reg-alloc, byte-pack, fixed-point smull/mla, divmod). Harvest NitroSDK names/struct conventions into the naming layer.
- **TEST:** Does an idiom crib unblock ≥1 confirmed wall on a handful of known-walled funcs? **Ship-gate:** confirm idioms transfer before investing more reading time. Do NOT vendor their SDK artifacts (license/sub-rev skew). Cost: a few hours.

**P4. Mizuchi single-overlay spike** (optional, lower priority) — *owner: brain*
- Only if P1/P2 underdeliver. Author `compilerScript` around the wibo mwccarm/mwldarm invocation, `target: nds`, `archVersion: v5te`, point `nonMatchingAsmFolders` at dsd .s gaps. **TEST:** prove the bridge to `ninja sha1` (not just objdiff) on ov004/ov016 before any broader use. This is the "buy vs. build" check against P1/P2's homegrown path.

---

## 5. WATCH

| Tool | Trigger to revisit |
|------|--------------------|
| **coddog** (ethteck) | When upstream lands a **32-bit ARM-mode decoder** (today Thumb-only — touches a tiny slice of an ARM-dominant ROM). Then it automates family-clustering for pick-ranking + region-divergence. |
| **objdiff** (upstream) | Watch changelog for **Thumb unit-counting** and **immediate/reloc-aware diffing** fixes — either could let report.json replace slower SHA-1 round-trips in the Thumb/region lanes. |
| **objdiff VS Code ext** | No-cost in-editor live diff for whoever hand-drives RE/permuter-resistant picks. Must not displace `ninja sha1`. |
| **ndspy** | If a BLZ-aware programmatic region-localizer is wanted — replaces the uncompressed-bin `cmp` with one in-memory call. Round-trip-verify this title's overlay/BLZ layout first. |
| **dsv** (struct memory viewer) | Next time a struct-layout wall (like ov010 0x60-vs-0x5c) costs real bisect time on a high-value RE giant. |
| **dsd-ghidra / PyGhidra / GhydraMCP** | Only if a confirmed RE-giant *understanding* wall appears that headless m2c can't approximate. b405 says understanding isn't the bottleneck — keep these cold. |
| **decomp.dev issue #58** (this game's overlay-swap) | Routine upstream hygiene — the team filed it; a local workaround already exists (per-overlay delinks). |
| **Capstone / Unicorn** | Pull in as analysis sidecars only when a concrete consumer (divergence localizer, permuter reg-liveness seeder, jump-table extent prober) is actually being built. |

---

## 6. REJECTED (grouped, one-line reasons)

**Already adopted / no-op (re-adopting is lateral):**
m2c, decomp-permuter, objdiff, objdiff-core, decomp.me, decompme/compilers, wibo, unarm, ds-rom, dsd format/check, dsd sig (spike already shelved, brief-280), ntrtwl/NitroSDK (vendored), decomp-permuter Claude skill, Ninja pools/-MD (already wired), objdiff-cli report (already the `objdiff_report` rule), wineserver tuning (WINEDEBUG already in verify.py; persistent `-p` is a net-negative given the 38-min deadlock history), pyelftools (deliberately removed; hand-rolled parsers in place), nitro_dict/suggest (FLIRT/sigkit duplicate it).

**Platform-locked (wrong ISA/compiler):**
LLM4Decompile (x86/GCC), m3c & melee-decomp & snowboardkids2 & sotn-decomp & sm64 & splat & dtk & dtk-template & frogress & decompai (all MIPS/PPC/GC/x86), mwcc-native (PPC-only, abandoned), retrowin32/Theseus (x86 emu, wrong arch), Decompile-Bench (x86/Clang), alphadiff (x86, research-only, no release).

**Stale/abandoned forks of tools we already run:**
laqieer & DTeachs & GameCubeGBA decomp-permuter-arm forks (ARM32 is now mainlined upstream; forks regress ~4–5 yrs; pull from simonlindholm@main instead, never the forks).

**Wrong layer / wrong objective for byte-exact matching:**
Ghidra BSim & FunctionID/FIDB & ghidriff & ghidrecomp & ghidra-headless-scripts & GhidraFunctionCPPExporter (fuzzy/readability/naming, not byte-matching; constant/reg/type-erasing or pseudo-C; small-func bias hits exactly our tractable tier), Binary Ninja sigkit/WARP & Rizin FLIRT (SDK-ID already in-house + near-saturated; ARM/Thumb FLIRT weak; some need commercial BN/IDA), Diaphora (needs paid IDA; fuzzy scores, no SHA-1 gate), Hashcat-symbol-recovery (verified: 0 hash-symbol tables in the ROM), Decompedia MWCC page (no ARM content; we're net contributors).

**Asset/container tools — orthogonal to a code-matching decomp (dsd already round-trips data as kind:data):**
ndstool, SceneGate Ekona, Tinke, NitroPaint, ptexconv, nitrogfx, knarc (verified: **0 NARCs in the ROM**), narchive, Every File Explorer, CUE/Midnoclose compressors, arm9dec, nds Rust crate, AuroraLib.Compression.

**Build-distribution at wrong scale / can't drive wine-wrapped mwcc:**
sccache & ccache (don't cache the dominant mwasmarm path; brittle on wrapped non-GCC compiler), icecream & Wuild (native-host-locked, can't distribute wine-wrapped PE; no build farm anyway).

**Editor-bound / single-model / weaker than headless flow:**
Kappa (VS Code + Copilot-bound — regresses our headless three-agent routing; borrow only the AST-auto-fixer + objdiff-as-tool *concepts*).

**Index/reference-only (not tools):**
awesome-decompilation (frozen 2023), awesome-game-decompilations (bare link index — 30-min skim, discard), DQIX/dqix-decomp (same-stack peer but strictly behind us).

---

**One transferable concept worth stealing regardless of adoption** (cheap, no tool): the AST auto-fixer for known mwcc/C violations (mid-block decls, explicit divmod-helper calls) from Kappa/Mizuchi, plus the `base_n.c` never-overwrite partial-match snapshot convention and explicit STOP-token from snowboardkids2 — fold into decomper kickoffs / the verify gate as no-cost process polish.
