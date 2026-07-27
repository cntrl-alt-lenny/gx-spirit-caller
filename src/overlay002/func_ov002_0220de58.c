/* func_ov002_0220de58: self's +2 halfword carries an asymmetric 6-bit
 * dispatch field (bits 6-11) and a bit0 flag (same shape as
 * func_ov002_0220257c); bail if the 6-bit field is 0x23, else scan a
 * per-player sub-row array (offset 0x94, stride 20) for indices 5-9
 * looking for a nonzero 13-bit id. No calls inside the loop. */
union F2 {
    unsigned short raw;
    struct { unsigned short b0 : 1; } bits;
};
struct Self { unsigned short f0; union F2 f2; };
struct Slot { unsigned int id : 13; };
extern char data_ov002_022cf16c[];

int func_ov002_0220de58(struct Self *self) {
    int field6 = ((unsigned)(self->f2.raw << 20)) >> 26;
    int idx;
    int i;
    struct Slot *slot;
    if (field6 == 0x23)
        goto fail;
    idx = ((1 - self->f2.bits.b0) & 1) * 0x868;
    slot = (struct Slot *)(data_ov002_022cf16c + idx + 0x94);
    for (i = 5; i < 10; i++) {
        if (slot->id == 0)
            return 0;
        slot = (struct Slot *)((char *)slot + 20);
    }
    return 1;
fail:
    return 0;
}
