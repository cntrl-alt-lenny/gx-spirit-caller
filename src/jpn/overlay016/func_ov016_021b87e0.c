/* func_ov016_021b87e0: rebuild row group 1 (palette unk1CD) — sibling of 8a30. */
#include "ov016_core.h"
extern char data_ov016_021b9378[];
extern char data_ov016_021b9398[];
extern char data_ov016_021b93b8[];
extern char data_ov016_021b93d8[];
extern void func_02091554(void *a, void *b, int c);
extern void func_0201eee8(int a, void *b, void *c);
extern void func_0201e78c(void);
extern void func_0201ef3c(void *a, void *b, void *c, int d, int e, int f, void *g, int h, int i, void *j);
extern int func_0201ed90(void *a, void *b);
void func_ov016_021b87e0(void *arg0, void **arg1) {
    char *p = arg0;
    int tmp;
    func_02091554(arg1[0], data_ov016_021b9378, *(unsigned char *)(p + 461));
    func_02091554(arg1[1], data_ov016_021b9398, *(unsigned char *)(p + 461));
    func_02091554(arg1[2], data_ov016_021b93b8, *(unsigned char *)(p + 461));
    func_02091554(arg1[3], data_ov016_021b93d8, *(unsigned char *)(p + 461));
    if (*(int *)(p + 176) != 0) {
        func_0201eee8(*(int *)(p + 92), p + 100, p + 176);
        *(int *)(p + 180) = 0;
        *(int *)(p + 176) = 0;
    }
    func_0201e78c();
    func_0201ef3c(p + 92, p + 96, p + 100, 24576, 512, 1, arg1, 1, -1, p + 176);
    *(int *)(data_ov016_021bb044 + 16) = func_0201ed90(&tmp, arg1[3]);
}
