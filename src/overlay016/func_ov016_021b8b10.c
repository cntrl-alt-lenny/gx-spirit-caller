/* func_ov016_021b8b10: rebuild row group 2 (palette unk1CE) — sibling of 8a30. */
#include "ov016_core.h"
extern char data_ov016_021b95d8[];
extern char data_ov016_021b95f8[];
extern char data_ov016_021b9618[];
extern char data_ov016_021b9638[];
extern void func_02091554(void *a, void *b, int c);
extern void func_0201ef3c(int a, void *b, void *c);
extern void func_0201e7e0(void);
extern void func_0201ef90(void *a, void *b, void *c, int d, int e, int f, void *g, int h, int i, void *j);
extern int func_0201ede4(void *a, void *b);
void func_ov016_021b8b10(void *arg0, void **arg1) {
    char *p = arg0;
    int tmp;
    func_02091554(arg1[0], data_ov016_021b95d8, *(unsigned char *)(p + 462));
    func_02091554(arg1[1], data_ov016_021b95f8, *(unsigned char *)(p + 462));
    func_02091554(arg1[2], data_ov016_021b9618, *(unsigned char *)(p + 462));
    func_02091554(arg1[3], data_ov016_021b9638, *(unsigned char *)(p + 462));
    if (*(int *)(p + 268) != 0) {
        func_0201ef3c(*(int *)(p + 184), p + 192, p + 268);
        *(int *)(p + 272) = 0;
        *(int *)(p + 268) = 0;
    }
    func_0201e7e0();
    func_0201ef90(p + 184, p + 188, p + 192, 40960, 1024, 1, arg1, 1, -1, p + 268);
    *(int *)(data_ov016_021bb1a4 + 20) = func_0201ede4(&tmp, arg1[3]);
}
