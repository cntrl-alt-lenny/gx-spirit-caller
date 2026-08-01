#include "ov002_core.h"

struct Ov1640Obj {
    char _pad0[2];
    unsigned short b0 : 1;
};

extern int func_ov002_021bce20(int a);
extern int func_ov002_021bad9c(int arg0, int arg1, int arg2);
extern int func_ov002_022816e4(int a);
extern int func_ov002_02259e8c(int x);
extern int func_ov002_021baf88(int arg0);
extern int func_ov002_0227afc8(int a, int b, int c);
extern int func_ov002_02280870(int arg0);

/* func_ov002_02291530: a chain of per-player probes on obj->b0 (bit0 of
 * the halfword at +0x2, re-read fresh at every use rather than cached —
 * matches the ground truth's repeated ldrh). The 021bcf00 result from
 * the very first probe is kept live (r4) and reused ~halfway through.
 */
int func_ov002_02291530(void *r5) {
    struct Ov1640Obj *o = r5;
    int r4;

    r4 = func_ov002_021bce20(1 - o->b0);
    if (r4 == 0) {
        return 0;
    }

    if (func_ov002_021bad9c(o->b0, 0x1a7e, -1) != 0) {
        return 0;
    }

    {
        int a = func_ov002_022816e4(1 - o->b0);
        int b = func_ov002_022816e4(o->b0);
        if (a > b) {
            return 1;
        }
    }

    if (r4 >= 2) {
        if (r4 > func_ov002_021bce20(o->b0)) {
            return 1;
        }
    }

    if (func_ov002_02259e8c(o->b0) == 0) {
        return 0;
    }

    if (func_ov002_021baf88(0x140e) == 0 && func_ov002_021baf88(0x17a6) == 0) {
        goto ret_zero;
    }

    {
        int score = func_ov002_0227afc8(o->b0, -1, 0);
        int bit0 = o->b0;
        int other = (1 - bit0) & 1;
        int tableVal = *(int *)(data_ov002_022cf08c + other * 0x868);
        if (score < tableVal && score < 0x960) {
            goto ret_zero;
        }
        if (func_ov002_02280870(bit0) > 0) {
            return 1;
        }
    }

ret_zero:
    return 0;
}
