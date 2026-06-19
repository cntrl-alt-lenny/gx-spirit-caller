/* func_ov018_021aa6b4: load the cell archive for (mode, a0) and configure its
 * BG control — set the priority nibble of f14 from a1, point f0 at the handle,
 * clear the mosaic bit, commit, free. (The ov020 BG-config-builder recipe.)
 */

typedef struct {
    int f0;
    char gap04[0x10];
    unsigned short f14;
    unsigned short gap16;
    int f18;
    char gap1c[0x0c];
} BgCfg;

extern char data_02103fcc[];
extern char data_ov018_021ad658[];
extern int func_02006bf0(int arc, int mode, int z);
extern void func_0201d428(void *cfg);
extern void func_0201e564(void *cfg);
extern void func_02006e00(int h);

void func_ov018_021aa6b4(int a0, int a1) {
    BgCfg cfg;
    int h = func_02006bf0(*(int *)(data_ov018_021ad658 + (*(int *)(data_02103fcc + 0x34) << 5) + a0 * 4), 4, 0);
    func_0201d428(&cfg);
    cfg.f14 = (cfg.f14 & ~0xf) | ((unsigned short)a1 & 0xf);
    cfg.f0 = h;
    cfg.f14 = cfg.f14 & ~0x10;
    func_0201e564(&cfg);
    func_02006e00(h);
}
