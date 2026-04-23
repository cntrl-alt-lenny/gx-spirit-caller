# mwcc-ARM Thumb section-alignment wall — proposal

**Status:** research writeup, cloud-written. Brain to review + scope as brief 013 (or close as "won't fix, use upstream issue" if rejecting recommendation).

**Context:** PR [#100](https://github.com/cntrl-alt-lenny/gx-spirit-caller/pull/100)
shipped 8 of 17 BIOS SWI thunks (brief 011). The other **9 deferred**
because `mwldarm` inserts 2 bytes of padding when a Thumb TU's end
address isn't 4-aligned, shifting every byte downstream and breaking
`dsd rom build`. The decomper exhausted obvious source-side
workarounds (`#pragma function_align 2`, `#pragma align_section 2`,
`#pragma thumb_func on`, `__attribute__((aligned(2)))`,
`-nointerworking`) — none change the emitted `.o`'s `sh_addralign`.

## Root cause (verified upstream)

Two independent knobs multiply:

1. **mwcc-ARM** always emits `.text` sections with `sh_addralign=4`
   for Thumb code. No compiler directive or flag overrides this per
   the decomper's exhaustion list above.
2. **dsd's LCF template** hardcodes `ALIGNALL(4)` at the top of
   every module's section block. This is a **literal** in
   [`assets/arm9.lcf.template`](https://raw.githubusercontent.com/AetiasHax/ds-decomp/main/assets/arm9.lcf.template),
   NOT a Jinja variable. There's no dsd config key, CLI flag, or
   `delinks.txt` field that modulates it.

Combined: a Thumb TU whose content length is not a multiple of 4
(e.g. a 6-byte `VBlankIntrWait` — 4 bytes of `swi + bx lr` thumb +
2 bytes alignment padding from the compiler) forces the linker to
insert 2 bytes of its own padding to restore 4-alignment before the
next TU, shifting everything after by 2. dsd's `rom build` final
validator rejects the layout.

**Affected thunks (from PR #100):** 10 (the PR body says 9 due to a
miscount). Every case has either a 2-aligned start address OR a
non-4-multiple content size. Full table in PR #100's "Deferred"
section.

## Peer-project survey

| Project | Toolchain | LCF source | SWI thunks shipped as | Has ALIGNALL? |
|---|---|---|---|---|
| [pret/pokediamond](https://github.com/pret/pokediamond) | mwccarm 2.0/sp1 | Hand-written `arm9.lsf` | `.s` assembly | No |
| [pret/pokeheartgold](https://github.com/pret/pokeheartgold) | mwccarm 2.0/sp2p3 | Hand-written `main.lsf` | `.s` assembly | No |
| [pret/pokeplatinum](https://github.com/pret/pokeplatinum) | mwccarm 2.0/sp* | Hand-written `.lsf` | `.s` assembly | No |
| [StanHash/dqix](https://github.com/StanHash/dqix) | mwccarm 2.0/sp1 | dsd-generated | N/A (pure ARM so far) | Yes (doesn't trigger) |
| **Us (gx-spirit-caller)** | mwccarm 2.0/sp1p5 | dsd-generated | Currently 8 C + 10 blocked | Yes (triggers) |

**Key finding:** the pret projects never hit this symptom because
they don't use dsd's LCF generator — their LSFs are hand-written and
contain no `ALIGNALL`. Moving to hand-written LSFs is a massive
restructuring we'd reject on its own merits (forking away from dsd's
maintained generator).

The **shipped pattern** in pokediamond / pokeheartgold for SWI
thunks: plain `.s` files under `lib/syscall/asm/`, each with
`.thumb` + per-function `.balign 4, 0` terminator. Because the
whole TU is Thumb AND ends 4-aligned, `mwldarm` has no padding to
insert. This sidesteps the ALIGNALL interaction entirely even on a
`ALIGNALL(4)` LCF.

Canonical reference: [`arm9/lib/syscall/_svc_mw.s`](https://raw.githubusercontent.com/pret/pokediamond/master/arm9/lib/syscall/_svc_mw.s).

## Recommendation

**Ship the 10 deferred thunks as `.s` assembly**, mirroring the
pokediamond pattern. This is the path with the most shipped
precedent and the smallest scope.

### Concrete plan (to be brief'd by brain)

1. **New asm rule in `tools/configure.py`.** Mirrors the existing
   `mwcc` rule for `.c` → `.o`; the new rule is `mwasm` for `.s`
   → `.o`. `mwasmarm.exe` ships alongside `mwccarm.exe` in the same
   2.0/sp1p5 bundle — already downloaded by `tools/download_tool.py`.
   Invocation: `mwasmarm.exe -proc v5te -i <includes> -o <out> <in>`
   (mirrors pokediamond's `lib/syscall/Makefile`).

2. **Source layout: `src/main/bios_svc.s`.** One file containing
   all 10 remaining thunks. Pattern per function:

   ```asm
           .section .text
           .global SVC_Divide
           .thumb
           .thumb_func
   SVC_Divide:
           swi     0x9
           bx      lr

           .balign 4, 0
   ```

   The `.balign 4, 0` terminator ensures the TU's content ends
   4-aligned regardless of where it starts, so the linker's
   `ALIGNALL(4)` becomes a no-op for this object.

   Keeping all 10 in one `.s` file (rather than one-per-file as
   with the 8 C thunks) is deliberate: a single `.o` means
   delinks.txt needs only one TU entry, and the linker only has one
   `sh_addralign=4`-aware object to place.

3. **`config/eur/arm9/symbols.txt` renames.** The 10
   `func_<addr>` entries get renamed to `SVC_<Name>` per brief 011's
   table. Existing `tools/rename_symbol.py` handles this.

4. **`config/eur/arm9/delinks.txt` entry.** One `complete` TU
   block pointing at `src/main/bios_svc.s` and spanning the
   address range the 10 thunks cover. Since `bios_svc.s` will
   contain non-contiguous functions, we may need either:

   - One TU with multiple `.text` section lines (if dsd supports
     non-contiguous ranges per TU — needs verification), OR
   - One `.s` file per group of contiguous thunks, which in the
     worst case is 10 separate files — still acceptable.

   **Open question for the decomper to answer empirically** during
   the brief.

5. **Symbol resolution verification.** `dsd check modules` must
   still report 24/27 OK. The `.s` approach doesn't change module
   layout, just the `.o` content. No change expected to the
   checksum state.

### Worked example: one full thunk

```asm
# src/main/bios_svc.s
#
# BIOS SWI thunks deferred from brief 011 / PR #100. Shipped as
# assembly because mwcc-ARM emits Thumb .text with sh_addralign=4
# and dsd's LCF hardcodes ALIGNALL(4), which together break matching
# for thunks whose content size or start-address alignment produces
# linker-inserted padding. See docs/research/thumb-align-wall.md.

        .section .text
        .global SVC_Divide
        .thumb
        .thumb_func
SVC_Divide:
        swi     0x9
        bx      lr

        .balign 4, 0

        .global SVC_Sqrt
        .thumb
        .thumb_func
SVC_Sqrt:
        swi     0xd
        bx      lr

        .balign 4, 0

        # ... 8 more thunks, same pattern
```

### Cost estimate

- Asm rule in `configure.py`: ~30 lines, mirrors the `mwcc` rule.
- `src/main/bios_svc.s`: ~100 lines for all 10 thunks.
- `symbols.txt` renames: one `rename_symbol.py` invocation per thunk.
- `delinks.txt` update: ~20 lines.
- **Total**: half a day of decomper work, on the same order as
  brief 011's original 8-of-17 partial.

## Alternatives considered

### B. Upstream dsd fix (file a proposal issue)

Propose to [AetiasHax/ds-decomp](https://github.com/AetiasHax/ds-decomp)
that `ALIGNALL(4)` become a per-module template variable, default
4, overridable via a new `align_all:` field in `delinks.txt` or a
top-level `--align-all <N>` flag. Precedent: issue
[#55](https://github.com/AetiasHax/ds-decomp/issues/55) already
landed a similar template-alignment fix for `.ctor`.

**Timing:** too slow to unblock brief 011 remainders. File it, but
don't block the decomper on it.

### C. Post-compile `sh_addralign` patcher

The decomper's own suggestion in PR #100: a Python script that
patches the Thumb `.o`'s ELF section header from `sh_addralign=4`
to `2` after `mwccarm` compiles and before `mwldarm` links.

**Why we're not recommending this first:** (a) no peer project does
it, so we'd be inventing a novel fix; (b) rewriting ELF section
headers can interact unpredictably with downstream tooling (objdiff,
dsd's validator); (c) the `.s` path is battle-tested in two large
decomps. Keep patcher as a fallback if `.s` somehow produces
non-matching bytes.

### D. Move to hand-written LSF

Rejected. Forking away from dsd's LCF generator is a massive scope
expansion for a narrow problem — worth it only if other alignment
issues compound (none identified so far).

## Post-merge retrospective (added after PR #115 / #116)

This writeup originally rejected "Option C (post-compile ELF
patcher)" as novel-and-risky. Brief 013 went with the `.s` + ELF
patcher path anyway (PR #110 / #112), shipping both
`tools/patch_section_align.py` (sh_addralign=2 rewrite) and the
mwasm rule wiring.

**That wasn't enough.** PR #115 bisected a `dsd check modules` regression
from 24/27 → 0/27 OK and found **two compounding causes** the
original writeup didn't predict:

1. **LCF ALIGNALL override.** mwldarm honors `ALIGNALL(4)` from the
   dsd-generated `arm9.lcf` and **re-raises** every `sh_addralign=2`
   back to 4 at link time. The `.o`-level fix was silently defeated.
   The survey above (dsd-template hardcoded as a literal) correctly
   identified the ALIGNALL was a hard floor, but the writeup's
   recommendation implicitly assumed the sh_addralign patch would
   still take effect downstream. It didn't.
2. **mwasm size padding.** mwasmarm also pads `.text` section sizes
   up to a 4-multiple with trailing `0x0000` bytes. For size-6
   Thumb thunks (`VBlankIntrWait`, `Mod`), that's a 2-byte cascade
   shift at link time even when alignment is correct.

**The fix shipped in PR #116** (`cloud/fix-align-regression`) had to
address both:

- **Fix A — `tools/patch_lcf_arm9_align.py`**: post-process the
  generated LCF, rewrite `ALIGNALL(4) → ALIGNALL(2)` **in the
  `.arm9` segment only** (overlays / ITCM / DTCM keep their 4s).
  Wired into the `lcf` ninja rule.
- **Fix B — `trim_text_section_padding` on
  `tools/patch_section_align.py`**: walk `.text*` sections; if
  `sh_size % 4 == 0` and the last two bytes are `0x0000`, trim
  `sh_size` by 2. Narrow trigger because `0x0000` is not a valid
  Thumb instruction in ARMv5TE — unambiguously mwasm's pad byte.

**Lesson for future reads of this doc**: even with source + `.o`
level fixes in place, an LCF-level floor can silently overwrite
them. Any future align-related work should explicitly audit:
`mwasmarm output → .o sh_addralign → LCF ALIGNALL → mwldarm
decision`. All four steps, not just the first two.

## Suggested next steps

1. **Brain scopes brief 013** around the `.s` approach above.
   Decomper executes; target is 10 remaining thunks shipped at
   100% match, `dsd check modules` stays 24/27 OK, named tier
   climbs 8 → 18 of 22.
2. **Cloud (optional, low priority)**: file the dsd upstream issue
   for the `ALIGNALL` template variable. Writeup is already
   factored out here — the issue body can reference this doc.
3. **If the `.s` path has unexpected blockers** (e.g. mwasmarm
   produces different Thumb encoding than mwcc), revisit the
   ELF-patcher fallback. Prototype script in PR #100's body is a
   reasonable starting point.

## References

- `https://github.com/cntrl-alt-lenny/gx-spirit-caller/pull/100` — original block report
- `https://raw.githubusercontent.com/AetiasHax/ds-decomp/main/assets/arm9.lcf.template` — hardcoded `ALIGNALL(4)`
- `https://raw.githubusercontent.com/AetiasHax/ds-decomp/main/cli/src/cmd/lcf.rs` — LCF-module generation
- `https://raw.githubusercontent.com/AetiasHax/ds-decomp/main/docs/delinks.md` — `align:` field syntax
- `https://raw.githubusercontent.com/pret/pokediamond/master/arm9/lib/syscall/_svc_mw.s` — **primary template**
- `https://raw.githubusercontent.com/pret/pokediamond/master/arm9/lib/syscall/secure.s` — secondary example
- `https://raw.githubusercontent.com/pret/pokeheartgold/master/lib/syscall/asm/_secure_IPGE.s` — HG/SS variant
- `https://raw.githubusercontent.com/pret/pokeheartgold/master/lib/syscall/Makefile` — asm-build + `-library` pattern
- `https://raw.githubusercontent.com/pret/pokediamond/master/arm9/arm9.lsf` — hand-written LSF (reference; we're NOT adopting this)
- `https://github.com/AetiasHax/ds-decomp/issues/55` — precedent for template-alignment fixes landing upstream
