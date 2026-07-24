/* func_ov016_021b8a30: rebuild row group 0 — register its four cell configs
 * (palette unk1CC), release the old built object, build the new one, and store
 * its handle. One of a 4-member family (894c/8b10/8bf4). */
#include "ov016_core.h"
extern char data_ov016_021b9558[];
extern char data_ov016_021b9578[];
extern char data_ov016_021b9598[];
extern char data_ov016_021b95b8[];
extern void OS_SPrintf(void *a, void *b, int c);
extern void func_0201ef3c(int a, void *b, void *c);
extern void func_0201e7e0(void);
extern void func_0201ef90(void *a, void *b, void *c, int d, int e, int f, void *g, int h, int i, void *j);
extern int func_0201ede4(void *a, void *b);
void func_ov016_021b8a30(void *arg0, void **arg1) {
    char *p = arg0;
    int tmp;
    OS_SPrintf(arg1[0], data_ov016_021b9558, *(unsigned char *)(p + 460));
    OS_SPrintf(arg1[1], data_ov016_021b9578, *(unsigned char *)(p + 460));
    OS_SPrintf(arg1[2], data_ov016_021b9598, *(unsigned char *)(p + 460));
    OS_SPrintf(arg1[3], data_ov016_021b95b8, *(unsigned char *)(p + 460));
    if (*(int *)(p + 84) != 0) {
        func_0201ef3c(*(int *)p, p + 8, p + 84);
        *(int *)(p + 88) = 0;
        *(int *)(p + 84) = 0;
    }
    func_0201e7e0();
    func_0201ef90(p, p + 4, p + 8, 0, 0, 1, arg1, 1, -1, p + 84);
    *(int *)(data_ov016_021bb1a4 + 12) = func_0201ede4(&tmp, arg1[3]);
}
