/* func_ov012_021ca31c: open or close the panel keyed by the low nibble of
 * data_ov012_021cc5fc[0x160]. The current page (func_02013980) is the third
 * arg; `show` picks the open (func_ov000_021af474) vs close (func_ov000_021af3ec)
 * transition. (ov012_core.h) */
extern int func_02013980(void);
extern void func_ov000_021af474(int, int, int);
extern void func_ov000_021af3ec(int, int, int);
extern char data_ov012_021cc5fc[];
struct ov012_nib {
    unsigned f : 4;
};
void func_ov012_021ca31c(int show) {
    char *base = data_ov012_021cc5fc;
    if (show != 0) {
        int page = func_02013980();
        func_ov000_021af474(((struct ov012_nib *)(base + 0x160))->f, 0x10, page);
    } else {
        int page = func_02013980();
        func_ov000_021af3ec(((struct ov012_nib *)(base + 0x160))->f, 0x10, page);
    }
}
