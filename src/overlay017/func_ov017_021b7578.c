/* func_ov017_021b7578: sibling of 021b73a8/7490 for sub-window C — skip if the
 * row count (self->+0x1d0) is 0; otherwise lay out the four cells with glyph
 * base count+0x4b (fonts 8470..84b8), fields at +0x170/+0x1c4, char-base
 * 0x16000, render-prio 0x800, handle at data_877c[8].
 */

extern char data_ov017_021b8470[];
extern char data_ov017_021b8488[];
extern char data_ov017_021b84a0[];
extern char data_ov017_021b84b8[];
extern char data_ov017_021b877c[];
extern void OS_SPrintf(int str, void *font, int pal);
extern void func_0201ef3c(int a, void *b, void *c);
extern void func_0201e7e0(void);
extern void func_02093820(void);
extern void func_0201ef90(void *a, void *b, void *c, int d, int e, int f, void *g, int h, int i, void *j);
extern int func_0201ede4(void *out, int x);

typedef struct {
    char pad[0xd0];
    unsigned short fd0;
} SubState;

void func_ov017_021b7578(char *self, int *tbl) {
    int job;
    if (((SubState *)(self + 0x100))->fd0 == 0) return;
    OS_SPrintf(tbl[0], data_ov017_021b8470, ((SubState *)(self + 0x100))->fd0 + 0x4b);
    OS_SPrintf(tbl[1], data_ov017_021b8488, ((SubState *)(self + 0x100))->fd0 + 0x4b);
    OS_SPrintf(tbl[2], data_ov017_021b84a0, ((SubState *)(self + 0x100))->fd0 + 0x4b);
    OS_SPrintf(tbl[3], data_ov017_021b84b8, ((SubState *)(self + 0x100))->fd0 + 0x4b);
    if (*(int *)(self + 0x1c4) != 0) {
        func_0201ef3c(*(int *)(self + 0x170), self + 0x178, self + 0x1c4);
        *(int *)(self + 0x1c8) = 0;
        *(int *)(self + 0x1c4) = 0;
    }
    func_0201e7e0();
    func_02093820();
    func_0201ef90(self + 0x170, self + 0x174, self + 0x178, 0x16000, 0x800, 1, tbl, 1, -1, self + 0x1c4);
    *(int *)(data_ov017_021b877c + 8) = func_0201ede4(&job, tbl[3]);
}
