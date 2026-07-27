/* data_020c3854 -- default/zero-initialized scanf-style directive
 * FormatSpec instance (40 bytes, single struct, no array bracket).
 *
 * Sole consumer func_020a9960.s: bulk-copies all 40 bytes onto a stack
 * frame (whole-struct instance access, not an array walk), then reads
 * and rewrites fixed sub-fields per parsed format directive. Every
 * offset accounted for: +0x0/+0x1/+0x2/+0x3 single-byte flags (all set
 * to 0 by the default instance), +0x4 a 32-bit field-width limit
 * (default INT_MAX = "unbounded", matching the ROM's own 0x7FFFFFFF
 * literal), +0x8 a 32-byte `%[...]` scanset character-class bitmap
 * (indexed via `base + (idx>>3)` with idx a runtime character value,
 * and two independent hard 32-iteration build loops -- computed-stride,
 * not size-inferred). Caller func_020a9e58.s independently reads back
 * offsets +0x0 and +0x3 of the same struct, confirming the field
 * layout from a second function. See
 * docs/queue/claude-scaffolder.md (cm-data-inference-5).
 */

typedef struct {
    unsigned char suppress;    /* +0x00 '*' assignment-suppression flag */
    unsigned char widthGiven;  /* +0x01 explicit width digits present */
    unsigned char lengthMod;   /* +0x02 length-modifier code (h/hh/l/ll/j/z/t/L) */
    unsigned char convType;    /* +0x03 conversion char / 0xFF invalid sentinel */
    int width;                 /* +0x04 field-width limit, default INT_MAX */
    unsigned char scanset[32]; /* +0x08 256-bit char-class bitmap for %[...] */
} FormatSpec020c3854;

const FormatSpec020c3854 data_020c3854 = {
    .suppress = 0, .widthGiven = 0, .lengthMod = 0, .convType = 0,
    .width = 0x7fffffff,
    .scanset = { 0 },
};
