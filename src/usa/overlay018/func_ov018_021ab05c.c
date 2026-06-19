/* func_ov018_021ab05c: shoulder-button handler (sibling of 021ab054). The 0x8
 * key plays its SFX and raises bit 1 of the OAM ctrl word; the 0x2 key plays
 * its SFX and raises bit 2. Either clears the repeat latch at oam+0x984.
 */

extern char data_02104acc[];
extern char data_ov018_021ad7c8[];
extern void func_020371b8(int a, int b, int c, int d);

void func_ov018_021ab05c(void) {
    char *oam = data_ov018_021ad7c8;
    unsigned short in;
    in = *(unsigned short *)(data_02104acc + 0x54);
    if (in & 8) {
        func_020371b8(0x3a, 0x3a - 0x3b, 0, 1);
        *(unsigned short *)(oam + 0x9b4) |= 2;
        *(int *)(oam + 0x984) = 0;
        return;
    }
    if (!(in & 2)) {
        return;
    }
    func_020371b8(0x42, 0x42 - 0x43, 0, 1);
    *(unsigned short *)(oam + 0x9b4) |= 4;
    *(int *)(oam + 0x984) = 0;
}
