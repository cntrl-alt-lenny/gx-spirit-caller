### decomper/thumb-thunks-s-file

**Goal:** Ship the 10 BIOS SWI thunks deferred from brief 011 wave 1
as a `.s` assembly file, following the pokediamond/pokeheartgold/
pokeplatinum pattern documented in
[`docs/research/thumb-align-wall.md`](../research/thumb-align-wall.md).
Closes named tier to **22/22** (with the 10 shipped here + the 12
already matched = 22).

**Dependency on cloud (must land first):**

- Cloud needs to add a `.s` / `.asm` compilation rule to
  `tools/configure.py` + the Ninja graph. The research doc
  estimates ~30 lines mirroring the existing `mwcc` rule. This is
  strictly cloud's column (tools/) and unbriefed-in-scope per
  AGENTS.md's autonomy policy.
- Brief 013 execution is **blocked until that lands**. See the
  parallel cloud ask in the session messages.

**Context:**

- Brief 011 wave 1 surfaced an mwcc-ARM / `mwldarm` alignment wall
  for Thumb thunks: `sh_addralign=4` + `ALIGNALL(4)` combine to
  pad TU boundaries with 2 bytes, shifting every downstream byte
  and breaking `rom build`.
- Cloud's research confirmed:
  - `ALIGNALL(4)` is hardcoded in dsd's LCF template — no knob to
    turn off.
  - Every pret NDS decomp (pokediamond, pokeheartgold, pokeplatinum)
    ships SWI thunks as `.s` files with `.thumb` + `.balign 4, 0`
    terminators. Plain C / `asm void` doesn't produce the needed
    section attributes.
  - Reference: [`pokediamond/arm9/lib/syscall/_svc_mw.s`](https://raw.githubusercontent.com/pret/pokediamond/master/arm9/lib/syscall/_svc_mw.s).

**Targets (all in `main`, names preserved from dsd canonical —
no rename needed):**

| Address | Symbol | Size | SWI |
|--------:|--------|-----:|----:|
| `0x02000086` | `VBlankIntrWait` | 0x6 | `0x05` |
| `0x020000f2` | `LZ77UnCompReadByCallbackWrite16bit` | 0x4 | *(read from disasm)* |
| `0x0200017a` | `RLUnCompReadByCallbackWrite16bit` | 0x4 | *(read from disasm)* |
| `0x020001f2` | `Div` | 0x4 | `0x09` |
| `0x02000324` | `Mod` | 0x6 | `0x09` *(shared — returns modulus from Div)* |
| `0x0200045a` | `IsDebugger` | 0x4 | *(read from disasm)* |
| `0x020005f6` | `GetCRC16` | 0x4 | *(read from disasm)* |
| `0x02000652` | `RLUnCompReadNormalWrite8bit` | 0x4 | *(read from disasm)* |
| `0x0200078a` | `SoftReset` | 0x4 | `0x00` |
| `0x02000252` | `BitUnPack` *(if deferred — brief 011 partial lists may differ)* | 0x4 | `0x10` |

Cross-check the list against brief 011 wave 1 (#100)'s "Deferred (9)"
table — brain's count is 10 and the decomper's is 9; reconcile before
shipping by running `python tools/next_targets.py --version eur
--tier named --top 25 --no-outputs` to get the authoritative live
list.

**Pattern (single `src/main/bios_svc.s`, mirroring pokediamond):**

```asm
# src/main/bios_svc.s
#
# BIOS SWI thunks deferred from brief 011 wave 1 (PR #100). Shipped as
# assembly because mwcc-ARM emits Thumb .text with sh_addralign=4 and
# dsd's LCF hardcodes ALIGNALL(4), breaking match for thunks whose
# content doesn't end 4-aligned. See docs/research/thumb-align-wall.md.

        .section .text

        .global Div
        .thumb
        .thumb_func
Div:
        swi     0x9
        bx      lr
        .balign 4, 0

        .global Sqrt
        .thumb
        .thumb_func
Sqrt:
        swi     0xd
        bx      lr
        .balign 4, 0

        # ... remaining 8 thunks, same pattern ...
```

Use the existing symbol names (`Div`, `Sqrt`, `VBlankIntrWait`, …)
— dsd already named them. No `SVC_` prefix, no rename.

**Open implementation question** for the decomper to answer
empirically during execution: does dsd's `delinks.txt` accept a
single TU with multiple non-contiguous `.text` ranges? If yes, one
`bios_svc.s` file with one TU entry covering all 10 works. If no,
fall back to one `.s` per contiguous range — worst case 10 files,
each with one `complete` TU entry. Verify by trying the one-file
approach first.

**Scope:**

- `src/main/bios_svc.s` (or multiple `.s` files if the delinks
  constraint forces it).
- `config/eur/arm9/delinks.txt` — append `complete` TU entries
  covering each thunk's address range.
- Existing symbol names preserved.

**Non-scope:**

- ❌ Any C code changes or tool updates — cloud handles the
  configure.py .s rule in a separate PR.
- ❌ Other failing modules (`dtcm`, `ov004`).
- ❌ Changes to `tools/`, `libs/`, `AGENTS.md`.

**Success:**

- All 10 deferred thunks at 100% objdiff.
- `./dsd check modules` stays at 24/27 (main's checksum failure is
  from elsewhere; these leaves don't affect it).
- Named tier: 12/22 → 22/22. Tier fully closed.
- `tools/check_match_invariants.py` exits 0.
- `ninja rom && ninja sha1` — the overall ROM hash won't yet match
  (we're at 0.05%) but `ninja rom` must still succeed without the
  padding error that blocked brief 011 wave 1's 10 thunks.

**Cadence:** **One PR, all 10.** Same reasoning as brief 011 wave 1
and brief 012 — mechanical, identical in shape, safer to verify as
a batch than split.

**Branch:** `decomper/thumb-thunks-s-file`.

**After this brief lands:**

- **Named tier closed** (22/22). First tier closure that includes
  any work in a failing module.
- **Brief 014**: `nitro_suggest_renames` against passing-overlay
  `func_*` placeholders, using cloud's #99 HIGH-confidence output.
  First rename-cascade work — promotes placeholders to real NitroSDK
  names, unblocks cascades in easy tier.
- Continued easy-tier sweep in heavy overlays (1062 unmatched).
