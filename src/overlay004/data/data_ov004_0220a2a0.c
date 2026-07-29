/* data_ov004_0220a2a0 (88 bytes, 4-aligned): wave 13 partial-struct
 * retype. relocs.txt proves exactly 2 pointer fields: from:0x0220a2a4
 * kind:load to:0x021dbf49 (offset+0x04) and from:0x0220a2a8 kind:load
 * to:0x021dbf31 (offset+0x08) -- both odd/thumb-bit-set, exactly
 * matching this overlay's own matched thumb functions
 * func_ov004_021dbf48 (size 0x24) and func_ov004_021dbf30 (size 0x18).
 * A third reloc, from:0x021dbf28 kind:load to:0x0220a2a0, proves
 * something else holds this whole struct's own address -- consistent
 * with this being one entry of a still-unclaimed dispatch table, not a
 * standalone singleton (0x021dbf28 falls just before both handler
 * functions, in a region with no symbol boundary of its own yet).
 *
 * The remaining 76 bytes have zero relocations and zero C-level
 * consumers anywhere in src/ or libs/ (the one indirect reference
 * above only takes this struct's address; nothing yet reads through
 * it) -- kept as honest opaque gaps rather than guessed types, per
 * this campaign's partial-struct standard (see data_021023c0,
 * cm-data-inference-11). Two non-zero words at offset 0x24/0x28 (both
 * 0x00001000) are visible but semantically unproven -- surfaced as
 * plain scalars rather than buried in a same-looking zero gap, since
 * that would misrepresent them as empty. A leading 0x00000001 at
 * offset 0x00 doesn't parse as a native little-endian int (that would
 * read 0x01000000); more likely 4 independent flag/type bytes, kept
 * untyped. The actual caller at 0x021dbf28 is itself still an
 * opaque/unmatched region -- a future wave that decompiles it could
 * split these gaps further.
 *
 * Raw address-literal casts, not named function refs, matching this
 * project's established convention for pointer-table entries
 * regardless of section (see data_ov022_021ab9a0, cm-data-inference-10)
 * -- ground truth here is .data (delinks.txt), so either form places
 * correctly, but literal casts keep the exact odd/thumb-bit address
 * visible directly in source.
 */

typedef void *HandlerFn0220a2a0;

typedef struct {
    unsigned char unk_00[4];
    HandlerFn0220a2a0 handler1;
    HandlerFn0220a2a0 handler2;
    unsigned char gap_0c[24];
    unsigned int unk_24;
    unsigned int unk_28;
    unsigned char gap_2c[44];
} PartialStruct0220a2a0;

PartialStruct0220a2a0 data_ov004_0220a2a0 = {
    { 0x00, 0x00, 0x00, 0x01 },
    (HandlerFn0220a2a0)0x021dbf49,
    (HandlerFn0220a2a0)0x021dbf31,
    { 0 },
    0x00001000,
    0x00001000,
    { 0 },
};
