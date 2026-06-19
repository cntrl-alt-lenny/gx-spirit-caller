/* func_ov020_021aab10: sibling of 021aab7c — load archive entry +0xc (sel==3)
 * or +0x4, set BG control (priority 0, char-base 0x8000, mosaic), commit, free.
 * The bl is duplicated per branch (branch-tail duplication).
 */

extern char data_ov020_021ade88[];
extern int func_02006bf0(int arc, int mode, int z);
extern void func_0201d428(void *cfg);
extern void func_0201e564(void *cfg);
extern void func_02006e00(int h);

typedef struct {
    int f0;
    char gap04[0x10];
    unsigned short f14;
    unsigned short gap16;
    int f18;
    char gap1c[0x0c];
} BgCfg;

void func_ov020_021aab10(int sel) {
    BgCfg cfg;
    int h;
    if (sel == 3) h = func_02006bf0(*(int *)(data_ov020_021ade88 + 0xc), 4, 0);
    else h = func_02006bf0(*(int *)(data_ov020_021ade88 + 0x4), 4, 0);
    func_0201d428(&cfg);
    cfg.f14 = cfg.f14 & ~0xf;
    cfg.f18 = (cfg.f18 & ~0x1c000) | 0x8000;
    cfg.f0 = h;
    cfg.f14 = cfg.f14 | 0x10;
    func_0201e564(&cfg);
    func_02006e00(h);
}
