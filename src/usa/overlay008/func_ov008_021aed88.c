#include "ov008_core.h"
extern char data_020f86f8[];
extern char data_ov008_021b2d8c[];
extern char data_ov008_021b2578[];
extern int func_02021174(void *);
extern void func_02021428(void *);
extern int func_0202160c(int, int, int);
extern void func_0202165c(int, int, int);
extern void func_02022228(int, void *);
void func_ov008_021aed88(void) {
    char *g = data_ov008_021b2d8c;
    int i;
    *(int *)(g + 8) = func_02021174(data_020f86f8);
    func_02021428(data_020f86f8);
    func_0202165c(func_0202160c(*(int *)(g + 8), 3, 0), 2, 1);
    for (i = 0; i < 6; i++) {
        func_02022228(i + 1, data_ov008_021b2578);
    }
}
