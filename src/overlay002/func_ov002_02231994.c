#include "ov002_core.h"

typedef unsigned short u16;
typedef struct { u16 f0; u16 b0 : 1; } Self02231994;

extern int func_ov002_0220e518(void);
extern void func_ov002_021e13f4(int a, int b, int c);

int func_ov002_02231994(Self02231994 *self) {
    if (CE288->f_5a8 == 0x7f)
        goto case_7f;
    if (CE288->f_5a8 != 0x80)
        goto default_case;
    return func_ov002_0220e518() != 0 ? 0x7f : 0;
case_7f:
    func_ov002_021e13f4(1 - self->b0, 2, 1);
    return 0;
default_case:
    return 0;
}
