/* func_ov000_021ad3e8: refresh the sub-display — either run the registered
 * callback, or (when the +0x2ac mode bit is set) rebuild its two VRAM regions;
 * then mark +0x274 ready. */
extern void func_ov000_021adb70(void);
extern int  func_0201d530(int a);
extern int  func_0201d4b4(int a);
extern int  func_02094504(int a, void *b, int c);
extern char data_ov000_021c758c[];
extern char data_ov000_021c75c4[];
struct Ov000Bit0 { unsigned b : 1; };
int func_ov000_021ad3e8(void) {
    char *cfg = data_ov000_021c75c4;
    if (((struct Ov000Bit0 *)(data_ov000_021c758c + 684))->b == 0) {
        (*(void (**)(void))(cfg + 368))();
    } else {
        func_ov000_021adb70();
        func_02094504(0, (void *)func_0201d530(8), 32);
        func_02094504(0, (void *)func_0201d4b4(8), 2048);
    }
    *(int *)(cfg + 628) = (*(int *)(cfg + 628) & ~1) | 1;
    return 1;
}
