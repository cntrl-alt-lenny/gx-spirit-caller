/* data_ov002_022ca3dc (140 bytes, 4-aligned): retyped from opaque bytes
 * to a 17-record `{s32 attr; void *ptr;}` array plus a trailing scalar
 * as part of cm-data-inference-8. Address and size are UNCHANGED --
 * the full 140 bytes were already correctly bounded by `delinks.txt`
 * (the next symbol, `data_ov002_022ca468`, is independently proven a
 * wholly separate 8-byte `s32[2]` object with its own consumer, so
 * there is no unclaimed space there for the trailing word to move
 * into).
 *
 * STRONG (entries[17]): triple-corroborated -- byte size (136 = 17*8),
 * `relocs.txt` (16 relocated `ptr` words + exactly 1 legitimate NULL,
 * every target a real `kind:data(any)` symbol, zero relocations
 * anywhere else in the range), and computed-stride consumer
 * func_ov002_0229f41c.s:52-59 (`base[idx*8]`, the `attr` half only --
 * the sole consumer never reads the `ptr` half, so that field's shape
 * rests on the relocation evidence alone, same tier already accepted
 * for shipped sibling data_ov012_021cc1e8).
 *
 * `trailer` (offset 0x88, value 3): genuinely unresolved -- no
 * relocation, no known consumer, kept as an honestly-unlabeled scalar
 * rather than guessed at (its value happens to match the modal `attr`
 * value, but that's not treated as evidence of anything).
 *
 * Raw address-literal casts for the pointer targets, not `extern char
 * X; &X` -- none of the 12 distinct targets are carved yet, and
 * ground truth for this symbol is `.rodata`; outer-`const`-only
 * (never `const void *`) to keep it there -- see
 * data_ov011_021d30f8.c / the queue header's own standing rule for
 * why either mistake would silently relocate this into `.data`.
 */

typedef struct {
    int attr;
    void *ptr;
} Ov002Ca3dcEntry;

typedef struct {
    Ov002Ca3dcEntry entries[17];
    int trailer;
} Ov002Ca3dcTable;

const Ov002Ca3dcTable data_ov002_022ca3dc = {
    .entries = {
        { 3, (void *)0x022cba7c }, { 3, (void *)0x022cba64 },
        { 3, (void *)0x022cba64 }, { 3, (void *)0x022cba5c },
        { 3, (void *)0x022cba5c }, { 3, (void *)0x022cba8c },
        { 3, (void *)0x022cbaa4 }, { 3, (void *)0x022cbaac },
        { 3, (void *)0x022cba94 }, { 5, (void *)0x022cba58 },
        { 3, (void *)0x022cba6c }, { 3, (void *)0x022cba7c },
        { 3, (void *)0x022cba7c }, { 3, (void *)0x022cba9c },
        { 3, 0 },
        { 3, (void *)0x022cba74 }, { 3, (void *)0x022cba84 },
    },
    .trailer = 3,
};
