/* func_ov013_021ca5ac: switch the active page to `page` (stored in bits [20:18]
 * of data_ov013_021cbb20[0x1a4]). Plays the forward or reverse slide depending on
 * `reverse` (func_ov000_021ab3dc / func_ov000_021ab40c), commits the layout
 * (func_ov000_021ab818), then re-skins the tab for the now-current page —
 * func_ov013_021ca538 of the saved page nibble — and re-arms the slide.
 * (ov013_core.h) */
extern void func_ov000_021ab3dc(int, int);
extern void func_ov000_021ab40c(int, int);
extern void func_ov000_021ab818(void);
extern int func_02013980(void);
extern void func_ov000_021af474(int, int, int);
extern int func_ov013_021ca538(int);
extern char data_ov013_021cbb20[];
extern char data_ov013_021cbb5c[];
void func_ov013_021ca5ac(int page, int reverse) {
    char *d = data_ov013_021cbb5c;
    *(int *)(data_ov013_021cbb20 + 0x1a4) =
        (*(int *)(data_ov013_021cbb20 + 0x1a4) & ~0x1c0000) |
        (((unsigned)page << 0x1d) >> 0xb);
    if (reverse != 0)
        func_ov000_021ab3dc(1, 1);
    else
        func_ov000_021ab40c(1, 1);
    func_ov000_021ab818();
    {
        int cell =
            func_ov013_021ca538(((unsigned)*(int *)(d + 0x168) << 0xb) >> 0x1d);
        int p = func_02013980();
        func_ov000_021af474(0, cell, p);
    }
    func_ov000_021ab3dc(1, 2);
}
