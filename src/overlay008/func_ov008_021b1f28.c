#include "ov008_core.h"

extern int func_0208de94(void);
extern void func_02005088(void *, int, void *, int, int, int);
extern int func_02001e5c(void *);
extern void func_ov008_021b1d08(int);

void func_ov008_021b1f28(void) {
    int ret;
    int *o;

    (*(int **)data_ov008_021b270c)[9] += 1;
    (*(int **)data_ov008_021b270c)[8] += 1;

    if ((*(int **)data_ov008_021b270c)[8] >= (*(int **)data_ov008_021b270c)[6] + 0x60) {
        (*(int **)data_ov008_021b270c)[8] = 0;
    }

    if ((*(int **)data_ov008_021b270c)[26] != 0) {
        ret = func_0208de94();
        o = *(int **)data_ov008_021b270c;
        func_02005088((char *)o + 0x28, o[20], (char *)ret + 0x24e0, 6, o[13], 0xc);

        if (func_02001e5c((char *)(*(int **)data_ov008_021b270c) + 0x28) != 0) {
            (*(int **)data_ov008_021b270c)[26] = 0;
        } else {
            o = *(int **)data_ov008_021b270c;
            if ((unsigned int)o[13] > 0x8c) {
                o[23] = 1;
                (*(int **)data_ov008_021b270c)[26] = 0;
            }
        }
    }

    func_ov008_021b1d08((*(int **)data_ov008_021b270c)[23]);
}
