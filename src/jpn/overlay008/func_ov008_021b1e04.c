#include "ov008_core.h"

extern int func_0208ddac(void);
extern void func_0200506c(void *, int, void *, int, int, int);
extern int func_02001e3c(void *);
extern void func_ov008_021b1be4(int);

void func_ov008_021b1e04(void) {
    int ret;
    int *o;

    (*(int **)data_ov008_021b25ec)[9] += 1;
    (*(int **)data_ov008_021b25ec)[8] += 1;

    if ((*(int **)data_ov008_021b25ec)[8] >= (*(int **)data_ov008_021b25ec)[6] + 0x60) {
        (*(int **)data_ov008_021b25ec)[8] = 0;
    }

    if ((*(int **)data_ov008_021b25ec)[26] != 0) {
        ret = func_0208ddac();
        o = *(int **)data_ov008_021b25ec;
        func_0200506c((char *)o + 0x28, o[20], (char *)ret + 0x24e0, 6, o[13], 0xc);

        if (func_02001e3c((char *)(*(int **)data_ov008_021b25ec) + 0x28) != 0) {
            (*(int **)data_ov008_021b25ec)[26] = 0;
        } else {
            o = *(int **)data_ov008_021b25ec;
            if ((unsigned int)o[13] > 0x8c) {
                o[23] = 1;
                (*(int **)data_ov008_021b25ec)[26] = 0;
            }
        }
    }

    func_ov008_021b1be4((*(int **)data_ov008_021b25ec)[23]);
}
