

typedef unsigned short u16;
typedef unsigned char  u8;

extern int func_ov002_0226af00(int bit, unsigned int packed, int one);

struct F021f6304_F2 {
    u16 bit0 : 1;
    u16 rest : 15;
};
struct F021f6304_F14 {
    unsigned int lo9 : 9;
    unsigned int b9  : 1;
    unsigned int f10 : 4;
    unsigned int hi  : 18;
};
struct F021f6304 {
    u16 pad0;
    struct F021f6304_F2 f2;
    u16 pad4;
    u16 pad6;
    u16 pad8;
    u16 pada;
    u16 padc;
    u16 pade;
    u16 pad10;
    u16 pad12;
    struct F021f6304_F14 f14;   
};

int func_ov002_021f6214(struct F021f6304 *self) {
    unsigned int packed = (u16)((u8)self->f14.b9 | ((u8)self->f14.f10 << 8));
    func_ov002_0226af00(self->f2.bit0, packed, 1);
    return 1;
}
