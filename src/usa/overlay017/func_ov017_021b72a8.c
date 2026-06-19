/* func_ov017_021b72a8: rebuild the four text cells of sub-window A from the
 * tbl[0..3] strings (palette self->1ce), flush any pending transfer, then
 * (re)submit the window's render job via func_0201ef3c and stash its handle.
 */

extern char data_ov017_021b8270[];
extern char data_ov017_021b8290[];
extern char data_ov017_021b82b0[];
extern char data_ov017_021b82d0[];
extern char data_ov017_021b867c[];
extern void func_02091554(int str, void *font, int pal);
extern void func_0201eee8(int a, void *b, void *c);
extern void func_0201e78c(void);
extern void func_0209372c(void);
extern void func_0201ef3c(void *a, void *b, void *c, int d, int e, int f, void *g, int h, int i, void *j);
extern int func_0201ed90(void *out, int x);

void func_ov017_021b72a8(char *self, int *tbl) {
    int job;
    func_02091554(tbl[0], data_ov017_021b8270, *(unsigned char *)(self + 0x1ce));
    func_02091554(tbl[1], data_ov017_021b8290, *(unsigned char *)(self + 0x1ce));
    func_02091554(tbl[2], data_ov017_021b82b0, *(unsigned char *)(self + 0x1ce));
    func_02091554(tbl[3], data_ov017_021b82d0, *(unsigned char *)(self + 0x1ce));
    if (*(int *)(self + 0x10c) != 0) {
        func_0201eee8(*(int *)(self + 0xb8), self + 0xc0, self + 0x10c);
        *(int *)(self + 0x110) = 0;
        *(int *)(self + 0x10c) = 0;
    }
    func_0201e78c();
    func_0209372c();
    func_0201ef3c(self + 0xb8, self + 0xbc, self + 0xc0, 0xa000, 0x400, 1, tbl, 1, -1, self + 0x10c);
    *(int *)data_ov017_021b867c = func_0201ed90(&job, tbl[3]);
}
