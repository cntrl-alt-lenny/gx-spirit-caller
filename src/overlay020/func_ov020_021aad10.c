typedef struct {
    unsigned int a;
    unsigned int b;
    unsigned char _pad8[0x14];
    struct { unsigned int low8 : 8; unsigned int : 24; };
    struct { unsigned int : 23; unsigned int flag : 1; unsigned int : 8; };
    struct { unsigned int : 17; unsigned int mid4 : 4; unsigned int : 11; };
} state_t;
extern char data_ov020_021ae0a8[];
extern char data_ov020_021ae060[];
extern state_t data_02102c90;
extern struct { unsigned int a; unsigned int mode : 3; unsigned int : 29; } data_02104f4c;
/* Fill32's assembly implementation consumes value, destination and size. */
extern void Fill32(int value, void *dest, int size);
extern void *Vram_GetBankBaseCD(void);
extern signed char *func_0202c0c0(int id);
extern int func_020a978c(char *dst, const signed char *fmt, ...);
extern char *func_020a6afc(char *dst, volatile signed char *src);
extern void func_02001d0c(state_t *p, int a, int b);
extern void func_02001d68(int arg);
extern int func_020054a4(char *text, int a);
extern void func_02001c98(unsigned int a, unsigned int b);
extern void func_02005088(int a0, int a1, int a2, int a3, int a4, int a5);

void func_ov020_021aad10(void) {
    char buf[0x40];
    char *state = data_ov020_021ae0a8;
    char *vram = Vram_GetBankBaseCD();
    int width;
    Fill32(0, buf, 0x40);
    if (*(int *)(data_ov020_021ae060 + 0x910) <= 10) {
        func_020a978c(buf, func_0202c0c0(0x6eb), *(int *)(state + 0x8c8));
    } else {
        func_020a6afc(buf, func_0202c0c0(0x6ec));
    }
    func_02001d0c(&data_02102c90, 0x1c, 3);
    func_02001d68(data_02104f4c.mode);
    data_02102c90.flag = 0;
    width = func_020054a4(buf, 0xe);
    func_02001c98(0xf, 1);
    func_02005088((int)&data_02102c90, (int)buf, (int)(vram + 0x20), (0xe0 - width) >> 1, 4, 0xe);
}

