[//]: # (markdownlint-disable MD013 MD041)

# Brief 600 — the unclaimed startup block

**Asked:** brief 596 (objective 2) found ~2,048 bytes of ARM9 startup
code in `main` with no `symbols.txt` entry at all — invisible to
`size_census.py`, `batch_carve.py`, and the byte-derived ledger alike.
Identify it, make it visible (symbols.txt entries, all 3 regions,
`dsd check modules` clean), and write — but do not execute — a carve
plan.

**Short answer:** it's the Nintendo DS **secure area** — a
cryptographically-protected 2,048 B boot-time region
(`0x02000000`-`0x02000800`) that requires the proprietary Blowfish-NDS
"KEY1" cipher to derive from source, which this project has already
declined to implement (brief 140, for the same region's ROM-header CRC
field). Interleaved with it, at the *same* addresses, is a
well-documented, unrelated, partially-drained family of 18-22 canonical
NitroSDK BIOS-SWI thunks (brief 011/013/115/116) — real, plaintext,
individually-matchable code, already tracked as its own decomp target.
Once the 18 already-named thunks are excluded, **1,972 bytes remain
across 19 discrete fragments, identical in count and total size in all
3 regions** — this is the actual brief-596 residue. `symbols.txt`
entries added for all 57 (19 × 3 regions); `ninja delink` clean in
every region. It should ship as a verbatim raw-byte `.s` per fragment,
not as reverse-engineered source — there's nothing to reverse-engineer.
Execution needs the wine lane (compile/link/sha1); this brief only
adds visibility and the plan.

## Objective 1 — identification

### The block, mechanically

ROM header fields (`orig/baserom_<region>.nds`, offset `0x20`,
standard NDS layout, independently cross-checked against dsd's own
`extract/<region>/arm9/arm9.yaml`): ARM9 `rom_offset=0x4000`,
`ram_address=0x02000000` (dsd's `base_address`), `entry_address=
0x02000800` (dsd's `entry_function`) — identical across all 3 regions.
`Entry` (the real, matched ARM9 entry point, `size=0x13c`) sits at
exactly `0x02000800`, so the 2,048 B window is everything *before* the
CPU's first executed instruction.

`extract/<region>/arm9/arm9.bin`'s bytes for this range are confirmed
byte-for-byte identical to the raw ROM file at the corresponding file
offset (`0x4000`-`0x4800`) — dsd's extraction doesn't transform this
region at all; what follows describes the game's actual shipped bytes,
not an extraction artifact.

### The marker and the entropy

All 3 regions independently begin with the **same 12-byte marker**:
`FF DE FF E7` repeated exactly 3 times, then diverge. This is not
inferred — it's a direct match to this project's own prior, already-
merged research: `tools/patch_rom_header_crc.py` (brief 140) says
verbatim: *"Our baseroms ship the secure area in encrypted form
(starts with `ff de ff e7…`, not the decrypted `encryObj…` marker)"*,
and separately: *"our built ROM has byte-identical secure-area bytes
to orig (verified — 0 diffs across `[0x4000..0x8000)`)"* — which gives
the *full* secure area's span: 16 KB (`0x02000000`-`0x02004000`), of
which the 2,048 B window here is the leading portion.

Past the marker, entropy measured directly against the raw ROM bytes
(bypassing dsd entirely): **7.876-7.879 bits/byte** in all 3 regions —
against a **5.508 bits/byte** baseline measured the same way over an
equally-sized span of already-matched, ordinary `main` code elsewhere
in the same binary (ruling out "real code just looks like this,
your entropy math is naive"). Cross-region byte comparison at the
identical address: EUR/USA/JPN agree on only 24-31 of 2,048 bytes
pairwise — statistically indistinguishable from three independent
random streams, and starkly inconsistent with "the same SDK source,
just relinked differently" (which would show far more structural
overlap, especially for a region this SDK-dense). This is the
fingerprint of per-title-keyed encryption (KEY1 derives its key from
each cartridge's own header/gamecode), not shared, recompiled code.

### The coexisting BIOS-thunk family (a real, separate, older story)

`src/main/README.md` (brief 011) and `docs/research/thumb-align-wall.md`
(briefs 011/013/115/116) already document a **canonical family of
NitroSDK BIOS-SWI thunks** (`VBlankIntrWait`, `Halt`, `CpuSet`, `Sqrt`,
…) that `dsd init` auto-names by signature, several of which live at
addresses *inside* this same 2,048 B window. These are genuine,
plaintext, individually-matched or matchable functions — confirmed
directly: `src/main/VBlankIntrWait.s` (hand-written Thumb, 6 B) exists,
carries its own detailed rationale comment about an mwcc/dsd-lcf
alignment wall, and the retrospective in `thumb-align-wall.md` records
the family growing to 22 total thunks with 18 shipped as of the most
recent pass referenced there. All 18 are independently confirmed named
in all 3 regions' `symbols.txt` (same 18 names, different per-region
addresses — link order shifts with each region's exact bundle of
localization code, exactly as expected for real linked functions, and
*not* at all how independently-keyed ciphertext would behave). This
family is real, already tracked, and **not** brief 596/600's residue —
it explains only `76` of the window's `2,048` bytes.

### The residue

Subtracting the 18 already-named thunks per region leaves **19
fragments totaling exactly 1,972 bytes in every one of EUR/USA/JPN**
(fragment *positions* differ per region, matching each region's own
thunk layout; the *count* and *total* do not). This 1,972 B is brief
596's actual finding. Composition: the very first fragment
(`0x02000000`-first-thunk) carries the `FF DE FF E7` marker; the rest
is the high-entropy tail described above.

**Verdict:** this is Nintendo's encrypted secure-area content. Not
recoverable as C or asm source without implementing the proprietary
Blowfish-NDS cipher — a cost this project already explicitly declined
to pay for the *much smaller* secure-area CRC problem in brief 140.
Already reproduced correctly in the current tree via dsd's automatic
`_dsd_gap@` copy-through (the same mechanism that makes brief 140's
"0 diffs" claim true today) — this brief closes a *visibility* gap,
not a *correctness* gap. Peer decomp projects (`pret/pokediamond`,
`pret/pokeheartgold` — both cited as references in this project's own
`thumb-align-wall.md`) carry dedicated `secure.s` / `_secure_IPGE.s`
files for the exact same DS-wide structural concept, under their own
established naming.

## Objective 2 — symbols.txt entries

Added one `kind:data(any)` entry per unclaimed fragment, named
`SecureAreaData_<addr>`, matching the project's existing bare-address
data-symbol convention (`data_<addr>`, `BuildInfo`, etc. — `any` is
the correct subkind since the content isn't structured `word` data,
just opaque bytes) and inserted at the address-sorted position
`symbols.txt` already maintains throughout. 19 entries × 3 regions =
**57 new lines**, none overlapping any existing thunk or `Entry`.

| Region | Fragments added | Bytes covered |
|---|---:|---:|
| EUR | 19 | 1,972 |
| USA | 19 | 1,972 |
| JPN | 19 | 1,972 |

### Verification

`dsd check modules` / `dsd check symbols` both turned out to require a
**wine-rebuilt ELF** to diff against the base ROM (`"Verifies that
built modules are matching the base ROM"`) — with only `ninja delink`
run (this brief's setup, deliberately wine-free), every module fails
checksum globally, before and independent of this brief's edits; not a
meaningful signal in a wine-free context, contrary to what the brief
assumed going in. The actual wine-free, native structural check dsd
offers is `ninja delink` itself, which parses `config.yaml` +
`symbols.txt` + `relocs.txt` end-to-end and would error on malformed,
duplicate, or overlapping symbol entries:

- **`ninja delink` re-run after the edits: exit 0, all 3 regions**
  (EUR/USA/JPN). Pre-existing warning counts (102/112/112 — unrelated
  cross-module relocation notes, none touching this address range)
  unchanged by grep-diff against the new symbol names and address
  range.
- **`size_census.py`**: EUR/USA/JPN `main` unmatched-function counts
  and byte totals (`0`/`58`/2390 B/`57`/2274 B) are **unchanged** by
  the new entries — correct, since `kind:data` is invisible to a
  function-only census, exactly as intended.
  Numbers match brief 596's own reconciliation table exactly.
- **`batch_carve.py --dry-run`**: zero `SecureAreaData_*` names ever
  appear as ARM/Thumb function candidates — confirms brief 596's own
  `kind:function`-only regex scoping correctly excludes these `kind:data`
  entries from the carve-candidate pipeline.

## Objective 3 — the carve plan (not executed)

**Does it need special secure-area/crypto handling to ship?** No —
that's specifically the trap to avoid. *Computing* the true bytes from
first principles needs Blowfish-NDS (declined, per brief 140).
*Copying* them verbatim needs nothing cryptographic at all — it's the
same "no-op, we already have the bytes" move `patch_rom_header_crc.py`
already makes for the secure-area CRC field. The normal delink flow
already accepts the new symbols cleanly (Objective 2). The open
question is purely mechanical: does it ship as `.s`, and how.

**Recommended shape — one raw-byte `.s` per fragment, generated, not
hand-written.** Precedent already exists in-tree:
`src/main/data_02102be8.s` and the several `data_*.s` files under
`src/*/overlay*/data/` already use `.byte`/`.ascii` directives for
verbatim byte content via mwasmarm, and `src/main/VBlankIntrWait.s`
already establishes the "hand-written `.s` + explanatory header
comment for why this isn't a normal compiled file" pattern for this
*exact* address range. 57 near-identical files (19 fragments × 3
regions) is too many to hand-maintain safely — recommend a small
generator (mirroring `patch_rom_header_crc.py`'s own "copy from orig,
don't hand-transcribe" philosophy): read each fragment's exact bytes
directly from `orig/baserom_<region>.nds` at the corresponding file
offset, emit `.byte` lines + a shared boilerplate header explaining
what this is and pointing at this doc, one `.s` file per
`SecureAreaData_<addr>` symbol.

**Kind:data carving infrastructure already exists** (the kind:data
carve harness shipped ahead of this brief — `asm_escape.py`'s
`kind:data` preflight path, wired into `batch_carve.py`) — the wine
lane should first try pointing the *existing* pipeline directly at
these 57 newly-visible symbols before writing anything bespoke. This
content's unusual fully-opaque nature (no internal structure to
shape-classify) is the one thing to verify doesn't trip up a preflight
step that assumes *some* recognizable shape; if it doesn't "just
work," the fallback is the generator above.

**Whether to actually carve at all — a real tradeoff, not a given:**
marking these 57 fragments `complete` would shrink
`endgame-ledger.md`'s reported gap by `1,972 × 3 = 5,916` bytes
project-wide, *without any actual reverse-engineering happening* — a
verbatim copy, honestly labeled, is not the same accomplishment as a
real C match, even though `progress.py`'s current `complete`/not-
complete accounting can't currently distinguish the two. Leaving it
uncarved keeps that distinction implicit (visible now, thanks to
Objective 2, but still counted as "gap"); carving it makes the ROM
byte-accounting cleaner at the cost of blurring a metric that up to
now has meant "real matched source." **Recommendation: carve it** —
the metric already conflates "matched via source" with "matched via
gap-fill copy-through" today for every OTHER un-symbolized region
in the codebase (that's the whole reason brief 596 found this in the
first place: an anonymous gap silently passes `ninja sha1` with zero
accounting either way) — carving with an honest, clearly-commented
`.s` file is strictly more transparent than the current silent gap,
not less. But this is a judgment call for whoever scopes the execution
brief, not a unilateral call this brief makes.

**Acceptance criteria for the wine lane that executes this:**

1. Generate (or hand-write, if the generator route stalls) 57 `.s`
   files, one per `SecureAreaData_<addr>` symbol, each containing the
   exact original bytes read from `orig/baserom_<region>.nds`.
2. `ninja` → `ninja objdiff` (or direct byte-diff against the delinked
   gap object, given `objdiff-cli`'s known ARM/Thumb panic on `main`
   noted in `src/main/README.md`) confirms each fragment byte-identical.
3. `ninja sha1` stays green in all 3 regions post-carve — the whole
   point is this is a no-op at the ROM level.
4. Mark each TU `complete` in `delinks.txt` with an honest source
   comment (not silently indistinguishable from a real C match);
   consider whether `endgame-ledger.md`/`progress.py` need a footnote
   or a "verbatim" tag so this doesn't get miscounted as decompilation
   progress in future summaries.

## Tests

`pytest -q` from the worktree root: all green (no `tools/` Python
logic changed this brief — only `config/*/arm9/symbols.txt` data and
this doc). Full tail pasted in the PR body.

## Cross-references

- `docs/research/brief-596-carve-census-autopsy.md` — objective 2,
  the origin of this brief's target.
- `docs/research/campaign-analytics/endgame-ledger.md` — the ledger
  whose `main`-gap numbers this residue explains.
- `tools/patch_rom_header_crc.py` — the direct project precedent for
  "copy from orig, don't compute" on this exact cryptographic region.
- `src/main/README.md`, `docs/research/thumb-align-wall.md` — the
  pre-existing, separate BIOS-SWI-thunk family this brief had to
  disentangle from its own residue.
- `src/main/VBlankIntrWait.s`, `src/main/data_02102be8.s` — direct
  in-tree syntax precedent for the recommended carve shape.

🤖 Generated with [Claude Code](https://claude.com/claude-code)
