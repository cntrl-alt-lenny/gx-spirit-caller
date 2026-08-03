/* func_ov002_0222b2b4: switch on data_ov002_022ce1a8.f_5a8 (state 0x78-0x80).
 * Body order follows ADDRESS order per C-44, not ascending case value:
 * case 0x80 first (.L_48), then 0x7f (.L_5c), 0x7e (.L_9c), 0x7d (.L_104),
 * 0x78 (.L_124), then 0x79-0x7c share the default body (.L_148).
 */
typedef struct {
    unsigned short f_0;
    unsigned short f_2;
} Self;

struct CE288 {
    char pad[0x5a8];
    int f_5a8;
    int f_5ac;
};

struct D016C {
    char pad[0xcec];
    int f_cec;
};

extern struct CE288 data_ov002_022ce1a8;
extern struct D016C data_ov002_022d008c;
extern char data_ov002_022d0d8c[];

extern int func_ov002_021bbdcc(int a);
extern int func_ov002_02257790(Self *self, void (*fn)(void));
extern void func_ov002_0226afa4(int a, unsigned short b);
extern void func_ov002_0226af44(int a, unsigned short b, unsigned short c);
extern void func_ov002_021debbc(Self *self, int a, int b);
extern void func_ov002_021f2bb8(void);

int func_ov002_0222b2b4(Self *self) {
    int state = data_ov002_022ce1a8.f_5a8;
    int f5ac = data_ov002_022ce1a8.f_5ac;

    switch (state) {
    case 0x80: {
        data_ov002_022ce1a8.f_5ac = data_ov002_022d008c.f_cec;
        return 0x7f;
    }
    case 0x7f: {
        int r = func_ov002_021bbdcc(f5ac);
        if (r <= 5) return 0x78;
        r = func_ov002_02257790(self, func_ov002_021f2bb8);
        if (r == 0) return 0x78;
        func_ov002_0226afa4(f5ac, self->f_0);
        return 0x7e;
    }
    case 0x7e: {
        int r;
        unsigned short packed;
        r = func_ov002_021bbdcc(f5ac);
        if (r <= 5) return 0x78;
        r = func_ov002_02257790(self, func_ov002_021f2bb8);
        if (r == 0) return 0x78;
        packed = (unsigned char)(((unsigned)(self->f_2 << 0x1f) >> 0x1f)) |
                 ((unsigned char)(((unsigned)(self->f_2 << 0x1a) >> 0x1b)) << 8);
        func_ov002_0226af44(f5ac, self->f_0, packed);
        return 0x7d;
    }
    case 0x7d: {
        unsigned short v = *(unsigned short *)(data_ov002_022d0d8c + 0xb0);
        int b = (v >> 8) & 0xff;
        func_ov002_021debbc(self, f5ac, b);
        return 0x7e;
    }
    case 0x78:
        if (f5ac != data_ov002_022d008c.f_cec) {
            return 0;
        }
        data_ov002_022ce1a8.f_5ac = f5ac ^ 1;
        return 0x7f;
    case 0x79:
    case 0x7a:
    case 0x7b:
    case 0x7c:
    default:
        return 0;
    }
}
