/* CAMPAIGN-PREP candidate for func_02204e20 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfield a; mul parity*0x868 for count then mla for limit reload; counted do-while
 *   risk:       struct-guessed + bind/reload: count read via mul(data_022cf178), limit via mla(data_022cf16c[+0xc]) re-extracting code.a each iter. mwcc may hoist obj->code.a or the base — reshape-able by re-reading inside loop; loop bound is unsigned bcc.
 *   confidence: low
 */
#include "types.h"

typedef struct Code_e20 {
    u16 a : 1;
    u16 b : 5;
    u16 c : 6;
    u16 d : 2;
    u16 e : 2;
} Code_e20;

typedef struct Obj_e20 {
    u16 id;          /* +0x0 */
    Code_e20 code;   /* +0x2 */
} Obj_e20;

typedef struct Cnt_e20 {
    int count;       /* +0x0 (read at [base]) */
    u8 pad4[0x8];
    int limit;       /* +0xc */
} Cnt_e20; /* 0x868 stride per parity */

extern int data_ov002_022cf178[2][0x868 / 4];
extern Cnt_e20 data_ov002_022cf16c[2];
extern int func_ov002_021ff3bc(void);
extern int func_ov002_021bbf50(int a);
extern int func_ov002_021ff320(void *a, void *b);
extern int func_ov002_022536e8(u16 id, int j);

int func_ov002_02204e20(Obj_e20 *obj, void *arg) {
    int parity;
    int j;
    int n;
    if (func_ov002_021ff3bc() == 0) {
        return 0;
    }
    if (func_ov002_021bbf50(obj->code.a) != 0) {
        return 0;
    }
    if (func_ov002_021ff320(obj, arg) == 0) {
        return 0;
    }
    parity = obj->code.a & 1;
    n = data_ov002_022cf178[parity][0];
    j = 0;
    if (n > 0) {
        do {
            if (func_ov002_022536e8(obj->id, j) != 0) {
                return 1;
            }
            j++;
        } while ((u32)j < (u32)data_ov002_022cf16c[obj->code.a & 1].limit);
    }
    return 0;
}
