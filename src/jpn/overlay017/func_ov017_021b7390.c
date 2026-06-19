/* func_ov017_021b7390: sibling of 021b73a8 for sub-window B — text cells from
 * tbl[0..3] (palette self->1cf, fonts 83f0..8450), fields at +0x114/+0x168,
 * char-base 0x12000, render-prio 0x600, handle at data_877c[4].
 */

extern char data_ov017_021b82f0[];
extern char data_ov017_021b8310[];
extern char data_ov017_021b8330[];
extern char data_ov017_021b8350[];
extern char data_ov017_021b867c[];
extern void func_02091554(int str, void *font, int pal);
extern void func_0201eee8(int a, void *b, void *c);
extern void func_0201e78c(void);
extern void func_0209372c(void);
extern void func_0201ef3c(void *a, void *b, void *c, int d, int e, int f, void *g, int h, int i, void *j);
extern int func_0201ed90(void *out, int x);

void func_ov017_021b7390(char *self, int *tbl) {
    int job;
    func_02091554(tbl[0], data_ov017_021b82f0, *(unsigned char *)(self + 0x1cf));
    func_02091554(tbl[1], data_ov017_021b8310, *(unsigned char *)(self + 0x1cf));
    func_02091554(tbl[2], data_ov017_021b8330, *(unsigned char *)(self + 0x1cf));
    func_02091554(tbl[3], data_ov017_021b8350, *(unsigned char *)(self + 0x1cf));
    if (*(int *)(self + 0x168) != 0) {
        func_0201eee8(*(int *)(self + 0x114), self + 0x11c, self + 0x168);
        *(int *)(self + 0x16c) = 0;
        *(int *)(self + 0x168) = 0;
    }
    func_0201e78c();
    func_0209372c();
    func_0201ef3c(self + 0x114, self + 0x118, self + 0x11c, 0x12000, 0x600, 1, tbl, 1, -1, self + 0x168);
    *(int *)(data_ov017_021b867c + 4) = func_0201ed90(&job, tbl[3]);
}
