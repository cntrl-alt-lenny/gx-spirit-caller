/* func_ov002_021d5ec4: byte-pack arg0/arg1 into a u16 ((u8)arg0 |
 * (u8)arg1<<8), then call func_ov002_021d59c4(i, j, packed, 1) for i in
 * [0,2) and j in [0,5) -- the (u8)-cast byte-pack lever (ov002_core.h
 * wave 5). Sibling of the 021d5xxx arg-pack cluster.
 */

extern void func_ov002_021d59c4(int i, int j, int packed, int one);

void func_ov002_021d5ec4(int arg0, int arg1) {
    unsigned char lo;
    unsigned char hi;
    unsigned short packed16;
    int i;
    int j;

    lo = (unsigned char)arg0;
    hi = (unsigned char)arg1;
    packed16 = (unsigned short)(lo | (hi << 8));
    for (i = 0; i < 2; i++) {
        for (j = 0; j < 5; j++) {
            func_ov002_021d59c4(i, j, packed16, 1);
        }
    }
}
