/* func_ov016_021b89a4: rebuild row group 2 (palette unk1CE) — sibling of 8a30. */
#include "ov016_core.h"
extern char data_ov016_021b9478[];
extern char data_ov016_021b9498[];
extern char data_ov016_021b94b8[];
extern char data_ov016_021b94d8[];
extern void func_02091554(void *a, void *b, int c);
extern void func_0201eee8(int a, void *b, void *c);
extern void func_0201e78c(void);
extern void func_0201ef3c(void *a, void *b, void *c, int d, int e, int f, void *g, int h, int i, void *j);
extern int func_0201ed90(void *a, void *b);
void func_ov016_021b89a4(void *arg0, void **arg1) {
    char *p = arg0;
    int tmp;
    func_02091554(arg1[0], data_ov016_021b9478, *(unsigned char *)(p + 462));
    func_02091554(arg1[1], data_ov016_021b9498, *(unsigned char *)(p + 462));
    func_02091554(arg1[2], data_ov016_021b94b8, *(unsigned char *)(p + 462));
    func_02091554(arg1[3], data_ov016_021b94d8, *(unsigned char *)(p + 462));
    if (*(int *)(p + 268) != 0) {
        func_0201eee8(*(int *)(p + 184), p + 192, p + 268);
        *(int *)(p + 272) = 0;
        *(int *)(p + 268) = 0;
    }
    func_0201e78c();
    func_0201ef3c(p + 184, p + 188, p + 192, 40960, 1024, 1, arg1, 1, -1, p + 268);
    *(int *)(data_ov016_021bb044 + 20) = func_0201ed90(&tmp, arg1[3]);
}
