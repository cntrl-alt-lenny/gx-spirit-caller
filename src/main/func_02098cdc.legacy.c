/* func_02098cdc: if the flag byte at +0x1f (top byte of the +0x1c word)
 * has bit 0 set, return the low 24 bits of the +0x1c word; otherwise
 * return the plain word at +0x08.
 *
 * The 24-bit extraction must be typed as a bitfield (v:24) -- a plain
 * `& 0xffffff` mask folds to a single `bic`, but the original emits the
 * literal `lsl #8; lsr #8` shift-pair a bitfield read produces (same
 * documented idiom as ov002_core.h's bitfield-container convention).
 * Matches on the mwcc 1.2/sp2p3 tier (.legacy.c), not the default
 * 2.0/sp1p5.
 *
 * Surfaced while sweeping the sm64ds "field-by-field copy + guard"
 * lever (cm-sm64ds-lever-apply) -- that lever doesn't apply here (no
 * struct/vector copy anywhere in this function), but the candidate
 * shipped anyway via this unrelated bitfield-typing fix.
 */
typedef unsigned char u8;
typedef unsigned int u32;

typedef struct {
    u32 v : 24;
    u32 hi8 : 8;
} W;

u32 func_02098cdc(u8 *p) {
    if (p[0x1f] & 1) {
        W *w = (W *)(p + 0x1c);
        return w->v;
    }
    return *(u32 *)(p + 0x8);
}
