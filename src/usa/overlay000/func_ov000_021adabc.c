/* func_ov000_021adabc: clear a 1152-byte VRAM region at a base chosen by a
 * mode flag. */
extern int  func_0201d4dc(int a);
extern int  func_02094410(int a, void *b, int c);
extern char data_ov000_021c74ac[];
extern char data_ov000_021c74e4[];
int func_ov000_021adabc(void) {
    char *m = data_ov000_021c74e4;
    int base = *(int *)(data_ov000_021c74ac + 668) ? *(int *)(m + 612) : 32;
    return func_02094410(0, (char *)base + func_0201d4dc(8), 1152);
}
