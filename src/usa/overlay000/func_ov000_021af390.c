/* func_ov000_021af390: 1 if either the +0x28 (4-bit) or +0x2c (8-bit) state
 * field is set; else 0. (021af378 config-field predicate family.) */
struct Ov000B4 { unsigned f : 4; };
struct Ov000B8 { unsigned f : 8; };
extern char data_ov000_021c74ac[];
extern char data_ov000_021c74b4[];
int func_ov000_021af390(void) {
    char *cfg = data_ov000_021c74b4;
    return ((struct Ov000B4 *)(data_ov000_021c74ac + 40))->f != 0 ||
           ((struct Ov000B8 *)(cfg + 44))->f != 0;
}
