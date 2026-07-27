/* func_ov002_02203840: self+2 packs a 1-bit b0, 5-bit idx (bits 1..5), and
 * 6-bit kind (bits 6..11). Requires kind==0x14 and data_ov002_022cd314[0]
 * != data_ov002_022cd314[1]; then reports whether the per-(b0,idx) u16 in
 * data_ov002_022cf0c2 is nonzero. */
struct S02203930 {
    unsigned short b0 : 1;
    unsigned short idx : 5;
    unsigned short kind : 6;
};

extern int data_ov002_022cd314[];
extern unsigned short data_ov002_022cf0c2[];

int func_ov002_02203840(void *self) {
    struct S02203930 *s = (struct S02203930 *)((char *)self + 2);
    unsigned short val;

    if (s->kind != 0x14)
        goto return_zero;
    if (data_ov002_022cd314[0] == data_ov002_022cd314[1])
        goto return_zero;

    val = *(unsigned short *)((char *)data_ov002_022cf0c2 + (s->b0 & 1) * 0x868 + s->idx * 20);
    if (val != 0)
        return 1;

return_zero:
    return 0;
}
