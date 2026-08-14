/* func_ov002_02259774: stash (bit0,val5,val8,flag) into D016C, look up a
 * slot via func_ov002_021c93f0 three times (id, then two packed-word
 * derefs combined into f_d60), and if val5<=4 also derive f_d5c via
 * func_ov002_021b9ecc(bit0, val5+val8). */
#include "ov002_core.h"

struct P3Bits02259774 {
    unsigned int _pad0_21 : 22;
    unsigned int field8 : 8;
};
struct P2Bits02259774 {
    unsigned int _pad0_12 : 13;
    unsigned int bit13 : 1;
};

extern int *func_ov002_021c93f0(int bit0, int val5, int val8);
extern int func_ov002_021b9ecc(int bit0, int sum);

void func_ov002_02259774(int bit0, int val5, int val8, int flag) {
    struct Ov002Slot *p1;
    struct P2Bits02259774 *p2;
    struct P3Bits02259774 *p3;

    D016C->f_d70 = bit0;
    D016C->f_d74 = val5;
    D016C->f_d78 = val8;
    D016C->f_d64 = flag;
    D016C->f_d50 = 1;
    D016C->f_d68 = 0;

    p1 = (struct Ov002Slot *)func_ov002_021c93f0(bit0, val5, val8);
    D016C->f_d5c = p1->id;

    p2 = (struct P2Bits02259774 *)func_ov002_021c93f0(bit0, val5, val8);
    p3 = (struct P3Bits02259774 *)func_ov002_021c93f0(bit0, val5, val8);

    D016C->f_d60 = p2->bit13 + (p3->field8 << 1);
    D016C->f_d48 = 0;

    if (val5 <= 4) {
        D016C->f_d5c = func_ov002_021b9ecc(bit0, val5 + val8);
    }
}
