/* CAMPAIGN-PREP candidate for func_021b2514 (ov015, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     explicit switch (cmp/beq chain); stores in exact asm order; signed-short fields; re-read for ldrsh
 *   risk:       Case 2's interleaved ldrsh re-reads vs strh writes pin a precise load/store schedule; mwcc may reorder the independent stores or fold the re-read of f56/f4e into the just-stored value, dropping a ldrsh. reshape-able if it diverges (split temps / reorder), but the schedule is delicate. struct-guessed offsets.
 *   confidence: med
 */
/* func_ov015_021b2514 (ov015, class C/D): 3-way switch writing many strh fields.
 * STORE-ORDER critical: emit field stores in the EXACT asm order. Fields are
 * signed 16-bit (ldrsh on reads). Case 2 RE-READS f3c/f42/f44/f46/f4e/f56 via
 * ldrsh after earlier strh — so read them back from the struct (forces ldrsh),
 * do not reuse the stored temp. Default (sel not 0/1/2) returns. */

typedef struct {
    char           _p00[0x4];
    int            f4;       /* +0x04 word */
    int            f8;       /* +0x08 word */
    char           _p0c[0x4];
    int            f10;      /* +0x10 word */
    char           _p14[0x20];
    short          f34, f36, f38, f3a;   /* +0x34.. */
    short          f3c, f3e, f40, f42;   /* +0x3c.. */
    short          f44, f46, f48, f4a;   /* +0x44.. */
    char           _p4c_lo[0];
    short          f4c, f4e, f50, f52;   /* +0x4c.. */
    short          f54, f56, f58, f5a;   /* +0x54.. */
} Obj2514;

void func_ov015_021b2514(Obj2514 *o, int sel, int x, int y) {
    switch (sel) {
    case 0:
        o->f3c = (short)x;
        o->f3e = (short)y;
        o->f40 = (short)(x + 0x18);
        o->f42 = (short)(y + 0x14);
        return;
    case 1:
        o->f44 = (short)x;
        o->f46 = (short)y;
        o->f48 = (short)(x + 0x18);
        o->f4a = (short)(y + 0x14);
        return;
    case 2:
        o->f34 = o->f3c;
        o->f36 = o->f42;
        o->f38 = o->f48;
        o->f3a = (short)(o->f46 + 4);
        o->f4c = o->f3c;
        o->f4e = o->f42;
        o->f50 = (short)(o->f3c + 0x18);
        o->f52 = (short)(o->f42 + 0x15);
        o->f54 = o->f44;
        o->f56 = (short)(o->f46 - 0x11);
        o->f58 = (short)(o->f44 + 0x18);
        o->f5a = (short)(o->f46 + 4);
        o->f4 = 0;
        o->f8 = o->f56 - o->f4e;
        o->f10 = o->f4e;
        return;
    default:
        return;
    }
}
