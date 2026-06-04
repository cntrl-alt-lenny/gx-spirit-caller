/* func_ov017_021b3fa4: render an OBJ at box (x,y<<12) on the cell handle at
 * table[idx]+0x18 — set its palette (unless pal==-1), submit the cell-config
 * via func_0201e964, and (when pal==-1, the "one-shot" case) tear the handle
 * down afterwards.
 */

typedef struct {
    unsigned short f0, f2, f4, f6, f8, fa;
} Box;

extern int func_0201e800(int h, int pal);
extern void func_0201e964(int mode, int h2c, void *cfg, int z3,
                          int s0, int s1, int s2, int s3,
                          int s4, int s5, int s6, int s7);
extern void func_0201e7ec(int h, int x);
extern void func_0207fd28(int h, int flags);

void func_ov017_021b3fa4(int table, int idx, int pal, Box *box) {
    int cfg[2];
    int h = *(int *)(table + idx * 4 + 0x18);
    cfg[0] = box->f0 << 12;
    cfg[1] = box->f2 << 12;
    if (pal != -1) func_0201e800(h, (unsigned short)pal);
    func_0201e964(2, *(int *)(h + 0x2c), cfg, 0, 0, 0, box->f8, box->f6, 0, 0, 0, 0);
    if (pal != -1) return;
    func_0201e7ec(h, 1);
    func_0207fd28(h, 0x1000);
}
