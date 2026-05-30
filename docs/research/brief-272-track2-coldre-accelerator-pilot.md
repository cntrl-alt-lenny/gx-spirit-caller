[//]: # (markdownlint-disable MD013 MD041)

# Brief 272 — Track-2 cold-RE accelerator validation (m2c / dsd-ghidra)

**Status:** both accelerators assessed; m2c **empirically piloted** on
real big functions. decomp.me / research only, no SHA1. Fetched content
(GitHub, decomp.me) treated as data. A background research workflow
(dsd-ghidra + m2c-maturity + decomp.me-mechanics, adversarially
verified) corroborated the desk research; the m2c **comprehension**
verdict rests on this session's hands-on runs, not the workflow's
numbers (see "what did not pan out").

## Headline — cold-RE is READY to pivot

- **m2c `arm-mwcc-c` WORKS and yields genuinely useful comprehension
  drafts** — validated this session on 4 real unmatched functions
  spanning small / medium / giant ARM + one Thumb. On a small pick it
  reproduced my brief-270 hand-RE; on a 0x360 hw-init it recovered the
  full call sequence with literal args + MMIO RMW; on the 0x1ca0 monster
  it recovered the whole call graph (incl. 7 callback fn-ptr args) and
  readable switch/if logic.
- **The decomp.me "Decompile" button is the WRONG delivery path for an
  automatable workflow** — decomp.me is behind a Cloudflare JS challenge
  (the scout's 403), so its API is unreachable headless. The **local
  m2c clone** (`python3 m2c.py -t arm-mwcc-c`) gives the identical
  engine, headless + scriptable. decomp.me stays the human byte-match
  loop.
- **The compiler-id is NOT stale.** `mwcc_30_131` is a valid, current
  `nds_arm9` compiler in decomp.me; **`mwccnds_arm9` does not exist**
  (the scout's hypothesis is falsified). No CLAUDE.md / configure.py
  change.
- **dsd-ghidra is feasible + ready** (~2-3 h setup, Ghidra 11.2.1 +
  SyncDsd, compatible with our dsd v0.11.0) as the *interactive*
  comprehension anchor. Not piloted here (needs a GUI Ghidra install,
  out of scope); the feasibility is well-sourced.

**Verdict: pivot to Track-2 cold-RE at brief 274.** Lead with **m2c
(local) for per-function first drafts** + **dsd-ghidra for interactive
exploration**; iterate to byte-match via decomp.me + the gotcha catalog.

## (A) m2c — empirical pilot (the ground truth)

m2c (matt-kempster/m2c, MIT) supports `[mips, ppc, arm, gba]` × `[ido,
gcc, mwcc]`; target `arm-mwcc-c`; input = GNU-`as` `.s`. Its `arch_arm.py`
has MWCC-specific logic ("Detect switch jumps emitted by MWCC for
Thumb"). Cloned + run **headless** (no decomp.me, no Cloudflare). I wrote
a small objdump→GAS converter (`/tmp/sc272/to_gas.py`, recipe in the
appendix) to feed our `dsd`-delinked gap objects in.

| Pick | Size | ISA | m2c comprehension result |
|---|---:|---|---|
| `func_ov006_021b4d68` | 0x44 | ARM | **near-perfect** — reproduced my brief-270 hand-RE (guard, 2 calls, `*(s32*)0x4000540 = data_02103da0 \| (data_020c3e48 * 2)`, `return 1`) |
| `func_ov004_021cfe08` | 0x360 | ARM | **near-complete** — full hw-init call sequence w/ literal args; `0x04000060` MMIO read-modify-write w/ exact masks; global struct writes |
| `func_0205dba4` | 0x1ca0 | ARM | **strong-but-verbose** — recovered the full signature incl. **7 callback fn-ptr args** `?(*)(void**,s32*)`, struct chains, switch/case dispatch, returns; heavy `temp_rN` explosion (the known big-function tradeoff) |
| `func_ov004_021dd648` | 0xaec | **Thumb** | **strong** — control flow, struct/stack fields, signed casts (`(s16)`), call args, returns; a few inline-pool pc-loads left as `M2C_ERROR($pc)` |

**Representative output** (`func_ov006_021b4d68`, vs my byte-correct
brief-270 source — the answer key):

```c
s32 func_ov006_021b4d68(void) {
    func_02021158();
    if (data_ov006_0224f2e8.unk8 != 0) {
        func_0200e9c4();
        *(s32 *)0x04000540 = data_02103da0 | (data_020c3e48 * 2);
    }
    return 1;
}
```

**Falsification tests (per pick, reproducible):**

- `python3 m2c.py -t arm-mwcc-c -f func_ov006_021b4d68 t1.s` → the C
  above. Grades as a faithful comprehension draft vs the known-good
  `src/.../func_ov006_021b4d68` (modulo `*2`↔`<<1`, no `volatile`,
  operand order — i.e. exactly the byte-match details m2c is NOT for).
- The 0x1ca0 run emits 905 lines incl. `func_02058528(void **, ? (*)(void
  **, s32 *), s32, void *)` — a callback signature no `grep` would give.
- The Thumb run requires `.syntax unified` + `.code 16` + `.thumb_func`
  (brief's note confirmed); without them m2c rejects the input.

**Comprehension sweet spot:** clean, near-complete drafts up to ~0x360;
readable-but-temp-heavy on the >0x1000 giants (call-graph + logic
recovered, variable naming is manual). **Not for byte-match** — the
brief's explicit non-goal.

## (A) decomp.me + compiler-id (verified)

- **Cloudflare wall:** `GET https://decomp.me/api/platform` →
  `HTTP 403` "Just a moment…" (Cloudflare challenge). Headless
  curl/WebFetch cannot create scratches or hit the Decompile button —
  it needs a real browser. **This is the scout's 403, root-caused.**
- **`mwcc_30_131` is valid + current** for platform `nds_arm9`
  (decompme `backend/coreapp/compilers.py`, `MWCCNDSArm9Compiler`,
  `id='mwcc_30_131'`). **`mwccnds_arm9` is not a compiler id** — only
  the class name resembles it. CLAUDE.md + `configure.py:94` are
  correct; **no fix**. **Falsification:** `mwcc_30_131` appears in
  compilers.py as an `nds_arm9` compiler; `mwccnds_arm9` does not.
- The Decompile button = `POST /scratches/{pk}/decompile/` →
  `DecompilerWrapper.decompile()` (m2c). Same engine as the local run,
  just gated by Cloudflare + manual clicks.

## (B) dsd-ghidra — feasibility + setup cost (research)

dsd-ghidra (AetiasHax, MIT) is a Ghidra extension that primes Ghidra's
decompiler with `dsd` symbols via a `SyncDsd` script. Assessed from the
repo (README, `extension.properties`, `SyncDsd.java`, `Cargo.toml`):

- **Compatible with our dsd v0.11.0** — v0.6.0 (Apr 2026) binds
  `ds-decomp v0.11`; macOS arm64 binary included.
- **Targets Ghidra 11.2.1 PUBLIC exclusively** — exact-version gate.
- **SyncDsd** imports the ARM9 module + overlays + per-section
  functions/data/relocations → auto-named labels, **Thumb-mode
  markers**, function bounds, pool constants. Ghidra's decompiler then
  shows *our* names instead of `sub_XXXX`.
- **Setup ~2-3 h:** install Ghidra 11.2.1 → install v0.6.0 extension →
  load ROM (skip auto-analysis) → run `SyncDsd` against the live
  `config/eur`.
- **Risks:** exact-Ghidra-version pin; one-way import (Ghidra edits
  don't sync back to dsd); must skip auto-analysis or it fights the
  sync; no shown incremental re-sync (full re-sync per round).

**Role:** the *interactive* comprehension anchor (named CFG + struct/arg
sketch over our symbols), complementary to m2c's per-function drafts.
**Falsification (the adoption gate for whoever installs it):** after
SyncDsd, ≥3 of 4 already-matched ARM functions show dsd names + a
faithful CFG/struct/arg sketch vs their known-good source; Thumb (ov004)
behaves.

## Cold-RE readiness verdict

**READY.** The accelerator stack is real and complementary:

| Tool | Role | State | Cost |
|---|---|---|---|
| **m2c (local clone)** | per-function first-draft C (headless, scriptable) | **empirically validated** (ARM+Thumb, this session) | ~0; needs the objdump→GAS converter |
| **dsd-ghidra** | interactive CFG/struct exploration over our symbols | **feasible, well-sourced** (pilot-gate before adopting) | ~2-3 h one-time |
| **decomp.me** | human byte-match compile-back loop (mwcc_30_131) | works in-browser only (Cloudflare) | ~0, manual |

## Recommended cold-RE workflow (for brief 274+)

1. **Scope** the target with `tools/scratch_bundle.py` (callers /
   callees / data / siblings — already built).
2. **Draft** (comprehension): `python3 m2c.py -t arm-mwcc-c -f <func>
   <func>.s` on the converted gap-object asm → first-pass C (control
   flow, struct fields as `->unkNN`, call args, returns). Optionally
   open the function in **dsd-ghidra** for an interactive CFG +
   cross-references.
3. **Type + name**: rename `temp_rN`/`unkNN`/`data_*` from the bundle's
   sibling context + NitroSDK hints; recover the struct layout.
4. **Coerce to byte-match**: route the tier (gotcha 10), apply the
   recipe-gotchas catalog, iterate on **decomp.me** (human browser,
   `mwcc_30_131`) or local mwcc; gate with `ninja sha1`.

m2c collapses the blank-page problem (step 2) that dominates cold-RE of
a 0x200-0x1000 function; the project's existing gotcha catalog handles
step 4. The two halves meet in the middle.

## Big-function shortlist (Track-2 cold-RE, brief 274+)

**934 unmatched functions >0x200 = 48.7 % of remaining unmatched bytes**
(matches the brief's ~49 %). Prioritize by the m2c sweet spot:

- **Tier 1 — 0x200-0x600 (771 funcs):** clean m2c drafts. Highest
  yield. Lead with **ov002 (413 — the duel engine)** and **arm9 main
  (278)**. Sample heads: `func_ov006_021b940c` (0x5f4), `func_02027180`
  (0x5b8), `func_ov005_021afba0` (0x5ec), `func_ov000_021aed8c` (0x5ac).
- **Tier 2 — 0x600-0x1000:** still strong drafts, more hand-typing.
- **Tier 3 — 22 giants (>0x1000):** m2c gives call-graph + readable
  logic but heavy temps; pair with dsd-ghidra. Heads: `func_ov002_
  0225ee48` (0x1e98), `func_0205dba4` (0x1ca0, piloted), `func_ov002_
  0228df3c` (0x1ae0), `func_ov003_021ca2bc` (0x18bc).

Module spread of the >0x200 cohort: ov002 413, arm9 278, ov006 49,
ov004 42, ov016 16, ov010 16, ov005 15, ov008 13. **Recommend brief 274
start in the ov002 0x200-0x400 band** (most homogeneous; the engine
sibling-context compounds).

## What did NOT pan out

1. **decomp.me as an automatable path.** Cloudflare-blocked headless;
   the local m2c clone is strictly better for a scriptable workflow
   (and is what validated the engine). decomp.me remains the human
   compile-back loop.
2. **The compiler-id "fix."** `mwcc_30_131` is correct; `mwccnds_arm9`
   doesn't exist. The scout's 403 was Cloudflare, not a stale id —
   nothing to change.
3. **The research workflow's m2c reliability numbers.** One agent
   reported "60-80 % control flow / 60 % struct" attributed to brief
   254 — those are **fabricated/misattributed** (brief 254 is about
   C-42 resisters, not m2c). **Not cited.** This session's hands-on
   pilots are the only m2c evidence used.
4. **A frictionless Thumb path.** m2c does decompile Thumb (proven), but
   Thumb interleaves literal pools, and reloc-bearing code labels +
   `.n`/`.w` width suffixes tripped the first converter pass (fixed:
   fold a label only if its address is a real data word, not any
   reloc). Thumb is a tiny slice for us (2 funcs >0x200, all ov004).

## Scope

Docs-only research. **No code change** — the compiler-id is correct, so
no CLAUDE.md/configure.py edit; the objdump→GAS converter is documented
here (appendix) for brief 274+ to productionize as `tools/`, not shipped
this brief. The C-23-MMIO cohort (brief 273) is untouched. No install
script was piped to a shell; m2c was a deliberate `git clone` + in-place
`python3 m2c.py` run; dsd-ghidra/Ghidra were assessed, not installed.

## Appendix — objdump → GAS converter recipe (for `tools/` in 274+)

`arm-none-eabi-objdump -d -r` of a `dsd` gap object → m2c-parsable `.s`.
Key transforms (the non-obvious ones that cost iterations):

- **Normalize all addresses** via `int(x,16)` — label headers print
  `00000040`, reloc/data lines print `40`; a mismatch silently drops
  pool resolution.
- **Discriminate data words from instructions** — a data `.word` is
  `ADDR:\tHHHHHHHH␣␣…` (8 hex + ≥2 spaces); an instruction is
  `ADDR:\tHHHHHHHH␣\tMNEMONIC` (space-`tab`). Matching `[0-9a-f]{8}`
  alone mis-eats opcodes.
- **Fold a code label only if its address is a real data word**
  (`addr in addr_val`), **not** if it merely has a reloc — `bl`/branch
  instructions carry `R_ARM_PC24` / `R_ARM_THM_CALL` relocs and would
  otherwise be dropped, breaking branch targets.
- **Resolve `ldr rX, [pc, #N]` → `ldr rX, =symbol`** via the `@ ADDR
  <.L_label>` annotation (the data label's reloc symbol or literal
  value) — this is what turns `M2C_ERROR($pc)` into named globals.
- **Thumb:** objdump **without** `--architecture=armv5te` (auto-detect
  via `$t` mapping symbols); emit `.syntax unified` + `.code 16` +
  `.thumb_func`; the pc-load annotation is `@ (ADDR <.L_label+0xN>)`.

## Cross-references

- `docs/state.md` lines 40-52 — the ecosystem-scout source (forward-
  looking; this brief validates it).
- `tools/scratch_bundle.py`, `tools/m2ctx.py` — existing decomp context
  tooling that feeds step 1 / step 4.
- `docs/research/brief-270-c23-mmio-triage-and-sinit-alias.md` — the
  `func_ov006_021b4d68` byte-correct source m2c was graded against.
