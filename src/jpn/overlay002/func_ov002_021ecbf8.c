#include "ov002_core.h"

extern char data_ov002_022cd314[];
extern int func_ov002_021bf1b4(int a, int b, int player, int idx, int e);

int func_ov002_021ecbf8(struct Ov002Self *self, int player, int idx) {
    if (idx >= 5) {
        return 0;
    }
    if (self->b0 != player) {
        return 0;
    }
    if (func_ov002_021c1e10(self, player, idx) == 0) {
        return 0;
    }
    if (*(int *)(data_ov002_022cd314 + 0x4) == player &&
        *(int *)(data_ov002_022cd314 + 0x20) == idx) {
        return 0;
    }
    return func_ov002_021bf1b4(*(int *)(data_ov002_022cd314 + 0x0),
                                *(int *)(data_ov002_022cd314 + 0x1c),
                                player, idx, 0);
}
