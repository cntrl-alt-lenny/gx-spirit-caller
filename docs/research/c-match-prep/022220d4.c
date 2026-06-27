/* CAMPAIGN-PREP candidate for func_022220d4 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     sequential-if dispatch (7e/7f/80); f2b0:1 bitfield => lsl#31;lsr#31; bind global base once per use
 *   risk:       struct-guessed/reshape-able: f2b0:1 must emit ldrh+lsl#31+lsr#31 only if mwcc uses a 16-bit (short) bitfield container; an int container gives ldr and diverges.
 *   confidence: med
 */
/* func_ov002_022220d4: state-machine step keyed on global phase
 * *(int*)(data_022ce288+0x5a8); cases 0x7e/0x7f/0x80. */

extern unsigned char data_ov002_022ce288[];
extern unsigned char data_ov002_022d016c[];
extern int func_ov002_021ae400(int a, int b);
extern int func_ov002_021de910(void *o, int a, int b);
extern int func_ov002_0220e75c(void);
extern int func_ov002_0225764c();
extern int func_ov002_022577dc(void);
extern int func_ov002_0225935c(int a, int b, void *c);
extern int func_ov002_022593f4(void);

typedef struct Obj {
    unsigned short h0;          /* 0x00 */
    unsigned short f2b0 : 1;    /* 0x02 */
    unsigned short f2b1 : 5;
    unsigned short f2b6 : 6;
    unsigned short f2hi : 4;
    unsigned short pad4;        /* 0x04 */
    unsigned short pad6;        /* 0x06 */
    unsigned short pad8;        /* 0x08 */
    unsigned short ha;          /* 0x0a */
} Obj;

int func_ov002_022220d4(void *obj) {
    Obj *o = (Obj *)obj;
    int phase = *(int *)(data_ov002_022ce288 + 0x5a8);

    if (phase == 0x7e) {
        o->ha = 1;
        func_ov002_0220e75c();
        return 0;
    }
    if (phase == 0x7f) {
        if (func_ov002_022593f4() == 0) return 0x80;
        if (func_ov002_021de910(obj,
                                *(int *)(data_ov002_022d016c + 0xd70),
                                *(int *)(data_ov002_022d016c + 0xd74) +
                                *(int *)(data_ov002_022d016c + 0xd78)) != 0)
            return 0x7e;
        return 0;
    }
    if (phase != 0x80) return 0;

    if (func_ov002_022577dc() == 0) return 0;
    func_ov002_021ae400(o->f2b0, 0x6e);
    func_ov002_0225935c(o->f2b0, o->h0, func_ov002_0225764c);
    return 0x7f;
}
