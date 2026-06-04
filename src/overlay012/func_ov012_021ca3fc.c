/* func_ov012_021ca3fc: open or close the panel keyed by the low nibble of
 * data_ov012_021cc6dc[0x160]. The current page (func_020139b4) is the third
 * arg; `show` picks the open (func_ov000_021af560) vs close (func_ov000_021af4d8)
 * transition. (ov012_core.h) */
extern int func_020139b4(void);
extern void func_ov000_021af560(int, int, int);
extern void func_ov000_021af4d8(int, int, int);
extern char data_ov012_021cc6dc[];
struct ov012_nib {
    unsigned f : 4;
};
void func_ov012_021ca3fc(int show) {
    char *base = data_ov012_021cc6dc;
    if (show != 0) {
        int page = func_020139b4();
        func_ov000_021af560(((struct ov012_nib *)(base + 0x160))->f, 0x10, page);
    } else {
        int page = func_020139b4();
        func_ov000_021af4d8(((struct ov012_nib *)(base + 0x160))->f, 0x10, page);
    }
}
