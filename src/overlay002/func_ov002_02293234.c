#include "ov002_core.h"

extern int func_ov002_021bbd14(int player, int code);
extern int func_ov002_021bbf50(int player);
extern int func_ov002_021c3ae4(int player, int code);
extern int func_ov002_02280980(int player);

int func_ov002_02293234(struct Ov002Self *self) {
    if (func_ov002_021bbd14(self->b0, 0x16a0) != 0) return 1;
    if (func_ov002_021bbf50(self->b0) != 0) {
        if (func_ov002_021c3ae4(self->b0, 0x18ca) != 0) return 1;
        if (func_ov002_02280980(self->b0) > 0) return 1;
    }
    return 0;
}
