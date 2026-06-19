/* func_ov000_021ad308: refresh the sub-display — either run the registered
 * callback, or (when the +0x2ac mode bit is set) rebuild its two VRAM regions;
 * then mark +0x274 ready. */
extern void func_ov000_021ada90(void);
extern int  func_0201d4dc(int a);
extern int  func_0201d460(int a);
extern int  func_02094410(int a, void *b, int c);
extern char data_ov000_021c74ac[];
extern char data_ov000_021c74e4[];
struct Ov000Bit0 { unsigned b : 1; };
int func_ov000_021ad308(void) {
    char *cfg = data_ov000_021c74e4;
    if (((struct Ov000Bit0 *)(data_ov000_021c74ac + 684))->b == 0) {
        (*(void (**)(void))(cfg + 368))();
    } else {
        func_ov000_021ada90();
        func_02094410(0, (void *)func_0201d4dc(8), 32);
        func_02094410(0, (void *)func_0201d460(8), 2048);
    }
    *(int *)(cfg + 628) = (*(int *)(cfg + 628) & ~1) | 1;
    return 1;
}
