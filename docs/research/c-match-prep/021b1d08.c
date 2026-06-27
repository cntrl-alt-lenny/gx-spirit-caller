/* CAMPAIGN-PREP candidate for func_021b1d08 (ov008, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: memcpy 0x50; /4 then /10 magic for %20 index; 3x5 OAM fill; *15 via rsb lsl#4
 *   risk:       struct-guessed + permuter-class: the umull divmod (v/4 bias then *0xcccccccd>>4, *20 remainder) is the exact %20 idiom but the two nested fill loops use ip/r3/r4 in a specific order and `add ip,#0x36` row stride; mwcc loop reg-alloc + the strh post-inc won't reshape cleanly.
 *   confidence: low
 */
/* func_ov008_021b1d08 — 0x50-byte struct-copy + umull divmod index + dual fill loops.
 * data_ov008_021b23e0 = 0x50-byte source table copied to a stack buffer;
 * (*data_ov008_021b270c)->f0x24 drives a /4 then /10 magic (0xcccccccd) to
 * index the local buffer; func_0208e1cc()+0xf6+0x400 gives the OAM dest base. */
#include "ov008_core.h"
#include <string.h>

extern int func_0208e1cc(void);

void func_ov008_021b1d08(int a0) {
    int buf[20];                                   /* 0x50 bytes */
    int *o = *(int **)data_ov008_021b270c;
    int v, q, sel, i, j;
    unsigned short *p;
    memcpy(buf, data_ov008_021b23e0, 0x50);        /* ldmia/stmia x5 loop */
    v = o[0x24 / 4];                               /* [r0,#0x24] */
    q = (v / 4) / 10;                              /* asr/umull 0xcccccccd */
    sel = buf[(v / 4) - 20 * q];                   /* index = (v/4) % 20 */
    p = (unsigned short *)(func_0208e1cc() + 0xf6 + 0x400);
    if (a0 == 0 || sel < 0) {
        for (i = 0; i < 3; i++) {                  /* fill 0 */
            for (j = 0; j < 5; j++) *p++ = 0;
            p = (unsigned short *)((char *)p + 0x36);
        }
    } else {
        int base = sel * 15 + 0x290;              /* rsb r5,r5,r5 lsl#4 = *15 */
        for (i = 0; i < 3; i++) {
            for (j = 0; j < 5; j++) { *p++ = (unsigned short)(base | 0x4000); base++; }
            p = (unsigned short *)((char *)p + 0x36);
        }
    }
}
