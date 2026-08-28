/* func_ov002_021c3674: per-player id lookup. arg1's low-16-bit word packs a
 * 13-bit id (bits0-12) and a flag at bit13. id==0 -> return 0. Else query
 * func_0202e2a4(id); a nonzero result returns directly. Else re-read id and
 * query func_0202de48(id); if that's 3, forward (bit13, arg1) to
 * func_ov002_021ba108 (void, no explicit return value on this path).
 * Otherwise copy arg1's raw record word into the row's event-count-indexed
 * slot via func_ov002_021b90e4, bump the per-player event counter, and
 * return it. */
#include "ov002_core.h"

struct Rec3754 { unsigned int id : 13; unsigned int flag13 : 1; };

extern int func_0202e2a4(int id);
extern int func_0202de48(int id);
extern void func_ov002_021ba108(int arg0, int arg1);

int func_ov002_021c3674(int arg0, struct Rec3754 *arg1) {
    int off = (arg0 & 1) * 0x868;
    char *row = data_ov002_022cf08c + off;
    int *cntp = (int *)(data_ov002_022cf098 + off);
    int *dst = (int *)(row + 0x120) + *cntp;
    unsigned int id = arg1->id;

    if (id == 0)
        return id;

    {
        int r = func_0202e2a4(id);
        if (r != 0)
            return r;
    }

    if (func_0202de48(arg1->id) == 3) {
        func_ov002_021ba108(arg1->flag13, (int)arg1);
    } else {
        func_ov002_021b90e4(dst, (const int *)arg1);
        *cntp = *cntp + 1;
        return *cntp;
    }
}
