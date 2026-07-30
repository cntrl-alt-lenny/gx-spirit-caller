/* func_ov002_02205794: if f6_11!=0x23, guard via func_ov002_021bb90c(bit0,
 * 0x159d)==0 -> 0. Then if the OPPOSITE-player cf178 table entry is nonzero,
 * return 1; else return func_ov002_021c3bdc(bit0)!=0. */
typedef unsigned short u16;
struct S02205794F2 { u16 bit0 : 1; u16 f1_5 : 5; u16 f6_11 : 6; u16 pad : 4; };
struct S02205794 { char pad0[2]; struct S02205794F2 f2; };

extern char data_ov002_022cf178[];
extern int func_ov002_021bb90c(int bit0, int c);
extern int func_ov002_021c3bdc(unsigned int bit0);

int func_ov002_02205794(struct S02205794 *self) {
    if (self->f2.f6_11 != 0x23) {
        if (func_ov002_021bb90c(self->f2.bit0, 0x159d) == 0)
            return 0;
    }
    if (*(int *)(data_ov002_022cf178 + ((1 - self->f2.bit0) & 1) * 0x868) != 0)
        return 1;
    return func_ov002_021c3bdc(self->f2.bit0) != 0;
}
