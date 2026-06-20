/* func_02052d80: memset + 2 helpers (sub-sp + pop-pc -> .legacy_sp3.c). */
extern void func_02094500(void *p, int v, unsigned n);
extern void func_02053640(void *self, int a1);
extern void func_0205358c(void *self, int k);
void func_02052d80(void *self, int a1) {
    func_02094500(self, 0, 12);
    func_02053640(self, a1);
    func_0205358c(self, 3);
}
