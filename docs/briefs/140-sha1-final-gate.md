### cloud/sha1-final-gate

**Goal:** **🎉 `ninja sha1` PASSES.** The project's stated
final gate. Brief 138 closed 99.995% of the SHA1 gap by
filtering `.DS_Store`. Brief 140 closes the remaining 5 EUR
bytes / 5 USA / 5 JPN — the two trivial residues brief 137
fully scoped. After this, the ROM is byte-identical to orig
across all three regions.

**Context — what brief 137 documented:**

Post-brief-138, EUR ROM diff is exactly **5 bytes**:

| Offset       | Field                    | Cat | Brief-140 owner       |
|--------------|--------------------------|-----|-----------------------|
| `0x6c-0x6d`  | Nintendo logo CRC16      | α   | CRC16 implementation  |
| `0x15e-0x15f`| Header CRC16             | α   | CRC16 implementation  |
| `0x8b30a`    | ov4 `ram_size` upper byte| β   | Patcher off-by-1024   |

USA / JPN: same 5 bytes (their pre-existing 2-byte main
displacement was closed by brief 136 → 3-region 27/27).

**Brief 140 deliverables — TWO parts, single PR:**

### Part 1 — Patcher off-by-1024 fix (Cat β, 1 byte)

`tools/patch_ov004_veneers.py` (brief 134) has an idempotent-
path bug. When `dsd rom config` regenerates the YAML on the
second invocation, the patcher's `expected_output_size` is
computed BEFORE the already-patched check, so on the
YAML-only re-invocation it derives:

```python
expected_output_size = len(data) - EXPECTED_OUTPUT_DELTA
#                    = 268192 - 1024
#                    = 267168   # WRONG — should be 268192
```

The 267168 value gets written into `arm9_overlays.yaml`'s ov4
`code_size`. `dsd rom build` then aligns to the next 512
boundary (267680 = 0x413a0) and writes that into the ROM
overlay table — 512 bytes short of orig's 0x417a0.

**Fix shape:** detect the already-patched state, branch
before computing `expected_output_size`:

```python
if data_is_already_patched(data):
    expected_output_size = len(data)
else:
    expected_output_size = len(data) - EXPECTED_OUTPUT_DELTA
```

The already-patched signature is documented in brief 134's
`patch_ov004_veneers.py`. Use whatever existing
`is_already_patched()` helper exists (or add one).

**Regression test**: extend
`tests/test_patch_ov004_veneers.py` (or sibling) with a
test that runs the patcher twice on the same input and
confirms `expected_output_size == len(data)` on the second
invocation. Also: confirm the resulting YAML `code_size`
matches orig.

### Part 2 — ROM-header CRC16 implementation (Cat α, 4 bytes)

Two CRC16 fields in the NDS ROM header that `dsd rom build`
doesn't compute:

| Offset  | Field               | CRC16 input range          |
|---------|---------------------|----------------------------|
| `0x6c`  | Nintendo logo CRC16 | header bytes `0xC0..0x15C` (the logo image, 156 bytes) |
| `0x15e` | Header CRC16        | header bytes `0x00..0x15D` |

Both use the standard NDS CRC16 polynomial:
- **Polynomial**: `x^16 + x^15 + x^2 + 1` (= `0xA001` reversed)
- **Init**: `0xFFFF`
- Standard implementation; well-documented in GBATEK §
  "DS Cartridge Header"

**New tool:** `tools/patch_rom_header_crc.py`. Reads the
built ROM, computes both CRCs over the correct ranges,
writes them in-place at `0x6c` and `0x15e`. Idempotent.

**Build wiring:** new `rom_header_crc` ninja rule modeled on
brief 138's `cleanup_macos_junk` integration. Runs as a
post-`rom_build` step. The output is the patched ROM
itself; mark with `restat=True` so `ninja sha1`'s SHA-1 check
only re-runs when bytes actually change.

**Tests:** `tests/test_patch_rom_header_crc.py` — known-
input → known-CRC table (golden values for the logo's fixed
156-byte image; sample header from one of the regions'
baseroms).

**Method:**

1. Read `docs/research/sha1-gap-scoping.md` (brief 137's
   analysis — Cat α / β sections).
2. Skim `tools/patch_ov004_veneers.py` (brief 134) for the
   existing patcher pattern + already-patched detection.
3. Read GBATEK / NDS header spec or copy a known-good
   reference CRC16 (e.g., from
   [`ndstool`](https://github.com/devkitPro/ndstool) or
   any DS homebrew SDK) — both algorithms are public.
4. Ship Part 1 + Part 2 + tests + wiring.
5. End-to-end gate: `ninja sha1` PASSES for EUR, USA, JPN.

**Non-scope:**

- ❌ ds-decomp upstream patch (file a follow-up issue if you
  wish; not blocking).
- ❌ Cluster work / decomp / data-tier.
- ❌ AGENTS.md / state.md edits beyond the PR.

**Success:**

- **`ninja sha1` PASSES for EUR.** 🎉
- **`ninja sha1` PASSES for USA.** 🎉
- **`ninja sha1` PASSES for JPN.** 🎉
- 3-region 27/27 module baseline preserved.
- Patcher idempotence regression test added.
- CRC16 golden-value regression test added.
- Markdown lint clean.

**Branch:** `cloud/sha1-final-gate`

**Priority:** HIGH. **🎉🎉🎉 This is the project's stated
final gate.** First byte-identical ROM rebuild across all
three regions.

**After this brief lands:**

1. **`ninja sha1` PASSES across EUR + USA + JPN.** First
   time in project history.
2. **Project enters maintenance mode** for the SHA1 path —
   any regression in the byte-identical chain is caught by
   `ninja sha1` going red.
3. **Data-tier work continues** in parallel (cluster B / D /
   ov004 sweep / cross-region apply) — those are decomp-
   tier wins that don't gate SHA1 but make the project more
   complete for future maintainers.
4. **W8 candidate filing (optional)**: open ds-decomp
   issue suggesting upstream CRC16 implementation + OS-junk
   filtering. Lets future projects drop the local patchers.
