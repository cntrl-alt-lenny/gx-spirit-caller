# Data-carve TU alignment: a standing rule for splitting blobs across files

**Rule:** when carving one data blob into two pieces (an evidenced part
and an opaque/unevidenced remainder, or any other split), only put them
in **separate translation units** (separate `.c`/`.s` files, each its
own `delinks.txt` entry) if the split boundary is a **multiple of 4
bytes**. If it isn't, keep both symbols in **one** `.c` file instead —
two top-level globals in the same TU lay out contiguously with no gap
between them.

## Why this matters

mwldarm inserts a real alignment gap between two separately-linked
object files when the first one's section doesn't end on a 4-byte
boundary — **even though neither object's own section declares any
alignment requirement.** `objdump -h` on both objects shows `Algn
2**0` (no alignment asked for); the gap is a property of how the
*linker* places consecutive object-file sections, not something either
compiled object exposes on its own. This makes the bug invisible at
the single-object level: every individual `.o` can be byte/relocation-
perfect and the final ROM still comes out wrong.

Discovered in `cm-data-inference-5` (2026-07-26, PR #1371): splitting
`data_020b4a2c` (a 66-byte evidenced prefix — not a multiple of 4) from
its 174-byte unevidenced tail into two files caused a 2-byte gap after
the first object, cascading into a growing address offset through
every subsequent main-module symbol. A parallel split in the same wave
(`data_020b46a0`/`data_020b46b8`, boundary at 24 bytes — a multiple of
4) did **not** exhibit this. The alignment of the split point is what
matters, not the practice of splitting itself.

## How to tell if you've hit this

- `ninja sha1` fails, and the failure is **real and reproducible**
  across a fresh build and a full `ninja -t clean` rebuild (rules out
  stale-`.o` masking, a separate known failure class).
- Every individually touched object's compiled bytes and relocations
  check out via `objdump -s`/`-r` — nothing wrong at the single-file
  level.
- `cmp -l` between the built ROM and the baserom shows a huge number of
  differing bytes (tens of millions, not a handful) — this is *not* a
  sign of a widespread content bug; it's the signature of a small
  upstream size shift cascading through downstream overlay compression
  (LZ-family compression is highly sensitive to any change in its
  input, so a 2-byte shift early in the ARM9 binary can blow up into a
  huge apparent diff by the time it reaches a later overlay).

**Fast bisection:** run `ninja check` (dsd's module/symbol consistency
check — advisory only, not the real gate, but useful here purely as a
diagnostic). Look for `[ERROR] Symbol 'X' ... not found in linked
binary` / `Matching name found at <addr>` pairs. A **consistent,
non-zero address offset** starting at one specific symbol and
persisting through every symbol after it in the same module is the
signature of this bug class — the symbol named in the *first* such
error is (or immediately follows) the misaligned split boundary.
Independently confirm by reading the ROM header directly: the ARM9 (or
ARM7, or overlay) SIZE field at file offset `0x2C` (`struct
.unpack_from('<I', header, 0x2C)`) will not match the baserom's, even
though `ninja sha1`'s own byte-count check on the final `.nds` doesn't
tell you this directly.

## The fix

Keep both symbols in one `.c` file:

```c
const unsigned short data_020b4a2c[33] = { /* evidenced prefix */ };

/* opaque tail, no consumer evidence -- not forced into a shape */
const unsigned char data_020b4a6e[174] = { /* ... */ };
```

with a single `delinks.txt` entry spanning the whole original range.
This is exactly as valid a carve as two separate files — declining to
force a type onto the unevidenced remainder is still correct — it's
only the *file* split, not the *symbol* split, that's unsafe at a
non-4-byte boundary.
