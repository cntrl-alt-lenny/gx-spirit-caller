/* func_ov020_021aabf0: sibling of 021aab7c — load archive entry +0xc (sel==3)
 * or +0x4, set BG control (priority 0, char-base 0x8000, mosaic), commit, free.
 * The bl is duplicated per branch (branch-tail duplication).
 */

extern char data_ov020_021adf68[];
extern int func_02006c0c(int arc, int mode, int z);
extern void func_0201d47c(void *cfg);
extern void func_0201e5b8(void *cfg);
extern void func_02006e1c(int h);

typedef struct {
    int f0;
    char gap04[0x10];
    unsigned short f14;
    unsigned short gap16;
    int f18;
    char gap1c[0x0c];
} BgCfg;

void func_ov020_021aabf0(int sel) {
    BgCfg cfg;
    int h;
    if (sel == 3) h = func_02006c0c(*(int *)(data_ov020_021adf68 + 0xc), 4, 0);
    else h = func_02006c0c(*(int *)(data_ov020_021adf68 + 0x4), 4, 0);
    func_0201d47c(&cfg);
    cfg.f14 = cfg.f14 & ~0xf;
    cfg.f18 = (cfg.f18 & ~0x1c000) | 0x8000;
    cfg.f0 = h;
    cfg.f14 = cfg.f14 | 0x10;
    func_0201e5b8(&cfg);
    func_02006e1c(h);
}
