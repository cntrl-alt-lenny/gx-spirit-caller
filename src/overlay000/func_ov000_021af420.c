/* func_ov000_021af420: enter a sub-mode — set the +0x2a4 mode bits, reset two
 * VRAM regions, then init the follow-up. */
extern void func_ov000_021adb9c(void);
extern void func_ov000_021adbdc(void);
extern int  func_0201d4b4(int a);
extern int  func_02094504(int a, void *b, int c);
extern void func_ov000_021ad464(int a);
extern char data_ov000_021c758c[];
void func_ov000_021af420(void) {
    *(int *)(data_ov000_021c758c + 676) = (*(int *)(data_ov000_021c758c + 676) & 0x807fffff) | 0x2000000;
    func_ov000_021adb9c();
    func_ov000_021adbdc();
    *(int *)(data_ov000_021c758c + 524) = 0;
    func_02094504(0, (char *)func_0201d4b4(8) + 1152, 384);
    func_ov000_021ad464(0);
}
