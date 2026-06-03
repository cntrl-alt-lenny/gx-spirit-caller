/* func_ov016_021b8bf4: rebuild row group 3 (palette unk1CF) — sibling of 8a30. */
#include "ov016_core.h"
extern char data_ov016_021b9658[];
extern char data_ov016_021b9678[];
extern char data_ov016_021b9698[];
extern char data_ov016_021b96b8[];
extern void func_02091554(void *a, void *b, int c);
extern void func_0201ef3c(int a, void *b, void *c);
extern void func_0201e7e0(void);
extern void func_0201ef90(void *a, void *b, void *c, int d, int e, int f, void *g, int h, int i, void *j);
extern int func_0201ede4(void *a, void *b);
void func_ov016_021b8bf4(void *arg0, void **arg1) {
    char *p = arg0;
    int tmp;
    func_02091554(arg1[0], data_ov016_021b9658, *(unsigned char *)(p + 463));
    func_02091554(arg1[1], data_ov016_021b9678, *(unsigned char *)(p + 463));
    func_02091554(arg1[2], data_ov016_021b9698, *(unsigned char *)(p + 463));
    func_02091554(arg1[3], data_ov016_021b96b8, *(unsigned char *)(p + 463));
    if (*(int *)(p + 360) != 0) {
        func_0201ef3c(*(int *)(p + 276), p + 284, p + 360);
        *(int *)(p + 364) = 0;
        *(int *)(p + 360) = 0;
    }
    func_0201e7e0();
    func_0201ef90(p + 276, p + 280, p + 284, 73728, 1536, 1, arg1, 1, -1, p + 360);
    *(int *)(data_ov016_021bb1a4 + 24) = func_0201ede4(&tmp, arg1[3]);
}
