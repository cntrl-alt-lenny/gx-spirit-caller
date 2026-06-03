/* func_ov020_021aac78: sibling of 021aab7c — load archive entry +0x10 (sel==3)
 * or +0x8, set BG control (priority 3, clear mosaic, size 0x1a0), commit, free.
 */

extern char data_ov020_021adf68[];
extern int func_02006c0c(int arc, int mode, int z);
extern void func_0201d47c(void *cfg);
extern void func_0201e5b8(void *cfg);
extern void func_02006e1c(int h);

typedef struct {
    int f0;
    char gap04[0x8];
    int fc;
    unsigned short f10;
    unsigned short gap12;
    unsigned short f14;
    unsigned short gap16;
    int f18;
    char gap1c[0x0c];
} BgCfg;

void func_ov020_021aac78(int sel) {
    BgCfg cfg;
    int h;
    if (sel == 3) h = func_02006c0c(*(int *)(data_ov020_021adf68 + 0x10), 4, 0);
    else h = func_02006c0c(*(int *)(data_ov020_021adf68 + 0x8), 4, 0);
    func_0201d47c(&cfg);
    cfg.f14 = (cfg.f14 & ~0xf) | 3;
    cfg.f18 = cfg.f18 & ~0x1c000;
    cfg.f0 = h;
    cfg.f14 = cfg.f14 & ~0x10;
    cfg.fc = 0;
    cfg.f10 = 0x1a0;
    func_0201e5b8(&cfg);
    func_02006e1c(h);
}
