/* func_ov002_022084b0 (ov002): bitfield-guard chain then a tail call.
 * Re-verified against the raw disassembly (not the prep draft): the final
 * guard is (idx9 & 1) != 1-flag0, NOT a separate "f23" bit -- it reuses
 * idx9 (the same field used for the table lookup), just unscaled and
 * masked to its own bit 0 (a 3-instruction lsl23/lsr23/and1 sequence,
 * distinct from the 2-instruction lsl23/lsr21 fused *4 scale used for the
 * table index). C-60 table family for the data_ov002_022d0170 lookup.
 */

struct Obj {
    unsigned short u0;                                       /* +0x0 */
    unsigned short flag0 : 1, _r1 : 5, type6 : 6, _r2 : 4;    /* +0x2 */
    unsigned short u4;                                        /* +0x4 */
    char pad6[0x14 - 0x6];
    unsigned int idx9 : 9, f9 : 1, _r3 : 9, f19 : 4, _r4 : 9; /* +0x14 */
};

struct TableVal { unsigned short low13 : 13; unsigned short _hi : 3; };

extern unsigned short data_ov002_022d0170[];
extern int func_0202e1e0(int);
extern int func_ov002_021ff2cc(struct Obj *, void *);

int func_ov002_022084b0(struct Obj *card, void *arg1) {
    if (card->type6 != 0x16) {
        goto ret0;
    }
    if ((int)card->f9 != 1 - (int)card->flag0) {
        return 0;
    }
    if (card->f19 != 0xe) {
        return 0;
    }
    if (!func_0202e1e0(((struct TableVal *)&data_ov002_022d0170[card->idx9 * 2])->low13)) {
        return 0;
    }
    if ((int)(card->idx9 & 1) != 1 - (int)card->flag0) {
        return 0;
    }
    return func_ov002_021ff2cc(card, arg1);

ret0:
    return 0;
}
