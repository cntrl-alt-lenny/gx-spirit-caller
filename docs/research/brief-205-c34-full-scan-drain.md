# Brief 205 — C-34 full-corpus drain (E-08 + 19 Phase 2 picks)

**Brief:** 205 (decomper). Phase 1: ship E-08 (`func_02026fd8`)
via brief 202's locked `.s` recipe. Phase 2: full-corpus scan
for C-34 candidates and drain via the same recipe.

## Headline

**20 of 20 attempted picks closed byte-match. 1 candidate
(`func_02023478`) skipped — patcher trim-heuristic edge case
that needs brief 204's trim-protect fix.**

`complete_units += 20` — far above the brief's 1-5 realistic
expectation. 3-region SHA1 PASS preserved (EUR / USA / JPN).

| Phase | Pick | Size | Outcome |
|---|---|---:|:---:|
| 1 | `func_02026fd8` (E-08) | 0x70 | ✓ MATCH |
| 2 | `func_02006950` | 0xa4 | ✓ MATCH |
| 2 | `func_02006a38` | 0xd8 | ✓ MATCH |
| 2 | `func_020071c4` | 0x54 | ✓ MATCH |
| 2 | `func_0200ac60` | 0xac | ✓ MATCH |
| 2 | `func_0202142c` | 0x50 | ✓ MATCH |
| 2 | `func_020234f8` | 0x7c | ✓ MATCH |
| 2 | `func_02024024` | 0x7c | ✓ MATCH |
| 2 | `func_02024430` | 0xb8 | ✓ MATCH |
| 2 | `func_020244e8` | 0x74 | ✓ MATCH |
| 2 | `func_02024574` | 0x74 | ✓ MATCH |
| 2 | `func_02027048` | 0x88 | ✓ MATCH |
| 2 | `func_020270d0` | 0x74 | ✓ MATCH |
| 2 | `func_020285bc` | 0xe4 | ✓ MATCH |
| 2 | `func_020286a0` | 0xb4 | ✓ MATCH |
| 2 | `func_02028790` | 0x74 | ✓ MATCH |
| 2 | `func_0202a1cc` | 0x74 | ✓ MATCH |
| 2 | `func_0202a27c` | 0x7c | ✓ MATCH |
| 2 | `func_020318b8` | 0x74 | ✓ MATCH |
| 2 | `func_020988a8` | 0x100 | ✓ MATCH |
| skipped | `func_02023478` | 0x80 | trim trap |

## Patcher trim trap — empirical findings

Brief 202's recipe is `pure .s with explicit .word data_<sym>`
directives. mwasmarm dedupes the `ldr =sym` macro form into a
single pool slot, but explicit `.word` directives stay distinct.
HOWEVER — `tools/patch_section_align.py --trim-padding` applies
a heuristic to mwasm-emitted `.text` sections:

```
if size % 4 == 0 and last_two_bytes == b"\x00\x00":
    trim section size by 2
```

The heuristic exists because mwasmarm 4-byte-pads odd-byte `.text`
content (e.g. 6-byte Thumb thunks become 8 bytes). The trim restores
the correct size.

**False-positive on relocation tails:** when the LAST pool entry in
a `.s`-emitted function is a symbol reference (e.g.
`.word data_020c3e84`), the pre-link bytes are `00 00 00 00` (the
relocation slot, to be filled by the linker). The patcher sees
`00 00` as trailing-pad and trims 2 bytes — even though those bytes
are real and will be filled by the linker post-trim.

For brief 202's E-07 worked example, this didn't matter because
E-07 is followed by `func_02023fec.o` (a fixed-symbol-address .o),
so the linker auto-pads the gap. For E-08, the next .o is a gap
file with no fixed address — the trim cascades into a 2-byte shift
of all downstream functions, breaking the module checksum.

## Two workarounds applied per pick

### Workaround 1 — duplicate slot → literal value

For the SECOND occurrence of a duplicate `.word data_<sym>` entry
(the C-34 wall signature), use the literal address instead:

```asm
.L_POOL_A:
        .word   data_0219a924          ; first slot — symbol ref (relocated by linker)
.L_POOL_B:
        .word   0x0219a924             ; second slot — literal (no relocation; bytes
                                       ; are the symbol address pre-baked; post-link
                                       ; identical to slot A)
```

Both produce the same bytes after linking. The literal form skips
the relocation, so the bytes pre-link are non-zero (last byte 0x02
for DS RAM addresses 0x020xxxxx), defeating the trim heuristic.

### Workaround 2 — LAST pool entry must end in a non-zero byte

If the pool's LAST entry happens to be a symbol reference (pre-link
bytes 0x00000000) OR a literal whose high 16 bits are zero
(`.word 0x7fff` → `ff 7f 00 00`), the trim heuristic fires on the
trailing `00 00`. To defeat it, change the LAST entry to a literal
form that has a non-zero high byte:

```asm
.L_LAST_POOL:
        .word   0x020c3e84            ; literal; LE last byte = 0x02 → no trim
```

For DS RAM symbols (0x020xxxxx prefix), this works. For literals
like `0x7fff` whose value has zero high bits, this workaround
doesn't apply — those picks need brief 204's patcher trim-protect
fix (which inspects relocation offsets to identify real pool
content).

`func_02023478` is the one skipped pick where the last pool entry
is literal `0x7fff`. Stub preserved at
`src/main/func_02023478.s.deferred` (un-wired) — will close once
brief 204's patcher fix merges.

## The full-scan classifier output

29 C-34 candidates in main; 20 sized 0x40-0x100 (per brief 205
filter); brief 203's `func_02021b38` excluded (routing trilemma
deferred to brief 204).

```bash
python3.13 tools/predict_walls.py --version eur
# 62 total C-34 candidates across all modules (main + overlays)
# 20 in main, 0x40-0x100 — all attempted; 19 closed, 1 skipped
```

## File header convention

Generated via `tools/gen_c34_s.py` (decomper-local helper at
`/tmp/gen_c34_s.py`; not committed). Each `.s` file:

```
; func_<addr> — brief 205 / Phase 2: C-34 candidate. Duplicate
; pool entries for the same data symbol; pure `.s` recipe per
; brief 202 (`func_02023f7c.s`). Subsequent duplicate `.word`
; entries use literal values instead of symbol references to
; defeat the patcher's trim heuristic (PR #115 / brief 204).
```

## Recommendation for brief 206+

1. **Merge brief 204 first** — `tools/patch_section_align.py`'s
   relocation-aware trim-protect fix eliminates BOTH workarounds
   needed here, unlocks `func_02023478` plus any future C-34
   picks whose pool layout has the literal-with-zero-high-byte
   last entry, AND removes the "literal value drift" risk if a
   .bss data symbol's address ever shifts.

2. **Scan overlays** — brief 205 limited to main (per scope).
   29 of 62 C-34 candidates are in main; 33 are in overlays.
   Apply the same recipe to overlays in brief 206+.

3. **Decomper-helper script polish** — the generator at
   `/tmp/gen_c34_s.py` is decomper-local. If brief 206+ does
   another C-34 drain, formalising it under `tools/` (scaffolder
   lane) would make the workflow repeatable.

## Cross-references

- `docs/research/first-wave-wall-address-cse.md` — brief 202's
  C-34 wall research note + worked example
- `src/main/func_02023f7c.s` — brief 202's E-07 worked example
- `tools/patch_section_align.py` — patcher (trim-padding heuristic)
- Brief 204 (local commit 8118a9a, not yet merged) — patcher
  trim-protect fix that eliminates both workarounds documented
  here
