#include "ov002_core.h"

extern int func_ov002_022015cc(void);
extern int func_ov002_021bfe20(int a, int b);
extern int func_ov002_021c026c(int a, int b, int c);

int func_ov002_02208390(void) {
    if (func_ov002_022015cc() == 0)
        goto fail;
    {
        int r = func_ov002_021bfe20(*(int *)(data_ov002_022cd314), *(int *)(data_ov002_022cd314 + 0x1c));
        if (r >= 2)
            return 1;
        if (r == 0)
            goto fail;
        if (func_ov002_021c026c(*(int *)(data_ov002_022cd314), *(int *)(data_ov002_022cd314 + 0x1c), 1) == 1)
            return 1;
    }
fail:
    return 0;
}
