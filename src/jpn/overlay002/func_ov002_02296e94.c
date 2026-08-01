/* func_ov002_02296e94: side-selected table lookup (data_ov002_022cf08c
 * row + func_ov002_0220ea10's local[side]) gates two func_ov002_021bad9c
 * threshold checks (0x1964, 0x1982).
 */
#include "ov002_core.h"

extern void func_ov002_0220ea10(void *p, int *out);
extern int func_ov002_021bad9c(int a, int b, int c);

typedef struct {
    unsigned short pad0;
    unsigned short side : 1;
} Ov002_02296fa4_Arg;

int func_ov002_02296e94(Ov002_02296fa4_Arg *p) {
    int local[2];
    int inv;
    int val;

    func_ov002_0220ea10(p, local);
    inv = 1 - p->side;
    val = *(int *)(data_ov002_022cf08c + (inv & 1) * 0x868) + local[inv];
    if (val <= 0) {
        return 1;
    }

    if (func_ov002_021bad9c(p->side, 0x1964, -1) != 0) {
        return 1;
    }

    return func_ov002_021bad9c(p->side, 0x1982, -1) != 0;
}
