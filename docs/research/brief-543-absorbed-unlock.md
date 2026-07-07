[//]: # (markdownlint-disable MD013 MD041)

# Brief 543 — validating the C-absorbed `base+offset` unlock: SHIPPED

**Status:** brief 543 (2026-07-07), wine-required (needs a working
`mwasmarm`/`mwldarm`, unlike the wine-free briefs 537/539/541 that led
up to this). Brief 541 prototyped `asm_escape.py --allow-absorbed-offset`
— a `.word base+0xN` substitution for the `C-absorbed` data-ref REFUSE
class — but could not test-assemble it against the real Metrowerks
toolchain in that wine-free session. This brief validates it for real,
applies it to all 15 flagged `ov004`/`ov006` walls, and ships.

## Verdict

**The mechanism works. All 15 residual `ov004`/`ov006` functions are now
shipped, both USA and JPN, gated byte-identical via the real `ninja
sha1`.** Along the way, validation surfaced a real bug in
`emit_asm()`'s `.extern` list generation — fixed, with a regression test
that specifically covers the shape that masked it in the first probe.

## Step 1 — the simplest case, for real

Per `brief-541-wall-autopsy.md`'s designated probe:

```bash
python tools/asm_escape.py --whole-function --allow-absorbed-offset \
    --version usa func_ov006_021c9b48 --out /tmp/test.s
```

`mwasmarm` **accepted `symbol+constant` syntax inside a `.word`
directive on the first try** — no syntax error, a clean `.o` came out.
Disassembling the result confirmed a correct `R_ARM_ABS32` relocation:

```
a8: 00000000    .word 0x00000000
        a8: R_ARM_ABS32   data_ov006_021ce530+0x258
```

`0x021ce530 + 0x258 = 0x021ce788` — exactly the absorbed symbol's real
address. The tool's own internal `bytes_match` check flagged this as a
mismatch (`[42] reloc data_ov006_021ce530 vs data_ov006_021ce788`), but
that check compares reloc **symbol names as strings**, not resolved
addresses — it has no way to know `base+offset` and the absorbed symbol
name are the same address. That's a comparator limitation, not evidence
of a real byte divergence.

**The authoritative test is `ninja sha1` on the actual linked ROM**, not
the tool's own pre-link symbolic check. Carving this one candidate into
`config/usa/arm9/overlays/ov006/delinks.txt` + a fresh
`configure.py usa` + `ninja sha1`:

```
gx-spirit-caller_usa.nds: OK
```

Confirmed: `mwldarm` resolves `base+addend` to the identical final bytes
the original absorbed-symbol relocation would have produced. The
mechanism is real, not just plausible.

## Step 2 — the other 14: a real bug, found and fixed

Generating the remaining 14 candidates (`--allow-absorbed-offset`,
`--version usa`) surfaced three genuine **assembly failures** — not the
expected symbolic-mismatch shape, but `mwasmarm` outright refusing to
assemble:

- `func_ov004_021d3d04`
- `func_ov004_021d4d2c`
- `func_ov006_021bbfc0`

The other 9 (plus the proven `func_ov006_021c9b48`) assembled cleanly
with only the expected symbolic mismatch. Reading the emitted `.s` for
`func_ov004_021d3d04` explained it immediately:

```
        .extern data_0210586c
        .extern data_ov004_02209d28      <- the ABSORBED symbol (unlinkable, unused)
        .extern data_ov004_0220e2a0
        ...
_LIT0: .word data_ov004_02209d24+0x4      <- the BASE symbol (used, but never .extern'd)
```

`emit_asm()`'s `.extern` list (`tools/asm_escape.py`, ~line 402) was
built from the **original** disassembly's reloc symbols —
`externs = sorted({w["reloc"] for w in orig if w["reloc"]})` — computed
before the `absorbed_subs` substitution is applied to the pool words.
For a function whose *only* reference to the bundle is the substituted
one, the base symbol never appears in that set: the `.word` line names
it, but no `.extern` declares it, and `mwasmarm` refuses to assemble an
undeclared external.

The first proven candidate (`func_ov006_021c9b48`) didn't hit this
because it happens to load `data_ov006_021ce530` (the base, element 0 of
a 2-element array) **directly**, at a *different* pool slot, elsewhere
in the same function — that direct reference put the base symbol in the
externs set for an unrelated reason, masking the bug entirely. Checking
one of the 9 "worked by luck" cases confirmed this pattern exactly
(`func_ov006_021bc350` independently loads `data_ov006_021cca68` at
`_LIT2`, same base as its `_LIT0` substitution).

**Fix** (`tools/asm_escape.py`): route the externs computation through
`absorbed_subs` so a substituted reloc externs its base, not the
absorbed symbol that no longer appears anywhere in the emitted text:

```python
def _extern_name(sym: str) -> str:
    if absorbed_subs and sym in absorbed_subs:
        return absorbed_subs[sym].split("+")[0]
    return sym

externs = sorted({_extern_name(w["reloc"]) for w in orig if w["reloc"]})
```

**New regression test**
(`test_absorbed_subs_externs_the_base_not_the_absorbed_symbol` in
`tests/test_asm_escape.py`): uses the existing `ORIG` fixture, whose
*only* data ref is the one being substituted — the exact shape that
exposed the bug — and asserts the base is `.extern`'d and the absorbed
symbol name is gone from the output entirely. The pre-existing
`test_absorbed_subs_rewrites_pool_word` test already exercised this
same fixture and substitution but never asserted on the `.extern` list,
so it passed both before and after the fix without ever catching the
bug — a reminder that a targeted assertion matters as much as a
targeted fixture.

After the fix, all three previously-failing candidates assembled
cleanly with the same expected symbolic-mismatch shape as everyone
else. Full test suite: **2453 passed, 8 skipped** (was 2452/6 at the
end of brief 541; +1 new test).

## Step 3 — apply to all 15, both regions, ship

All 15 functions (`ov004`: 2, `ov006`: 13 — see
`brief-541-wall-autopsy.md` for the full per-function base/offset
table) carved as whole-function `.s` GLOBAL_ASM ships via
`--allow-absorbed-offset`, staged into `delinks.txt` at their exact
uncarved-gap boundaries (cross-checked address-by-address against the
live file before every insertion, not assumed from the doc table), for
**both USA and JPN** (brief 541 already confirmed identical addresses/
sizes/absorbed-relationships between the two regions).

| Region | Result |
|---|---|
| USA | `gx-spirit-caller_usa.nds: OK` |
| JPN | `gx-spirit-caller_jpn.nds: OK` |
| EUR | untouched by this brief (no `ov004`/`ov006` C-absorbed candidates in scope here) — verified unaffected, see Verification table |

`ov004`/`ov006` uncarved count: **15 → 0**, both regions. No delinks
overlaps, no dedup collisions with the scaffolder's concurrent `ov002`
drain (disjoint overlays throughout, confirmed via `git status` before
every commit).

## Step 4 — should `--allow-absorbed-offset` become a batch_carve default?

**Yes — recommended as a default, with one wiring caveat.**

The mechanism is now proven end-to-end (real assembler, real linker,
real `ninja sha1`, 15 functions × 2 regions = 30 ships), and
`C-absorbed` REFUSEs are not unique to `ov004`/`ov006` — brief 539's
work order flags **30 more per region** in the ongoing drain scope
(`ov002`'s 4 + `main`'s 26), all currently sitting on the SKIP list for
the same reason `ov004`/`ov006` used to. Recovering even a fraction of
those is free additional ships per wave for no extra RE effort — this
is a mechanical, tool-level unlock, not a per-function judgment call.

**The caveat**: `batch_carve.py` doesn't just need the flag passed
through — it needs a **second** change, because a `C-absorbed` REFUSE
never reaches the `--whole-function` call today. `BatchCarve.run()`
(`tools/batch_carve.py` ~line 645) calls `self.ops.classify(func)`
first; `classify()` shells out to `asm_escape.py --classify-data` and
returns `"refuse"` on any REFUSE verdict, at which point the candidate
is immediately parked (`self._park(func, "kind:data-REFUSE", ...)`) and
`whole_function()` — the call that would actually carry
`--allow-absorbed-offset` — is **never invoked**. Wiring the flag in
requires either:

1. Teaching `classify()` to distinguish a *purely* `C-absorbed` REFUSE
   (recoverable) from a mixed or `OFFSET`/`MISADDRESSED` one (not), and
   only parking the latter — the same distinction
   `resolve_absorbed_substitutions()` already makes internally, just
   not exposed through `--classify-data`'s plain REFUSE/ok output today; or
2. Simpler: on a `classify() == "refuse"`, retry once with
   `asm_escape.py --whole-function --allow-absorbed-offset` before
   parking, and only park if *that* also fails (assemble error or a
   REFUSE that isn't purely `C-absorbed`, both of which the flag itself
   already detects and reports distinctly).

Option 2 is the smaller, lower-risk change — it doesn't touch
`classify()`'s contract at all, just adds a fallback attempt at the
existing park decision point. Left for the drain lane to wire in (out
of scope for this brief, which owns `ov004`/`ov006` only, not
`batch_carve.py`'s shared driver or the `ov002` drain itself).

## Files changed

- `tools/asm_escape.py` — the `.extern`-list fix (the only *behavioral*
  code change; `--allow-absorbed-offset` itself was already shipped
  in brief 541 and needed no changes beyond this).
- `tests/test_asm_escape.py` — one new regression test.
- `config/usa/arm9/overlays/ov004/delinks.txt`,
  `config/usa/arm9/overlays/ov006/delinks.txt`,
  `config/jpn/arm9/overlays/ov004/delinks.txt`,
  `config/jpn/arm9/overlays/ov006/delinks.txt` — 15 new blocks each.
- `src/usa/overlay004/*.s` (2), `src/usa/overlay006/*.s` (13),
  `src/jpn/overlay004/*.s` (2), `src/jpn/overlay006/*.s` (13) — the
  carved whole-function `.s` files.
- `docs/research/brief-541-wall-autopsy.md` — status update pointing
  here.
- `docs/research/campaign-analytics/usajpn-drain-workorder.md` —
  `ov004`/`ov006` removed from the SKIP list; residual count corrected.

Nothing under `src/*/overlay002/` or
`config/*/arm9/overlays/ov002/` touched — that scope belongs to the
concurrent scaffolder drain (brief 542).

## Verification

| Check | Result |
|---|---|
| `func_ov006_021c9b48` real-assembler probe | `mwasmarm` accepts `symbol+offset`; correct `R_ARM_ABS32 base+addend` reloc emitted |
| USA `ninja sha1`, single candidate | `OK` |
| `tests/test_asm_escape.py` | 59 passed (1 new) |
| full `tests/` suite | 2453 passed, 8 skipped |
| All 15 candidates assemble (USA) | 15/15, after the `.extern`-list fix (3/15 failed before it) |
| All 15 candidates assemble (JPN) | 15/15 |
| USA `ninja sha1`, all 15 carved | `OK` |
| JPN `ninja sha1`, all 15 carved | `OK` |
| EUR `ninja sha1` (unaffected-region safety check) | `OK` |
| `git status` before each commit | only `ov004`/`ov006`/tooling/docs — no `ov002` overlap |

🤖 Generated with [Claude Code](https://claude.com/claude-code)
