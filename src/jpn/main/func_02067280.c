/* func_02067280: format into a local via func_020a9698(buf, &fmt, a1), then
 * func_02067220(a0, buf). */
extern char data_021016b4[];
extern void func_020a9698(void *, void *, int);
extern void func_02067220(int, void *);
void func_02067280(int a0, int a1){
    char local[24];
    func_020a9698(local, data_021016b4, a1);
    func_02067220(a0, local);
}
