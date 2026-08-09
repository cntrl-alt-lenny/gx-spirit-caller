/* func_0208f38c: if data_0210249c isn't the sentinel -1, notifies
 * func_02093dc8 with it. Always forwards data_021a6328 to
 * func_0208d6f4, then clears both data_021a6328 and data_021a6324.
 */
extern void func_02093dc8(int a0);
extern void func_0208d6f4(int a0);
extern int data_0210249c;
extern int data_021a6328;
extern int data_021a6324;

void func_0208f38c(void) {
    if (data_0210249c != -1) {
        func_02093dc8(data_0210249c);
    }
    func_0208d6f4(data_021a6328);
    data_021a6328 = 0;
    data_021a6324 = 0;
}
