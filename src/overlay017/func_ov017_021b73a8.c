/* func_ov017_021b73a8: rebuild the four text cells of sub-window A from the
 * tbl[0..3] strings (palette self->1ce), flush any pending transfer, then
 * (re)submit the window's render job via func_0201ef90 and stash its handle.
 */

extern char data_ov017_021b8370[];
extern char data_ov017_021b8390[];
extern char data_ov017_021b83b0[];
extern char data_ov017_021b83d0[];
extern char data_ov017_021b877c[];
extern void func_02091554(int str, void *font, int pal);
extern void func_0201ef3c(int a, void *b, void *c);
extern void func_0201e7e0(void);
extern void func_02093820(void);
extern void func_0201ef90(void *a, void *b, void *c, int d, int e, int f, void *g, int h, int i, void *j);
extern int func_0201ede4(void *out, int x);

void func_ov017_021b73a8(char *self, int *tbl) {
    int job;
    func_02091554(tbl[0], data_ov017_021b8370, *(unsigned char *)(self + 0x1ce));
    func_02091554(tbl[1], data_ov017_021b8390, *(unsigned char *)(self + 0x1ce));
    func_02091554(tbl[2], data_ov017_021b83b0, *(unsigned char *)(self + 0x1ce));
    func_02091554(tbl[3], data_ov017_021b83d0, *(unsigned char *)(self + 0x1ce));
    if (*(int *)(self + 0x10c) != 0) {
        func_0201ef3c(*(int *)(self + 0xb8), self + 0xc0, self + 0x10c);
        *(int *)(self + 0x110) = 0;
        *(int *)(self + 0x10c) = 0;
    }
    func_0201e7e0();
    func_02093820();
    func_0201ef90(self + 0xb8, self + 0xbc, self + 0xc0, 0xa000, 0x400, 1, tbl, 1, -1, self + 0x10c);
    *(int *)data_ov017_021b877c = func_0201ede4(&job, tbl[3]);
}
