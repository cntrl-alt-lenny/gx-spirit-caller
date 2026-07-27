/* data_ov012_021cc120 (24 bytes, 4-aligned): retyped from opaque bytes to
 * a { s8 kind, msgIdx1, msgIdx2, reserved } record[6] table as part of
 * cm-data-inference-6.
 *
 * Computed-stride consumers (both walled .s, no C match): func_ov012_021cb400.s:20-26
 * (`ldr r0,[r3,r1,lsl#2]`, sel = runtime param) and func_ov012_021cb49c.s
 * (3 sites: 198-223, 342-350+416-436, 456-498), all indexed by a runtime
 * nibble-field-derived idx. `kind==-1` is an explicit sentinel (line
 * ~347-350 `cmp r0,#-1`). Element count (6) is size-inferred, not
 * bound-proven by either consumer, but corroborated by an independent
 * sibling: src/overlay013/data_ov013_021cb7b4.c (already-shipped,
 * cm-data-inference-3) is byte-identical in 5 of 6 entries -- the same
 * UI table reused across ov012/ov013.
 */

typedef struct {
    signed char kind;     /* -1 = sentinel/none; else func_ov000_021ae394's arg0 */
    signed char msgIdx1;  /* +0x1d (cb49c) / +0x21 (cb400) -> func_0202c0c0() glyph lookup */
    signed char msgIdx2;  /* +0x21 -> func_0202c0c0() glyph lookup (cb49c only) */
    signed char reserved; /* never read by any of the 4 access sites */
} Ov012SlotEntry;

const Ov012SlotEntry data_ov012_021cc120[6] = {
    { -1, 0, 0, 0 },
    { 2, 1, 1, 0 },
    { -1, 0, 0, 0 },
    { 0, 0, 0, 0 },
    { 0, 2, 2, 0 },
    { 2, 3, 3, 0 },
};
