/* func_ov000_021adb9c: clear a 1152-byte VRAM region at a base chosen by a
 * mode flag. */
extern int  func_0201d530(int a);
extern int  func_02094504(int a, void *b, int c);
extern char data_ov000_021c758c[];
extern char data_ov000_021c75c4[];
int func_ov000_021adb9c(void) {
    char *m = data_ov000_021c75c4;
    int base = *(int *)(data_ov000_021c758c + 668) ? *(int *)(m + 612) : 32;
    return func_02094504(0, (char *)base + func_0201d530(8), 1152);
}
