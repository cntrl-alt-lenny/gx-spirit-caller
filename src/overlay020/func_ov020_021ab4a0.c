typedef struct {
    unsigned int a, b;
    unsigned char _pad8[0x14];
    struct { unsigned int low8 : 8; unsigned int : 24; };
    unsigned char _pad20[4];
    struct { unsigned int : 17; unsigned int mid4 : 4; unsigned int : 11; };
} state_t;
extern void *Vram_GetBankBaseCD(void);
extern void Fill32(int value, void *dest, int size);
extern void func_02001d0c(state_t *p, int a, int b);
extern void func_02001d68(int arg);
extern void func_02001c98(unsigned int a, unsigned int b);
extern void func_0207f884(int *p);
extern void func_0207f85c(int *p);
extern void func_ov020_021ab708(int a0, int a1, int a2, int a3);
extern int func_ov020_021ab0d8(int page);
extern int func_020a978c(char *dest, const char *fmt, ...);
extern void func_02004fe8(void *a, int b, int c, int d, int e, int f);
extern state_t data_02102c90;
extern char data_ov020_021ae060[];
extern int data_ov020_021ae084[];
extern int data_ov020_021ae070[];
extern const char data_ov020_021ae040[];

void func_ov020_021ab4a0(int idx) {
    char *base = Vram_GetBankBaseCD();
    char text[12];
    *(int *)(data_ov020_021ae060 + 0x8d8) = 18;
    func_02001d0c(&data_02102c90, 27, 18);
    func_02001d68(0);
    func_02001c98(15, 1);
    if (idx < 0) {
        func_0207f884(data_ov020_021ae084);
        func_0207f85c(data_ov020_021ae070);
        func_ov020_021ab708(0, 2, 0, 0);
        func_ov020_021ab0d8(0);
        return;
    }
    if (idx >= 10) idx = 9;
    Fill32(0, text, 12);
    func_020a978c(text, data_ov020_021ae040, idx + 1);
    func_02004fe8(&data_02102c90, (int)text, (int)(base + 0xaa0), (idx * 2 / 10) * 108 + 1, (idx % 5) * 28 + 8, 14);
}
