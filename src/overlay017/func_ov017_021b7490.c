/* func_ov017_021b7490: sibling of 021b73a8 for sub-window B — text cells from
 * tbl[0..3] (palette self->1cf, fonts 83f0..8450), fields at +0x114/+0x168,
 * char-base 0x12000, render-prio 0x600, handle at data_877c[4].
 */

extern char data_ov017_021b83f0[];
extern char data_ov017_021b8410[];
extern char data_ov017_021b8430[];
extern char data_ov017_021b8450[];
extern char data_ov017_021b877c[];
extern void OS_SPrintf(int str, void *font, int pal);
extern void func_0201ef3c(int a, void *b, void *c);
extern void func_0201e7e0(void);
extern void func_02093820(void);
extern void func_0201ef90(void *a, void *b, void *c, int d, int e, int f, void *g, int h, int i, void *j);
extern int func_0201ede4(void *out, int x);

void func_ov017_021b7490(char *self, int *tbl) {
    int job;
    OS_SPrintf(tbl[0], data_ov017_021b83f0, *(unsigned char *)(self + 0x1cf));
    OS_SPrintf(tbl[1], data_ov017_021b8410, *(unsigned char *)(self + 0x1cf));
    OS_SPrintf(tbl[2], data_ov017_021b8430, *(unsigned char *)(self + 0x1cf));
    OS_SPrintf(tbl[3], data_ov017_021b8450, *(unsigned char *)(self + 0x1cf));
    if (*(int *)(self + 0x168) != 0) {
        func_0201ef3c(*(int *)(self + 0x114), self + 0x11c, self + 0x168);
        *(int *)(self + 0x16c) = 0;
        *(int *)(self + 0x168) = 0;
    }
    func_0201e7e0();
    func_02093820();
    func_0201ef90(self + 0x114, self + 0x118, self + 0x11c, 0x12000, 0x600, 1, tbl, 1, -1, self + 0x168);
    *(int *)(data_ov017_021b877c + 4) = func_0201ede4(&job, tbl[3]);
}
