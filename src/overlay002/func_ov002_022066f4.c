/* func_ov002_022066f4: C-39 — guard a global word == bit0, then return
 * helper(bit0, f0, 0) >= 2. */
typedef unsigned short u16;
struct S022066f4 { u16 f0; u16 bit0:1; u16 rest:15; };
extern char data_ov002_022d016c[];
extern int func_ov002_022536e8(int bit0, u16 f0, int k);
int func_ov002_022066f4(struct S022066f4 *self) {
    if (*(int *)(data_ov002_022d016c + 0xcec) != self->bit0) return 0;
    return func_ov002_022536e8(self->bit0, self->f0, 0) >= 2;
}
