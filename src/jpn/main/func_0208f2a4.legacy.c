/* func_0208f2a4: if data_021023bc isn't the sentinel -1, notifies
 * func_02093cd4 with it. Always forwards data_021a6248 to
 * func_0208d60c, then clears both data_021a6248 and data_021a6244.
 */
extern void func_02093cd4(int a0);
extern void func_0208d60c(int a0);
extern int data_021023bc;
extern int data_021a6248;
extern int data_021a6244;

void func_0208f2a4(void) {
    if (data_021023bc != -1) {
        func_02093cd4(data_021023bc);
    }
    func_0208d60c(data_021a6248);
    data_021a6248 = 0;
    data_021a6244 = 0;
}
