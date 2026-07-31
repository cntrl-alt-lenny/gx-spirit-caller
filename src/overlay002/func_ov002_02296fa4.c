/* func_ov002_02296fa4: side-selected table lookup (data_ov002_022cf16c
 * row + func_ov002_0220eb00's local[side]) gates two func_ov002_021bae7c
 * threshold checks (0x1964, 0x1982).
 */
#include "ov002_core.h"

extern void func_ov002_0220eb00(void *p, int *out);
extern int func_ov002_021bae7c(int a, int b, int c);

typedef struct {
    unsigned short pad0;
    unsigned short side : 1;
} Ov002_02296fa4_Arg;

int func_ov002_02296fa4(Ov002_02296fa4_Arg *p) {
    int local[2];
    int inv;
    int val;

    func_ov002_0220eb00(p, local);
    inv = 1 - p->side;
    val = *(int *)(data_ov002_022cf16c + (inv & 1) * 0x868) + local[inv];
    if (val <= 0) {
        return 1;
    }

    if (func_ov002_021bae7c(p->side, 0x1964, -1) != 0) {
        return 1;
    }

    return func_ov002_021bae7c(p->side, 0x1982, -1) != 0;
}
