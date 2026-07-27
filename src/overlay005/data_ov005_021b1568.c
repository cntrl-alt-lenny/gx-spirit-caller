/* data_ov005_021b1568 (20 bytes, 4-aligned): retyped from opaque bytes to
 * a mixed-evidence struct as part of cm-data-inference-9. Fields, by
 * tier: blend_gradient[4] is STRONG -- loop-bound-proven (count literal
 * 4 at func_ov005_021ad35c.s:70, consumed via a genuine per-iteration
 * pointer-incremented loop in func_ov005_021b0a10.s) RGB555 4-stop blend
 * ramp. rect_w/rect_h are WEAK-but-ground-truthed -- a single fixed-offset
 * read, but the already-matched consumer func_ov005_021aeefc.c proves
 * they're consumed as packed `unsigned char` fields of a
 * {u16 x,y; u8 w,h;} rect, not native u16 (the u16 x/y half of that same
 * struct is always overwritten before use in this call site -- dead,
 * folded into unk_08 below). unk_0e[6] has zero consumers anywhere and
 * stays opaque. Matches this campaign's wave-7 "N evidenced bytes + rest
 * opaque" precedent (data_ov012_021cc06c/021cc080). No cross-region
 * divergence -- USA/JPN consumers are byte-identical at the same offsets.
 */

typedef struct {
    unsigned short blend_gradient[4];
    unsigned short unk_08[2];
    unsigned char rect_w;
    unsigned char rect_h;
    unsigned char unk_0e[6];
} Ov005Blob021b1568;

const Ov005Blob021b1568 data_ov005_021b1568 = {
    { 0x4080, 0x7e40, 0x7f20, 0x7f60 },
    { 0x0000, 0x0000 },
    0x11,
    0x0f,
    { 0x02, 0x00, 0x02, 0x00, 0x00, 0x00 },
};
