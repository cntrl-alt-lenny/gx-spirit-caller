#include "ov005_core.h"
extern int func_ov005_021ad20c(void *);
extern void func_02005c60(int);
extern void func_02001ba4(void);
int func_ov005_021acf78(void) {
    *(int *)(data_ov005_021b1e4c + 16) = func_ov005_021ad20c(data_ov005_021b1e6c);
    func_02005c60(1);
    func_02005c60(2);
    func_02001ba4();
    return 1;
}
