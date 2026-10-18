struct F_bits {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F_Self {
    unsigned short f0;
    struct F_bits f2;
};
struct ce288 {
    char pad[0x5a8];
    int state;
};
struct d0e6c {
    char pad[0xb0];
    unsigned short v;
};

extern struct ce288 data_ov002_022ce288;
extern struct d0e6c data_ov002_022d0e6c;
extern int func_ov002_02257b48(struct F_Self *self, int a);
extern void func_ov002_0226b034(int a, int b, int c);
extern void func_ov002_021de910(struct F_Self *self, int a, int b);

int func_ov002_02223714(struct F_Self *self, int unused) {
    unsigned short v;
    switch (data_ov002_022ce288.state) {
    case 0x80:
        if (func_ov002_02257b48(self, unused) != 0)
            return 0x7f;
        return 0;
    case 0x7f:
        func_ov002_0226b034(1 - self->f2.bit0, self->f0, 0);
        return 0x7e;
    case 0x7e: {
        v = data_ov002_022d0e6c.v;
        func_ov002_021de910(self, v & 0xff, (v >> 8) & 0xff);
        return 0;
    }
    }
    return 0;
}
