/* func_ov000_021af378: 1 iff the +0x2a4 mode field is set AND the +0x26c
 * sub-mode is not 3; else 0. */
struct Ov000F23 { unsigned lo : 23; unsigned f : 8; };
extern char data_ov000_021c758c[];
extern char data_ov000_021c75c4[];
int func_ov000_021af378(void) {
    char *cfg = data_ov000_021c75c4;
    return ((struct Ov000F23 *)(data_ov000_021c758c + 676))->f != 0 &&
           ((struct Ov000F23 *)(cfg + 620))->f != 3;
}
