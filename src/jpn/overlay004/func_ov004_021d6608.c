#include "ov004_core.h"
extern char data_02103fcc[];
extern void func_02012470(int a, void *b);
extern void func_02034838(int a, void *b, int c);
int func_ov004_021d6608(short arg0) {
    char buf[512];
    *(short *)buf = arg0;
    func_02012470(*(int *)(data_02103fcc + 3132), buf + 2);
    func_02034838(3, buf, 0x126);
    return 1;
}
