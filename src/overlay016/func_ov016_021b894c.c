/* func_ov016_021b894c: rebuild row group 1 (palette unk1CD) — sibling of 8a30. */
#include "ov016_core.h"
extern char data_ov016_021b94d8[];
extern char data_ov016_021b94f8[];
extern char data_ov016_021b9518[];
extern char data_ov016_021b9538[];
extern void OS_SPrintf(void *a, void *b, int c);
extern void func_0201ef3c(int a, void *b, void *c);
extern void func_0201e7e0(void);
extern void func_0201ef90(void *a, void *b, void *c, int d, int e, int f, void *g, int h, int i, void *j);
extern int func_0201ede4(void *a, void *b);
void func_ov016_021b894c(void *arg0, void **arg1) {
    char *p = arg0;
    int tmp;
    OS_SPrintf(arg1[0], data_ov016_021b94d8, *(unsigned char *)(p + 461));
    OS_SPrintf(arg1[1], data_ov016_021b94f8, *(unsigned char *)(p + 461));
    OS_SPrintf(arg1[2], data_ov016_021b9518, *(unsigned char *)(p + 461));
    OS_SPrintf(arg1[3], data_ov016_021b9538, *(unsigned char *)(p + 461));
    if (*(int *)(p + 176) != 0) {
        func_0201ef3c(*(int *)(p + 92), p + 100, p + 176);
        *(int *)(p + 180) = 0;
        *(int *)(p + 176) = 0;
    }
    func_0201e7e0();
    func_0201ef90(p + 92, p + 96, p + 100, 24576, 512, 1, arg1, 1, -1, p + 176);
    *(int *)(data_ov016_021bb1a4 + 16) = func_0201ede4(&tmp, arg1[3]);
}
