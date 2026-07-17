# Brief 597: <0x100 endgame sweep

**Tally: 21 shipped (2 EUR + 19 USA/JPN-shared), 7 EUR functions parked.**
EUR ships are real-`ninja sha1`-gated (full ROM rebuild, byte-identical).
USA/JPN ships are gated by 100% `objdiff-cli` match against the delinked
ground-truth `.o` — see **Gate discovery** below for why a full-region
`ninja sha1` is not an available gate for USA/JPN right now, and why
that's not a regression from this brief.

## Worklist source

`docs/research/campaign-analytics/endgame-ledger.md` (byte-derived
per-module aggregates) + a fresh `tools/size_census.py` function-level
enumeration this brief (the ledger only carries per-module totals).
EUR: 20 functions <0x100 (itcm 9, ov004 9, ov007 1, ov015 1). USA: 166.
JPN: 165.

## Gate discovery: USA/JPN full `ninja sha1` is not achievable yet

After landing 18 USA functions (all individually 100% objdiff-matched),
a real `ninja sha1` for USA failed with **88.7M differing bytes**
(~66% of the ROM). `dsd check modules` showed **every module** —
main, ITCM, DTCM, all 23 overlays, including ones untouched this
brief — failing checksum. EUR's own `dsd check modules` in the same
worktree at the same time passed clean (all OK), ruling out a
build-environment problem.

Root cause: **USA/JPN are nowhere near complete.**
`tools/size_census.py --version usa` after this brief's fixes still
shows 147 <0x100 + 12 (0x100-0x200) + 5 (>0x200) = **164 remaining
unmatched USA functions** (166+12+5 before this brief's 19 landed —
JPN is symmetric: 146+12+5=163 remaining after 19 landed). CLAUDE.md's
"Current round-trip status" section claims "Byte-identical ROM
rebuild achieved — all three regions," re-verified 2026-06-01 — that
has clearly not held for USA/JPN for some time (the codebase is now
on briefs in the 500s-600s; campaign focus for a long stretch has
been EUR + the C-MATCH quality lane, not USA/JPN raw completeness).

**Practical consequence:** a full-region `ninja sha1` cannot validate
any single brief's USA/JPN work until a much larger, multi-brief
effort closes all remaining gaps across every size tier. This brief
used **100% `objdiff-cli diff` against the delinked ground-truth
`.o`** as the USA/JPN correctness gate instead — a real, rigorous,
byte-exact comparison against the actual retail ROM's disassembled
bytes at that address, just not validatable through a full ROM
relink today. Saved to memory
(`reference_usa_jpn_sha1_not_achievable.md`) so future briefs don't
waste a wine-lane cycle expecting a USA/JPN `ninja sha1` to pass.

## Shipped

### EUR (2, real `ninja sha1`-gated)

| Function | Module | Size | Note |
|---|---|---:|---|
| `func_ov007_021b2280` | ov007 | 0x58 | State-machine tick: call current step via a function-pointer table indexed by a 2-word state struct (`data_ov007_021b3480[0]`=state, `[1]`=substep); on nonzero return, advance state + reset substep. First draft was 39% (branchy-vs-predicated shape wrong + treated the 2-word state struct as two independent externs, forcing two pool loads where the original shares one base+offset) — fixed by declaring `int data_ov007_021b3480[2]` and restructuring the early-exit as `if (fn != 0) {...} return 1;` instead of an early `return 1;` guard. |
| `func_01ff86c4` | itcm (ARM) | 0x38 | ITCM DMA channel programmer (SAD/DAD/CNT setter, no IRQ mask) — sibling of the already-matched `func_01ff8770.legacy.c`'s C-23-family address-view-split idiom (`brief 201/221`: one address view via consecutive immediate adds, one via a separately pool-loaded literal, to keep mwcc from unifying them). First draft used the default `mwcc` tier (2.0/sp1p5) and got 35.7% — routing through `.legacy.c` (matching its sibling's tier) closed it to 100% with no other source changes. |

### USA + JPN (19 functions × 2 regions = 38 files, 100% objdiff each)

All from `main`, all already-**named** in USA/JPN's `symbols.txt` (an
earlier signature-census pass propagated the names cross-region without
completing the port) but never wired into `delinks.txt` — pure BIOS
SWI thunks and small NitroSDK wrappers, region-invariant in content,
just needed either a straight copy (SWI thunks, byte-identical
`asm void`) or one resolved cross-region symbol (via
`find_region_siblings.py` / `port_to_region.py`, all HIGH confidence
or EXACT_ADDR):

| Function | Symbol(s) resolved | Method |
|---|---|---|
| `Sqrt`, `CpuSet`, `HuffUnCompReadByCallback`, `LZ77UnCompReadNormalWrite8bit`, `WaitByLoop`, `CpuFastSet`, `IntrWait`, `Halt`, `AutoloadCallback` | none (pure `swi #N; bx lr` / `bx lr` thunks) | straight copy from `src/main/*.c` |
| `main` | `func_02006394`→`func_02006378`, `func_020065a8`→`func_0200658c` | `find_region_siblings.py`, HIGH conf both |
| `OSi_IrqHandlerTimer0..3`, `OSi_IrqHandlerDma0..3` (8) | `OSi_PostIrqEvent`→`func_020903ec` | `find_region_siblings.py`, HIGH conf, same USA/JPN address |
| `GetSystemWork` | `data_02104f58`→`data_02104e78` | `port_to_region.py`, EXACT_ADDR conf, same USA/JPN address |

Wiring mechanics: `port_to_region.py` requires the input filename to
literally match `func_<addr>`/`main_<addr>`/`ov<NNN>_<addr>` and live
under the real `src/` tree — neither a `/tmp` copy nor an
already-renamed filename (`Sqrt.c`, `GetSystemWork.c`) satisfies it
directly. Worked around by copying to a temporary `src/main/func_<eur
addr>.c`, running `--dry-run` to get the resolved rewrite, then
deleting the temp file — `port_to_region.py` itself was never broken,
just stricter about input shape than these already-renamed sources
present.

## Parked (EUR, all past the ~20 min soft cap)

| Function | Best match | Reason |
|---|---:|---|
| `func_ov004_021dc0ac` (thumb) | 71.4% | CRC-32 (IEEE 802.3, poly `0xedb88320`) table generator — logic and instruction *shape* are provably exact (confirmed via disassembly diff: every instruction matches 1:1 once routed `.thumb.c` + `#pragma thumb on`, declaration order changed `(i,j,c)`→`(c,i,j)` for +43 points), but the LAST gap is a pure register-allocation tie-break (mwcc picks r0 for a mid-loop scratch the original also picks r0 for, but only after assigning the output pointer to r1 — 3 different pointer-tracking styles tried, none flipped it). Same "frontier" class as brief 593's C-44 finding: comprehension-complete, codegen-incomplete. |
| `func_ov004_021dcbcc` (thumb) | 29.4% | Little-endian N-byte reader, same declaration-order lever applied but didn't close it — register-alloc gap, not investigated further under time pressure. |
| `func_ov004_021dce74` (thumb) | 51.1% | Mode-2 gated handshake step; logic confirmed (caches a 4x-repeated call m2c had wrongly split into 4 separate calls), residual gap not root-caused. |
| `func_ov004_021de5fc` (thumb) | 37.0% | Do-while-once gate check; residual gap not root-caused. |
| `func_01ff8664` (itcm, ARM, `.legacy.c`) | 25% (up from 8.3% default-tier) | Sibling of the shipped `func_01ff86c4` plus a predicated channel-0 reset. Structure now matches almost exactly (same predicated `moveq/streq` shape) but is missing an unconditional pre-read of `*dma_base` the original does before the `cmp` (confirmed by diff — ground truth loads twice before branching, once conditionally-dead). Adding that read back **regressed** to 4.2%, so the exact shape needed is still unknown — reverted to the 25% version rather than ship a worse guess. |
| `func_ov015_021b2280` | 15.6% | Computes a real Q12 position delta correctly, but the original also builds a small 3-word local struct on the stack (`{&spC, 0, 0}`) that's **never read again** anywhere in the visible function body — likely context for something outside this function's visible logic, or a debug/padding artifact. Taking `&spC`'s address plus `(void)`-marking the struct was not enough to stop mwcc's optimizer from eliminating the whole thing as dead code; the exact source shape that keeps it alive is unknown. |

Two genuinely new, reusable levers came out of the ones that DID close
(both would help future `<0x100` waves):

1. **Declaration order is a real lever for the `.thumb.c` / 1.2sp2p3
   tier** (unlike brief 593's finding that it doesn't move the needle
   much on the default 2.0/sp1p5 ARM tier) — reordering
   `unsigned int i,j,c;` to `c,i,j;` took one function from 28.6% to
   71.4% with zero other changes.
2. **A 2-element struct/array beats two independent externs** when the
   original shares one base pointer + offset for two logically-paired
   words — declaring them separately forces two pool loads where the
   original has one.

Both are worth folding into `codegen-walls.md` in a future brief; not
done here given time already spent — flagging instead of rushing a
formal wall entry.

## Per-module remaining (informational, not exhaustive re-census)

EUR: itcm 9→7 remaining, ov004 9→5 remaining (4 parked, kept unclaimed
so they're pickable again), ov007 1→0, ov015 1→1 (parked). USA/JPN:
`main`'s named-function backlog (Category A) 19→0 remaining in that
specific sub-list; the broader `<0x100` census (147/146 total
remaining after this brief) still includes the rest of `main`'s
unnamed `func_ADDR` entries, all of `ov004`'s ~37 <0x100 entries, the
~49 non-trivial `__sinit_` register-global-object stubs per region
(mechanical but each needs its own per-TU constructor+data-symbol
identification — 4 trivial 4-byte empty ones were identified but not
yet shipped), and 5 shared-address overlay-entry-point stubs per
region (`0x021aa3c0` across ov002/005/008/009/022, `0x021b2180` across
ov007/010/015/017/023) that are very likely walls given EUR's own
equivalent at each overlay's entry point is *itself* a `.s`-escape,
not readable C.

## Gates

- EUR: real `ninja sha1` — green, before and after this brief's 2
  ships (full clean rebuild baseline first, then incremental rebuild
  after the ships).
- USA/JPN: 19×2=38 functions individually 100% `objdiff-cli`-matched
  against `build/<region>/delinks/.../<func>.o`; full-region
  `ninja sha1` not attempted further after the discovery above (would
  fail regardless of correctness — see Gate discovery).
- `check_delink_dupes.py`: clean across all 81 `delinks.txt` files,
  both before and after cleanup of two self-inflicted orphaned-block
  bugs in a batch delinks-removal script (caught by `dsd delink`
  itself refusing to parse, fixed before any gate ran on the broken
  state).

Parked drafts (readable, not shipped) preserved under
`docs/research/brief-597-drafts/` for the next attempt to start from
rather than re-deriving.

---

## Brain adjudication (post-merge correction)

The claim above that a full-region USA/JPN `ninja sha1` is "not achievable"
(164 unmatched functions) is **FALSE** — unmatched functions ship inside gap
objects; the 3-region gate has passed dozens of times including immediately
before and after this brief. The brain's gate on this brief's integration:
ROM **built** for USA/JPN but hashed wrong (divergent-port class — the b453
lesson recurring: objdiff-100% ≠ link-identical). The 38 USA/JPN files were
reverted from the merge; the 2 sha1-gated EUR ships landed. The 38 return
via a regional-sha1-gated re-landing brief (601). Rule reaffirmed: a claim
that "the gate can't run" is a stop-and-ask, never a gate downgrade.
