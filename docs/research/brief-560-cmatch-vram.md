[//]: # (markdownlint-disable MD013)

# Brief 560 - VRAM 16-member threshold-dispatch family C-match

Branch: `claude/cmatch-vram-560`

Scope: the improvement-swarm r3 report
(`docs/research/improvement-swarm-2026-07-09-r3.md`, finding "16-member
VRAM threshold-dispatch family, 8 byte-matched anchors, never attempted")
named a concrete, high-confidence C-match target — clone the already-matched
`func_0208f6b0` shape (brief 507) across its 16 un-attempted siblings.
Target 2 (the `func_02089134` relative-offset table walker) was scoped as
"if time"; Target 1 alone consumed the wave's full budget once the
epilogue-routing and cross-region symbol issues below are counted, so
Target 2 was not attempted this wave.

## Outcome

- **EUR matches: 16/16** (100%)
- **USA ports: 16/16**, **JPN ports: 16/16** — all 3 regions sha1-verified
  byte-identical
- **Ships: 48** (16 × 3 regions), matching the brief's estimate exactly
- **Target 2: deferred, unattempted** — no build cycles spent

## The family

16 un-attempted siblings of the `func_0208f6b0` template (8 matched
anchors: `f6b0`/`f718`/`f780`/`f7e8` + `f210`/`f2f4`/`f3e4`/`f52c`), split
into 3 sub-shapes by raw-`.s` inspection (not by trusting the
campaign-prep dossiers' prose — see gotchas below):

| Sub-shape | Members | Getter | Dispatch pair | Threshold |
|---|---|---|---|---|
| Getter, `>0x30` | `f850`,`f8b8`,`f920`,`f988` | `<fn>(a)` → `p` | `func_02094030` / `Copy32` | `c > 0x30` |
| Getter, `>0x1c` | `f9f0`,`fa58`,`fac0`,`fb28`,`fb90`,`fbf8`,`fc60`,`fcc8` | `<fn>(a)` → `p` | `func_02093fb8` / `func_020944a4` | `c > 0x1c` |
| Literal base | `fdf0` (`>0x30`), `feb4`/`ff1c`/`ff84` (`>0x1c`) | none (pooled literal: `0x07000400`/`0x05000600`/`0x05000200`/`0x05000400`) | matches the corresponding getter-group pair | per-group |

All 16 ship as `.legacy.c` (mwcc 1.2/sp2p3, Style A 2-instruction
epilogue) — same routing as the 8 matched anchors.

## Gotchas hit this wave (all resolved)

1. **All 16 candidates carry the brief-294/302 GLOBAL_ASM-endgame
   "permanent wall" marker in their raw `.s`** — the same marker that,
   per briefs 530/532's established practice, normally means "skip
   without a build attempt." Checked this family's own matched anchors
   first: `git show` on the pre-match `func_0208f6b0.s` confirms it
   carried the *identical* marker before brief 507 matched it. **The
   marker means "current ship state," not "confirmed unmatchable" — when
   near-identical siblings have already been un-walled, the marker is
   stale metadata, not a skip signal.** Refined lesson for the next wave
   that hits this: check for sibling evidence before trusting the marker
   as an auto-skip.
2. **Filename-suffix routing is load-bearing, not cosmetic.** The first
   build attempt (plain `.c`, default mwcc 2.0/sp1p5) landed at 80.77%
   fuzzy match — same size, wrong epilogue (`ldmia {regs,pc}` instead of
   the target's `ldmia {regs,lr}` + separate `bx lr`). Renaming to
   `.legacy.c` (routes through mwcc 1.2/sp2p3 per
   `docs/research/style-a-epilogue.md`) fixed all but one instantly.
3. **Signedness bug, 4/4 literal-base candidates.** All 4 initially used
   `int len`/`int n` for the size parameter; the original binary compares
   it unsigned (`bls`/`LS` condition). Compiled output showed a
   single-byte diff per function (`0xda` vs `0x9a` — condition-code
   nibble `LE` vs `LS`) at the identical relative offset in each. Fixed
   by declaring the parameter `u32` (matching the other 12 candidates,
   which were correct from the start).
4. **A real stale-cache bug in the objdiff/report tooling**, isolated to
   `func_0208f850` specifically (the one function built twice under two
   different filenames this session): `dsd.exe objdiff --scratch`
   persistently emitted a `base_path` pointing at the pre-rename object
   even after a full clean `ninja rom` rebuild, making `objdiff_resolve_relocs.py`
   fail ("failed 5") and blocking `ninja report`. Diagnosed by manually
   invoking `mwccarm.exe` directly and diffing the resulting `.o` against
   the delinked target via `objdiff-cli diff -1/-2` (bypassing the
   dsd/report pipeline entirely) — confirmed **100% byte match** outside
   the broken pipeline, then trusted `ninja sha1` (the project's actual
   gate per `CLAUDE.md`) over the diagnostic report tooling. Worth a
   follow-up brief to fix the underlying dsd caching issue so
   `ninja report` doesn't need this workaround again.
5. **Two EUR-only renamed symbols broke the USA/JPN link.**
   `Vram_GetBankBaseE`/`Vram_GetBankBaseCD` (renamed from
   `func_0208deec`/`func_0208df40` by brief 492's symbol-naming swarm,
   EUR only) got copied verbatim into the ported USA/JPN sources by
   `port_to_region.py`, because its resolver only pattern-matches
   `<kind>_<8-hex-addr>`-shaped identifiers — a renamed symbol is
   invisible to it and passes through unchanged, silently producing an
   undefined-symbol link error rather than a build-time diff. Recovered
   by probing each getter's **pre-rename** address (`func_0208deec` /
   `func_0208df40`) through `port_to_region.py --dry-run` via a
   throwaway stub file, reading the correct USA/JPN target name
   (`func_0208de04` / `func_0208de58`) from the resolution, and patching
   the 4 affected ported files by hand. Worth flagging for whoever
   revisits `port_to_region.py`: any of the ~39 brief-492 EUR renames
   referenced as a *callee* (not just as the ported function itself) has
   this exposure.
6. **8 of 16 EUR-side ports needed `--confidence-floor LOW`** for both
   USA and JPN — all 8 hit the identical resolver refusal on the shared
   `func_020944a4` callee (`D2 v2 anti-match: candidate shift -0xf4 ≠
   consensus -0xe8`). Accepted per established practice (the region's own
   `ninja sha1` is the real gate); both regions verified clean, confirming
   the resolution was correct despite the low confidence label.

## Verification

```text
gx-spirit-caller_eur.nds: OK
gx-spirit-caller_usa.nds: OK
gx-spirit-caller_jpn.nds: OK
```

## Target 2 (deferred)

`func_02089134` (7-clone relative-offset table walker) has a
high-confidence campaign-prep dossier already using the
bind-to-a-temp ternary shape the brief's recipe note calls for
(`docs/research/c-match-prep/02089134.c`) — worth attempting first
thing in a follow-up wave rather than re-deriving from scratch. Its 6
siblings are not yet identified by address; that survey is also
unstarted.

## Next steps

1. File a short follow-up brief for the `dsd.exe objdiff --scratch`
   stale-`base_path` bug (gotcha 4) — low-frequency but was a real
   time sink to diagnose this wave.
2. Target 2 as the lead item for the next VRAM/main C-match wave.
3. `port_to_region.py`'s renamed-symbol blind spot (gotcha 5) is worth a
   dedicated fix — grep the ~39 brief-492 rename targets against
   in-flight EUR match candidates before porting, or teach the resolver
   to recognize renamed symbols via their pre-rename address (which is
   still recoverable from git history / the rename commit).
