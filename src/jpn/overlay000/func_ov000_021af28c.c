/* func_ov000_021af28c: 1 iff the +0x2a4 mode field is set AND the +0x26c
 * sub-mode is not 3; else 0. */
struct Ov000F23 { unsigned lo : 23; unsigned f : 8; };
extern char data_ov000_021c74ac[];
extern char data_ov000_021c74e4[];
int func_ov000_021af28c(void) {
    char *cfg = data_ov000_021c74e4;
    return ((struct Ov000F23 *)(data_ov000_021c74ac + 676))->f != 0 &&
           ((struct Ov000F23 *)(cfg + 620))->f != 3;
}
