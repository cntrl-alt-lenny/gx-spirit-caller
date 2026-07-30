#include "ov002_core.h"

extern int func_ov002_021b9ecc(int a, int b);
extern int func_0202ed90(int a);
struct F6Bits5 { u16 pad:6; u16 field6:6; u16 rest:4; };

int func_ov002_0220e33c(void *self) {
    struct F6Bits5 *bits = (struct F6Bits5 *)((char *)self + 2);
    if (bits->field6 != 0x12) goto done;
    {
        int selfbit0 = ((struct Ov002Self *)self)->b0;
        int cd4 = *(int *)(data_ov002_022cd3f4 + 0x4);
        int cd20 = *(int *)(data_ov002_022cd3f4 + 0x20);
        if (cd4 != selfbit0) goto done;
        if (*(int *)(data_ov002_022cd3f4 + 0x8) != 0) goto done;
        if (func_0202ed90(func_ov002_021b9ecc(cd4, cd20)) == 0) goto done;
        {
            u16 val = *(u16 *)((char *)data_ov002_022cf1a4 + (cd4 & 1) * 0x868 + cd20 * 20);
            if (val != 0) return 1;
        }
    }
done:
    return 0;
}
