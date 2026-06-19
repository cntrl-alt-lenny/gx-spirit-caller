/* func_ov020_021aaa9c: load the "ncer" archive entry, set its BG control
 * (priority 8, char-base 0xc000, mosaic bit), point f0 at the handle, commit,
 * then free the handle.
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

void func_ov020_021aaa9c(void) {
    BgCfg cfg;
    int h = func_02006bf0(*(int *)(data_ov020_021ade88 + 0), 4, 0);
    func_0201d428(&cfg);
    cfg.f14 = (cfg.f14 & ~0xf) | 8;
    cfg.f18 = (cfg.f18 & ~0x1c000) | 0xc000;
    cfg.f0 = h;
    cfg.f14 = cfg.f14 | 0x10;
    func_0201e564(&cfg);
    func_02006e00(h);
}
