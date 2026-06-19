/* func_ov018_021aaf74: per-frame D-pad handler for the count field at oam+0x4.
 * On the 0x1 key, play the confirm SFX and raise bit 1 of the OAM ctrl word.
 * Otherwise, while the ready-bit (bit 0) is clear: key 0x40 decrements the
 * count (floor 0), key 0x80 increments it (ceil 1); either fires the tick SFX
 * and clears the repeat latch at oam+0x984.
 */

typedef struct {
    unsigned short b0 : 1;
} OamCtl;

extern char data_02104acc[];
extern char data_ov018_021ad7c8[];
extern void func_020371b8(int a, int b, int c, int d);

void func_ov018_021aaf74(void) {
    char *oam = data_ov018_021ad7c8;
    unsigned short in;
    unsigned short in2;
    in = *(unsigned short *)(data_02104acc + 0x54);
    if (in & 1) {
        func_020371b8(0x97, 0x97 - 0x98, 0, 1);
        *(unsigned short *)(oam + 0x9b4) |= 2;
        *(int *)(oam + 0x984) = 0;
        return;
    }
    if (((OamCtl *)(oam + 0x9b4))->b0) {
        return;
    }
    in2 = *(unsigned short *)(data_02104acc + 0x56);
    if ((in2 & 0x40) && *(int *)(oam + 0x4) > 0) {
        func_020371b8(0x38, 0x38 - 0x39, 0, 1);
        *(int *)(oam + 0x4) = *(int *)(oam + 0x4) - 1;
        *(int *)(oam + 0x984) = 0;
        return;
    }
    if (!(in2 & 0x80)) {
        return;
    }
    if (*(int *)(oam + 0x4) >= 1) {
        return;
    }
    func_020371b8(0x38, 0x38 - 0x39, 0, 1);
    *(int *)(oam + 0x4) = *(int *)(oam + 0x4) + 1;
    *(int *)(oam + 0x984) = 0;
}
