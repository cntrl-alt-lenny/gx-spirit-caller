/* func_ov000_021ae654: post status message 56 regardless of the +0x2a4 facing
 * sub-field (both branches notify identically). */
extern int func_02037208(int, int, int, int);
extern char data_ov000_021c758c[];
struct Ov000Mode { char pad[676]; unsigned facing : 4; };
void func_ov000_021ae654(void) {
    switch (((struct Ov000Mode *)data_ov000_021c758c)->facing) {
    case 1:
        func_02037208(56, -1, 0, 1);
        break;
    default:
        func_02037208(56, -1, 0, 1);
        break;
    }
}
