# cm-data-inference-11 — data wave 11

2026-07-27. Continues the opaque-blob data-retyping campaign with the
same method: parallel read-only `Explore` agents, exhaustive symbol-grep
+ `relocs.txt` address cross-check, classify fixed-offset (WEAK) vs
computed-stride (STRONG), never force a type onto insufficient evidence,
implement centrally afterward.

No specific carried-over lead. Live census re-run fresh: only **28**
opaque blobs remained (down sharply from 35 at wave 10's start). After
excluding symbols already conclusively settled by prior waves, only
**3 genuinely fresh candidates** remained — the smallest pool this
campaign has seen. Rather than dispatch a thin batch of fresh-only
candidates, this wave deliberately mixed in 5 higher-value picks: 1
cluster-completion check (verifying an assumed-identical 3rd cluster
member rather than just inferring it), 2 revisits of old wave-5 declines
under the newer partial-struct standard (waves 8-10), and 2 investigations
of the never-carved `delinks.txt` gaps flagged as optional in wave 9's
writeup.

## Results

| Symbol | Outcome | Evidence |
|---|---|---|
| `data_020bebec` | no change (3rd cluster member, independently confirmed not just assumed) | same strcpy/strcat scratch-buffer idiom as its two wave-10-confirmed siblings |
| `data_ov011_021d3060` | no change (reconfirms wave 3→4 CONTRADICTION) | a pointer block sits mid-array (offsets 96-111), not at an edge — no clean boundary to carve, correctly left opaque |
| `data_ov006_021ce2ac` | **shipped** — `kv_t[4]` | 3rd instance of the wave-7 key/value table family, triple-region confirmed |
| `data_ov006_021ce29c` | **shipped** — `kv_t[4]` | 4th instance of the same family, ends with a `{-1,0}` sentinel |
| `data_ov002_022c834c` | **shipped** — new carve, `const unsigned int[2]` | never-carved gap; 2-element table, index bound-checked against #0x2 twice |
| `data_ov002_022c8354` | **shipped** — new carve, function-pointer table `[5]` | never-carved gap; element count proven 4 independent ways |
| `data_021023c0` | **shipped** — partial struct, resolves wave-5 decline | `{int mode; handler; gap[16]}`; cross-region moot via the same build-exclusion proof used for `data_02102120` (wave 10) |
| `data_020fe55c` | **shipped** — partial struct, resolves wave-5 decline | `{char *name; gap[8]; 3×int; gap[4]}`; a relocated pointer field plus 3 write-only fields of unproven semantics |

6 of 8 shipped (75%) — the highest hit rate of any wave since wave 8's
100% outlier, achieved by deliberately targeting revisits and never-
carved gaps rather than a thin fresh-only batch.

## A real implementation bug, caught by the module checksum, not guessed

The first build of this wave's 6 changes failed `ninja sha1` outright.
`dsd check modules` immediately isolated it to ARM9 main (no overlay
module affected), narrowing the search to this wave's 2 `src/main/`
changes. The cause: a hand-transcription error in `data_020fe55c`'s
`gap_0x04[8]` field — written as all-zero, when the actual bytes at
that offset are `{0x00,0x00,0x00,0x00,0x00,0x10,0x00,0x00}` (a stray
`0x10` at relative index 5, absolute offset 9). Caught immediately
because the byte content was re-verified against the original array
literal rather than assumed, and because this project's gate always
byte-diffs against the real ROM rather than trusting a plausible-looking
initializer. Fixed by copying the exact bytes from the pre-edit file
content rather than re-deriving them from memory; rebuilt clean on the
second attempt.

## Two never-carved gaps, filled

Wave 9 noted two small `symbols.txt`-declared-but-never-`delinks.txt`-
claimed gaps near the `data_ov002_022c8368` cluster (itself a wave-8
boundary-merge fix) as an optional, non-blocking lead. Both turned out
to be real, evidenced objects rather than dead padding: `data_ov002_022c834c`
(8 bytes, a 2-element card-ID-range table) and the immediately-following
`data_ov002_022c8354` (20 bytes, a 5-slot function-pointer dispatch
table, sibling to two other still-uncarved tables driven by the same
consumer loop). Both required raw address-literal casts rather than
named function references for the pointer-containing table, per this
campaign's standing const-placement rule — even for entries whose
target functions are already independently matched, real C, since a
bare function reference (with or without `&`) creates a link-time
relocation exactly like `&dataSymbol` does, and this table's ground
truth is `.rodata`.

## Gate

First `ninja` (EUR) build failed SHA-1 (see bug above); second attempt,
after the fix, passed clean with zero `.data`/`.rodata` link-warning
class of failure. Full `python tools/gate3.py --scope all` (3-region
SHA-1 + pytest) run to confirm USA/JPN and the test suite.

## Hit rate and a note on the pool's trajectory

6 of 8 fresh-batch investigations shipped (75%), plus the cluster-
completion and CONTRADICTION-reconfirmation both landed exactly as
expected (useful, not wasted). This wave's pool was the thinnest yet —
only 3 truly untouched candidates in the entire `main` + all-overlays
opaque-blob census. Future waves should expect this trend to continue:
either shrink the fresh-batch size accordingly, lean more heavily on
revisiting old declines (which this wave's 2/2 revisit success rate
suggests is still a productive lever), or treat the standing USA/JPN-only
items as the primary remaining EUR-adjacent work once the main census is
fully exhausted.
