#include "ov008_core.h"

extern int func_02021174(void *p);
extern void func_02021428(void *p);
extern void func_02022228(int a, void *p);
extern void func_0202c8f4(int a, int b);
extern void func_0202c96c(int a);
extern void func_02021278(void);
extern void func_ov008_021b2144(int a, int b);
extern char data_020f8400[];

void func_ov008_021b21c0(int param) {
    if ((*(int **)data_ov008_021b25ec)[27] == param) return;
    (*(int **)data_ov008_021b25ec)[27] = param;

    if ((*(int **)data_ov008_021b25ec)[27] != 0) {
        if ((*(int **)data_ov008_021b25ec)[1] == 0) {
            (*(int **)data_ov008_021b25ec)[1] = func_02021174(data_020f8400);
            func_02021428((void *)(*(int **)data_ov008_021b25ec)[1]);
            func_ov008_021b2144((*(int **)data_ov008_021b25ec)[3], 1);
        }
        func_02022228(0x29, (char *)(*(int **)data_ov008_021b25ec) + 0x70);
        func_0202c8f4(1, 2);
    } else {
        if ((*(int **)data_ov008_021b25ec)[1] != 0) {
            func_02021278();
            (*(int **)data_ov008_021b25ec)[1] = 0;
        }
    }

    func_0202c96c((*(int **)data_ov008_021b25ec)[27]);
}
