/* func_ov013_021ca68c: switch the active page to `page` (stored in bits [20:18]
 * of data_ov013_021cbc00[0x1a4]). Plays the forward or reverse slide depending on
 * `reverse` (func_ov000_021ab4bc / func_ov000_021ab4ec), commits the layout
 * (func_ov000_021ab8f8), then re-skins the tab for the now-current page —
 * func_ov013_021ca618 of the saved page nibble — and re-arms the slide.
 * (ov013_core.h) */
extern void func_ov000_021ab4bc(int, int);
extern void func_ov000_021ab4ec(int, int);
extern void func_ov000_021ab8f8(void);
extern int func_020139b4(void);
extern void func_ov000_021af560(int, int, int);
extern int func_ov013_021ca618(int);
extern char data_ov013_021cbc00[];
extern char data_ov013_021cbc3c[];
void func_ov013_021ca68c(int page, int reverse) {
    char *d = data_ov013_021cbc3c;
    *(int *)(data_ov013_021cbc00 + 0x1a4) =
        (*(int *)(data_ov013_021cbc00 + 0x1a4) & ~0x1c0000) |
        (((unsigned)page << 0x1d) >> 0xb);
    if (reverse != 0)
        func_ov000_021ab4bc(1, 1);
    else
        func_ov000_021ab4ec(1, 1);
    func_ov000_021ab8f8();
    {
        int cell =
            func_ov013_021ca618(((unsigned)*(int *)(d + 0x168) << 0xb) >> 0x1d);
        int p = func_020139b4();
        func_ov000_021af560(0, cell, p);
    }
    func_ov000_021ab4bc(1, 2);
}
