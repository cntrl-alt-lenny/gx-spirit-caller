/* func_ov020_021aab7c: load the "ncer" archive entry, set its BG control
 * (priority 8, char-base 0xc000, mosaic bit), point f0 at the handle, commit,
 * then free the handle.
 */

extern char data_ov020_021adf68[];
extern int func_02006c0c(int arc, int mode, int z);
extern void func_0201d47c(void *cfg);
extern void func_0201e5b8(void *cfg);
extern void Task_Invoke(int h);

typedef struct {
    int f0;
    char gap04[0x10];
    unsigned short f14;
    unsigned short gap16;
    int f18;
    char gap1c[0x0c];
} BgCfg;

void func_ov020_021aab7c(void) {
    BgCfg cfg;
    int h = func_02006c0c(*(int *)(data_ov020_021adf68 + 0), 4, 0);
    func_0201d47c(&cfg);
    cfg.f14 = (cfg.f14 & ~0xf) | 8;
    cfg.f18 = (cfg.f18 & ~0x1c000) | 0xc000;
    cfg.f0 = h;
    cfg.f14 = cfg.f14 | 0x10;
    func_0201e5b8(&cfg);
    Task_Invoke(h);
}
