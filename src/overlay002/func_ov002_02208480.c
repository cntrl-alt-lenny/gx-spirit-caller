#include "ov002_core.h"

extern int func_ov002_022016bc(void);
extern int func_ov002_021bff00(int a, int b);
extern int func_ov002_021c034c(int a, int b, int c);

int func_ov002_02208480(void) {
    if (func_ov002_022016bc() == 0)
        goto fail;
    {
        int r = func_ov002_021bff00(*(int *)(data_ov002_022cd3f4), *(int *)(data_ov002_022cd3f4 + 0x1c));
        if (r >= 2)
            return 1;
        if (r == 0)
            goto fail;
        if (func_ov002_021c034c(*(int *)(data_ov002_022cd3f4), *(int *)(data_ov002_022cd3f4 + 0x1c), 1) == 1)
            return 1;
    }
fail:
    return 0;
}
