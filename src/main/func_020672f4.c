/* func_020672f4: format into a local via func_020a978c(buf, &fmt, a1), then
 * func_02067294(a0, buf). */
extern char data_02101794[];
extern void func_020a978c(void *, void *, int);
extern void func_02067294(int, void *);
void func_020672f4(int a0, int a1){
    char local[24];
    func_020a978c(local, data_02101794, a1);
    func_02067294(a0, local);
}
