/* func_ov002_0220cc98: gate on self's packed "kind" field (bits [11:6] of the
 * u16 at +2) == 0x12, then on data_ov002_022cd3f4.f_4 matching self's bit0
 * flag and f_8==0, then on func_0202ed90(func_ov002_021b9ecc(f_4,f_20))
 * being nonzero; finally checks the per-(f_4&1)-row, f_20-indexed cf1a2/cf1a4
 * sub-slot pair (20-byte stride), matching the established
 * data_ov002_022cf1a2/1a4 accessor idiom (func_ov002_021eaae8 etc). */
typedef struct {
    unsigned short f0;
    unsigned short b0 : 1;
    unsigned short    : 5;
    unsigned short kind : 6;
} SelfCc98;

extern char data_ov002_022cd3f4[];
extern unsigned short data_ov002_022cf1a2[];
extern unsigned short data_ov002_022cf1a4[];
extern int func_ov002_021b9ecc(int player, int kind);
extern int func_0202ed90(int a0);

int func_ov002_0220cc98(SelfCc98 *self) {
    int f4, f20, rowOff;

    if (self->kind != 0x12)
        goto ret0;

    f4 = *(int *)(data_ov002_022cd3f4 + 4);
    f20 = *(int *)(data_ov002_022cd3f4 + 0x20);
    if (f4 != self->b0 || *(int *)(data_ov002_022cd3f4 + 8) != 0)
        goto ret0;

    if (func_0202ed90(func_ov002_021b9ecc(f4, f20)) == 0)
        goto ret0;

    rowOff = (f4 & 1) * 0x868;
    if (*(unsigned short *)((char *)data_ov002_022cf1a2 + rowOff + f20 * 20) != 0)
        goto ret0;
    if (*(unsigned short *)((char *)data_ov002_022cf1a4 + rowOff + f20 * 20) != 0)
        return 1;

ret0:
    return 0;
}
