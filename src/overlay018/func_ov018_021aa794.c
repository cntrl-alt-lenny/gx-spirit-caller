/* func_ov018_021aa794: load the cell archive for (mode, a0) and configure its
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

extern char data_021040ac[];
extern char data_ov018_021ad738[];
extern int func_02006c0c(int arc, int mode, int z);
extern void func_0201d47c(void *cfg);
extern void func_0201e5b8(void *cfg);
extern void func_02006e1c(int h);

void func_ov018_021aa794(int a0, int a1) {
    BgCfg cfg;
    int h = func_02006c0c(*(int *)(data_ov018_021ad738 + (*(int *)(data_021040ac + 0x34) << 5) + a0 * 4), 4, 0);
    func_0201d47c(&cfg);
    cfg.f14 = (cfg.f14 & ~0xf) | ((unsigned short)a1 & 0xf);
    cfg.f0 = h;
    cfg.f14 = cfg.f14 & ~0x10;
    func_0201e5b8(&cfg);
    func_02006e1c(h);
}
