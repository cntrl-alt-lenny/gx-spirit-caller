/* func_ov016_021b88c4: rebuild row group 0 — register its four cell configs
 * (palette unk1CC), release the old built object, build the new one, and store
 * its handle. One of a 4-member family (894c/8b10/8bf4). */
#include "ov016_core.h"
extern char data_ov016_021b93f8[];
extern char data_ov016_021b9418[];
extern char data_ov016_021b9438[];
extern char data_ov016_021b9458[];
extern void OS_SPrintf(void *a, void *b, int c);
extern void func_0201eee8(int a, void *b, void *c);
extern void func_0201e78c(void);
extern void func_0201ef3c(void *a, void *b, void *c, int d, int e, int f, void *g, int h, int i, void *j);
extern int func_0201ed90(void *a, void *b);
void func_ov016_021b88c4(void *arg0, void **arg1) {
    char *p = arg0;
    int tmp;
    OS_SPrintf(arg1[0], data_ov016_021b93f8, *(unsigned char *)(p + 460));
    OS_SPrintf(arg1[1], data_ov016_021b9418, *(unsigned char *)(p + 460));
    OS_SPrintf(arg1[2], data_ov016_021b9438, *(unsigned char *)(p + 460));
    OS_SPrintf(arg1[3], data_ov016_021b9458, *(unsigned char *)(p + 460));
    if (*(int *)(p + 84) != 0) {
        func_0201eee8(*(int *)p, p + 8, p + 84);
        *(int *)(p + 88) = 0;
        *(int *)(p + 84) = 0;
    }
    func_0201e78c();
    func_0201ef3c(p, p + 4, p + 8, 0, 0, 1, arg1, 1, -1, p + 84);
    *(int *)(data_ov016_021bb044 + 12) = func_0201ed90(&tmp, arg1[3]);
}
