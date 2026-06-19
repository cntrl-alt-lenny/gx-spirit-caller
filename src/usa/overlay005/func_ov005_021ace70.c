#include "ov005_core.h"
extern int func_ov005_021ad104(void *);
extern void func_02005c44(int);
extern void func_02001b84(void);
int func_ov005_021ace70(void) {
    *(int *)(data_ov005_021b1d4c + 16) = func_ov005_021ad104(data_ov005_021b1d6c);
    func_02005c44(1);
    func_02005c44(2);
    func_02001b84();
    return 1;
}
