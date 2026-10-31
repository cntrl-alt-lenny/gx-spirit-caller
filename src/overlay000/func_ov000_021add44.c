typedef union { unsigned int word; struct { unsigned int lo:17, f_a:4, f_b:4, hi:7; } b; } bitfield_24_t;
typedef struct { char _pad0[0x24]; bitfield_24_t f_24; } obj_t;
typedef struct { unsigned int a,b; unsigned char _pad8[0x14]; struct { unsigned int low8:8; unsigned int:24; }; unsigned char _pad20[4]; struct { unsigned int:17; unsigned int mid4:4; unsigned int:11; }; } state_t;
typedef struct { char _pad[0x1c]; unsigned int f_1c; } state_1c_t;
typedef struct { char pad0c[0xc]; unsigned int f_c; char pad1c[0xc]; struct { unsigned int:16; unsigned int w9:9; unsigned int:7; } f_1c; struct { unsigned int:9; unsigned int w9:9; unsigned int w4:4; unsigned int:10; } f_20; char pad28[4]; unsigned int f_28,f_2c,f_30; } Obj02001ddc;
typedef struct { unsigned int f_0,f_4; } Dims02001e94;
typedef struct { unsigned int pad; unsigned int mode:3; unsigned int:29; } ModeState;
typedef struct { unsigned int:7; unsigned int mode:2; unsigned int:23; } Flags;
extern char data_ov000_021c75c4[];
extern ModeState data_02104f4c;
extern void func_02001cd0(obj_t *p, unsigned int a, unsigned int b);
extern void func_02001d0c(state_t *p, int a, int b);
extern void func_02001d68(int arg);
extern void func_02001d84(void *p, int b, int c);
extern void func_02001dc4(state_1c_t *p, unsigned int v);
extern void func_02001ddc(Obj02001ddc *p, unsigned int a1, unsigned int a2, unsigned int a3, unsigned int a4, unsigned int a5, unsigned int a6);
extern void func_02001e94(Dims02001e94 *p, unsigned short *dst, int val, int shift);
extern void func_02005298(void *a, int b, int c, int d, int e, int f);
extern void func_02005374(void *a, int b, int c, int d, int e, int f);
extern int func_0201d4b4(int sel);
extern int func_0201d530(int sel);
extern int func_ov000_021adbdc(void);
extern int func_ov000_021add24(int a0,int a1,int a2);
void func_ov000_021add44(int arg, int flag) {
    int vram;
    char *m = data_ov000_021c75c4;
    int base, color;
    if (arg) {
        base = *(int *)(m + 0x264);
        if (base == 0) base = 0x4a0;
        *(int *)(m + 0x250) = arg;
        color = flag ? 5 : 0;
        vram = func_0201d530(8);
        switch (((Flags *)(m + 0x26c))->mode) {
        case 0: func_02001d0c((state_t *)(m + 0x1ac),28,6); break;
        case 1: func_02001d0c((state_t *)(m + 0x1ac),32,6); break;
        }
        func_02001d68(data_02104f4c.mode);
        func_02001d84(m + 0x1ac,0,14);
        func_02001dc4((state_1c_t *)(m + 0x1ac),color);
        func_ov000_021adbdc();
        switch (((Flags *)(m + 0x26c))->mode) {
        case 0:
            func_02001cd0((obj_t *)(m + 0x1ac),15,5);
            func_02001ddc((Obj02001ddc *)(m + 0x1ac),arg,base + vram,5,1,12,(unsigned int)func_02005298);
            func_02001e94((Dims02001e94 *)(m + 0x1ac),(unsigned short *)(func_0201d4b4(8) + 0x482),base >> 5,0);
            break;
        case 1:
            func_02001cd0((obj_t *)(m + 0x1ac),15,5);
            func_02001ddc((Obj02001ddc *)(m + 0x1ac),arg,base + vram,func_ov000_021add24(arg,12,256),3,12,(unsigned int)func_02005374);
            func_02001e94((Dims02001e94 *)(m + 0x1ac),(unsigned short *)(func_0201d4b4(8) + 0x580),base >> 5,0);
            break;
        }
        if (flag) *(unsigned int *)(m + 0x270) |= 0x800;
        else *(unsigned int *)(m + 0x270) &= ~0x800;
    } else {
        func_ov000_021adbdc();
    }
}

