/* func_ov002_021afa10: turn/phase counter mapped into a display range,
 * clamped to a cap value. data_ov002_022cdb98 is the ctrl-state block
 * (see func_ov002_022535a4.c for f_c; f_4 is a phase/turn counter). */
extern struct { char _pad0[4]; int f_4; char _pad1[4]; int f_c; } data_ov002_022cdb98;

int func_ov002_021afa10(void) {
    int r = 1;
    int v = data_ov002_022cdb98.f_4;
    int cap;

    if (v <= 5)
        return 0;
    if (v == 0x26 || (unsigned)(v - 0x47) <= 1)
        return data_ov002_022cdb98.f_c;

    if (v > 6) {
        if (v < 0x26) {
            r = v - 6;
            goto tail;
        }
    }
    if (v > 0x27) {
        if (v < 0x47) {
            r = v - 0x27;
        }
    }
tail:
    cap = data_ov002_022cdb98.f_c;
    if ((unsigned)r >= (unsigned)cap)
        r = cap;
    return r;
}
