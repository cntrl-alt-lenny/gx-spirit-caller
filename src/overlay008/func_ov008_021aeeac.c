#include "ov008_core.h"
extern char data_020f87d8[];
extern char data_ov008_021b2eac[];
extern char data_ov008_021b2698[];
extern int func_020211c8(void *);
extern void func_0202147c(void *);
extern int func_02021660(int, int, int);
extern void func_020216b0(int, int, int);
extern void func_0202227c(int, void *);
void func_ov008_021aeeac(void) {
    char *g = data_ov008_021b2eac;
    int i;
    *(int *)(g + 8) = func_020211c8(data_020f87d8);
    func_0202147c(data_020f87d8);
    func_020216b0(func_02021660(*(int *)(g + 8), 3, 0), 2, 1);
    for (i = 0; i < 6; i++) {
        func_0202227c(i + 1, data_ov008_021b2698);
    }
}
