/* func_ov002_021ff990: derive bit0/field[5:1] from self+0x2's u16 to
 * resolve an id via func_ov002_021b3538(bit0, field); split the id into
 * (lo,hi) bytes; player = bit0 ^ bit14 (a THIRD bit of the same u16) is
 * used for the rest of the gate chain (021bc8c8, 021bc68c/021bc288
 * alternation, 021ca2b8), finishing on a per-player count-table nonzero
 * test.
 */
extern int func_ov002_021b3538(int bit0, int field);
extern int func_ov002_021bc7e8(int player, int lo, int hi);
extern int func_ov002_021bc5ac(int player);
extern int func_ov002_021bc1a8(int lo, int hi);
extern int func_ov002_021ca1d8(int player);
extern char data_ov002_022cf09c[];

struct SelfFlags {
    unsigned short bit0 : 1;
    unsigned short field : 5;
    unsigned short : 8;
    unsigned short bit14 : 1;
    unsigned short : 1;
};

int func_ov002_021ff990(void *self) {
    struct SelfFlags *flags = (struct SelfFlags *)((char *)self + 2);
    int player = flags->bit0 ^ flags->bit14;
    int id = func_ov002_021b3538(flags->bit0, flags->field);
    int lo, hi;

    if (id == 0xffff)
        return 0;
    lo = id & 0xff;
    hi = (id >> 8) & 0xff;

    if (func_ov002_021bc7e8(player, lo, hi) == 0)
        return 0;

    if (func_ov002_021bc5ac(player) != 0)
        goto cont;
    if (lo != player)
        goto fail;
    if (func_ov002_021bc1a8(lo, hi) != 0)
        goto cont;
fail:
    return 0;
cont:
    if (func_ov002_021ca1d8(player) == 0)
        return 0;

    return *(int *)(data_ov002_022cf09c + (player & 1) * 0x868) != 0;
}
