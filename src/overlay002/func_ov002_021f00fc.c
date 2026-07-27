/* func_ov002_021f00fc: bail if arg1 == self->b0; if arg2<5, gate on the
 * accessor-guard sink; else fall through to report whether the per-player
 * sub-row slot's 13-bit id is nonzero. */
extern int func_ov002_021b8fcc(int player, int idx);
struct Ov002Self { unsigned short f0; unsigned short b0 : 1; };
struct Slot { unsigned int id : 13; };
extern char data_ov002_022cf16c[];

int func_ov002_021f00fc(struct Ov002Self *arg0, int arg1, int arg2) {
    struct Slot *slot;
    if (arg1 == arg0->b0)
        return 0;
    if (arg2 < 5) {
        if (func_ov002_021b8fcc(arg1, arg2) == 0)
            return 0;
    }
    slot = (struct Slot *)(data_ov002_022cf16c + (arg1 & 1) * 0x868 + arg2 * 20 + 0x30);
    if (slot->id == 0)
        return 0;
    else
        return 1;
}
