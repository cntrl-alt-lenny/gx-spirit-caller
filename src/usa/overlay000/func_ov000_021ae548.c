/* func_ov000_021ae548: post status message 56 regardless of the +0x2a4 facing
 * sub-field (both branches notify identically). */
extern int func_020371b8(int, int, int, int);
extern char data_ov000_021c74ac[];
struct Ov000Mode { char pad[676]; unsigned facing : 4; };
void func_ov000_021ae548(void) {
    switch (((struct Ov000Mode *)data_ov000_021c74ac)->facing) {
    case 1:
        func_020371b8(56, -1, 0, 1);
        break;
    default:
        func_020371b8(56, -1, 0, 1);
        break;
    }
}
