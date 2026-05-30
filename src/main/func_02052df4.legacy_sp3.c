/* func_02052df4: memset + 2 helpers (sub-sp + pop-pc -> .legacy_sp3.c). */
extern void func_020945f4(void *p, int v, unsigned n);
extern void func_020536b4(void *self, int a1);
extern void func_02053600(void *self, int k);
void func_02052df4(void *self, int a1) {
    func_020945f4(self, 0, 12);
    func_020536b4(self, a1);
    func_02053600(self, 3);
}
