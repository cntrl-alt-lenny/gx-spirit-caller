/* func_ov000_021af334: enter a sub-mode — set the +0x2a4 mode bits, reset two
 * VRAM regions, then init the follow-up. */
extern void func_ov000_021adabc(void);
extern void func_ov000_021adafc(void);
extern int  func_0201d460(int a);
extern int  func_02094410(int a, void *b, int c);
extern void func_ov000_021ad384(int a);
extern char data_ov000_021c74ac[];
void func_ov000_021af334(void) {
    *(int *)(data_ov000_021c74ac + 676) = (*(int *)(data_ov000_021c74ac + 676) & 0x807fffff) | 0x2000000;
    func_ov000_021adabc();
    func_ov000_021adafc();
    *(int *)(data_ov000_021c74ac + 524) = 0;
    func_02094410(0, (char *)func_0201d460(8) + 1152, 384);
    func_ov000_021ad384(0);
}
