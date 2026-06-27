/* CAMPAIGN-PREP candidate for func_022013d4 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     (bit0&1)*0x868 idx; cf178[idx]>0 guard; loop cf16c[idx+j*4+0x120] 13-bit; cf16c[idx+0xc] recheck
 *   risk:       permuter-class: orig keeps 0x868 in r8 and base cf16c in r4 across the loop, recomputing idx=r2 from a re-ldrh of bit0 each iter (r5 counter, r6=j*4); mwcc's induction-var/CSE choice for the two parallel cf16c reads is a reg-alloc coin-flip a reshape may not pin.
 *   confidence: low
 */
/* func_ov002_022013d4 (ov002, class C) — counted loop, mul/mla base + bind reg-alloc.
 * idx = (bit0&1)*0x868; cnt = cf178[idx]; for j<cnt:
 *   id = (cf16c[idx + j*4 + 0x120] 13-bit field);
 *   if (021e234... 0202e234(id)) return 1;
 *   cnt re-read from cf16c[idx + 0xc] each iter (idx recomputed from re-ldrh bit0).
 * return 0. */
typedef unsigned short u16;
typedef unsigned int   u32;

struct F022013d4_F2 {
    u16 bit0 : 1;
    u16 rest : 15;
};
struct F022013d4_Self {
    u16 f0;
    struct F022013d4_F2 f2;
};

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf178[];
extern int func_0202e234(int id);

int func_ov002_022013d4(struct F022013d4_Self *self) {
    int j = 0;
    if (*(int *)(data_ov002_022cf178 + (self->f2.bit0 & 1) * 0x868) > 0) {
        do {
            int idx = (self->f2.bit0 & 1) * 0x868;
            u32 rec = *(u32 *)(data_ov002_022cf16c + idx + j * 4 + 0x120);
            if (func_0202e234((int)((rec << 0x13) >> 0x13)) != 0)
                return 1;
            j++;
        } while ((unsigned)j < (unsigned)*(int *)(data_ov002_022cf16c + ((self->f2.bit0 & 1) * 0x868) + 0xc));
    }
    return 0;
}
