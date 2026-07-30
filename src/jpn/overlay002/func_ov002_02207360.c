#include "ov002_core.h"

extern int func_ov002_021bb82c(int b0, int kind);

int func_ov002_02207360(struct Ov002Self *self) {
    struct Cmd { u16 f0; u16 pad0 : 6; u16 cmd : 6; u16 pad1 : 4; };
    if (((struct Cmd *)self)->cmd != 0x23) {
        if (func_ov002_021bb82c(self->b0, 0x1681) == 0) return 0;
        if (func_ov002_021bb82c(self->b0, 0x16b3) == 0) return 0;
        if (func_ov002_021bb82c(self->b0, 0x16b4) == 0) return 0;
    }
    return 1;
}
