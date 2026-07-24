/* func_ov002_0220cff8: bit0 = self->f2 bit0. if (bit0 == D016C.f_cec)
 * return 0; return D016C.f_cf8 == 3. */
typedef unsigned short u16;

struct S0220cff8 {
    u16 f0;
    struct { u16 bit0 : 1; u16 _rest : 15; } f2;
};

struct g016c { char _pad[0xcec]; int f_cec; char _pad2[0xcf8 - 0xcec - 4]; int f_cf8; };
extern struct g016c data_ov002_022d016c;

int func_ov002_0220cff8(struct S0220cff8 *self) {
    if (self->f2.bit0 == data_ov002_022d016c.f_cec)
        return 0;
    return data_ov002_022d016c.f_cf8 == 3;
}
