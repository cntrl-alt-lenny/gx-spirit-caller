/* func_ov020_021aa9e8: sibling of 021aab7c — load archive entry +0x14, set BG
 * control (priority 2, clear mosaic, fc=0x20, size 0x180), commit, free, then
 * blit a 0x20-byte palette via func_020944a4.
 */

extern char data_ov020_021adf68[];
extern char data_ov020_021ae948[];
extern int func_02006c0c(int arc, int mode, int z);
extern void func_0201d47c(void *cfg);
extern void func_0201e5b8(void *cfg);
extern void Task_Invoke(int h);
extern void func_020944a4(void *dst, void *src, int size);

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

void func_ov020_021aa9e8(void) {
    BgCfg cfg;
    int h = func_02006c0c(*(int *)(data_ov020_021adf68 + 0x14), 4, 0);
    func_0201d47c(&cfg);
    cfg.f14 = (cfg.f14 & ~0xf) | 2;
    cfg.f18 = cfg.f18 & ~0x1c000;
    cfg.f0 = h;
    cfg.fc = 0x20;
    cfg.f10 = 0x180;
    cfg.f14 = cfg.f14 & ~0x10;
    func_0201e5b8(&cfg);
    Task_Invoke(h);
    func_020944a4((void *)0x5000180, data_ov020_021ae948, 0x20);
}
