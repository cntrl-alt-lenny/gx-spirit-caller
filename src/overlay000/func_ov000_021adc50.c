typedef union {
    unsigned int word;
    struct { unsigned int lo:17; unsigned int f_a:4; unsigned int f_b:4; unsigned int hi:7; } b;
} bitfield_24_t;
typedef struct { char _pad0[0x24]; bitfield_24_t f_24; } obj_t;
typedef struct {
    unsigned int a, b;
    unsigned char _pad8[0x14];
    struct { unsigned int low8:8; unsigned int:24; };
    unsigned char _pad20[4];
    struct { unsigned int:17; unsigned int mid4:4; unsigned int:11; };
} state_t;
typedef struct { unsigned int f_0, f_4; } Dims02001e94;
extern void func_02001cd0(obj_t *p, unsigned int a, unsigned int b);
extern void func_02001d0c(state_t *p, int a, int b);
extern void func_02001d68(int arg);
extern void func_02001e94(Dims02001e94 *p, unsigned short *dst, int val, int shift);
extern void func_02005374(void *p, int a, int dst, int b, int c, int d);
extern int func_0201d4b4(int sel);
extern int func_0201d530(int sel);
extern int func_ov000_021adb9c(void);
extern char data_ov000_021c75c4[];
typedef struct { unsigned int pad; unsigned int mode:3; unsigned int:29; } ModeState;
typedef struct { unsigned int:2; unsigned int value:4; unsigned int:26; } Flags;
extern ModeState data_02104f4c;
void func_ov000_021adc50(int arg) {
    char *m = data_ov000_021c75c4;
    int base;
    int vram;
    if (arg) {
        base = *(int *)(m + 0x264);
        *(int *)(m + 0x24c) = arg;
        if (base == 0) base = 0x20;
        vram = func_0201d530(8);
        func_02001d0c((state_t *)(m + 0x178), 12, 3);
        func_02001d68(data_02104f4c.mode);
        func_ov000_021adb9c();
        func_02001cd0((obj_t *)(m + 0x178), ((Flags *)(m + 0x274))->value, 8);
        func_02005374(m + 0x178, arg, base + vram, 2, 4, 12);
        func_02001e94((Dims02001e94 *)(m + 0x178), (unsigned short *)(func_0201d4b4(8) + 0x3c2), base >> 5, 0);
    } else {
        func_ov000_021adb9c();
    }
}

