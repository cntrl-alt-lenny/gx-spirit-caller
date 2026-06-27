/* CAMPAIGN-PREP candidate for func_0205673c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     alloc ptr lives on stack, RELOAD base each store (ldr r1,[sp]); pass &p (sp slot) to callees; i<6 pair loop
 *   risk:       Orig reloads `ldr r1,[sp]` before every store (stack-spilled ptr) rather than holding a callee-saved base. If mwcc keeps p in a register, ~14 ldr vanish. permuter-class (spill heuristic). Tail r4=movs result + struct-guessed.
 *   confidence: low
 */
#include "nitro/types.h"

extern void  func_020453b4(void *p);
extern void *func_020453e8(u32 size);
extern void  func_02055320(void);
extern void  func_02055330(void);
extern s32   func_02056594(void *o);
extern void  func_020566f4(void *o);
extern s32   func_0205d944(void *o);
extern void  func_020604a4(void *o, void *q);
extern void  func_020a73d4(void *dst, s32 v, u32 n);
extern void  func_020a9950(void);

extern u8 data_020fff40[]; /* _LIT0 target */

typedef struct Alloc {
    u8   f0;             /* 0x0 */
    u8   _pad1[0x100 - 0x1];
    s32  f100;           /* 0x100 */
    s32  f104;           /* 0x104 */
    s32  f108;           /* 0x108 */
    s32  f10c;           /* 0x10c */
    u8   _pad110[0x1a4 - 0x110];
    /* per-index pair at 0x1a4 / 0x1a8, stride 8, i<6 */
    s32  slot[6][2];     /* 0x1a4: [i].0=0x1a4+i*8, [i].1=0x1a8+i*8 */
    u8   _pad1d4[0x418 - (0x1a4 + 6*8)];
    s32  f418;           /* 0x418 */
    u8   _pad41c[0x420 - 0x41c];
    s32  f420;           /* 0x420 */
    u8   _pad424[0x460 - 0x424];
    s32  f460;           /* 0x460 */
    u8   _pad464[0x46c - 0x464];
    s32  f46c;           /* 0x46c */
    s32  f470;           /* 0x470 */
} Alloc;

typedef struct Holder {
    Alloc *p;            /* 0x0 */
} Holder;

s32 func_0205673c(Holder *o, s32 a1, s32 a2)
{
    Alloc *p;
    s32 i;

    o->p = 0;
    p = (Alloc *)func_020453e8(0x490);
    if (p == 0) {
        return 1;
    }
    func_020a73d4(p, 0, 0x490);
    p->f0 = 0;
    p->f418 = 0;
    p->f100 = 1;
    p->f104 = 0;
    p->f108 = 0;
    p->f10c = 0;
    p->f46c = a1;
    p->f470 = a2;
    if (func_0205d944((void *)&p) != 0) {
        p->f420 = 0;
        for (i = 0; i < 6; i++) {
            p->slot[i][0] = 0;
            p->slot[i][1] = 0;
        }
        p->f460 = 0;
        func_020604a4((void *)&p, data_020fff40);
        if (func_02056594((void *)&p) != 0) {
            func_020566f4((void *)&p);
            return func_02056594((void *)&p); /* r0 holds prior result in r4 */
        }
        return 0;
    }
    func_020453b4(p);
    p = 0;
    return 1;
}
