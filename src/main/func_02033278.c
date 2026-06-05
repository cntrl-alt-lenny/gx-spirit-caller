/* func_02033278: init the sub-object at a0+0x1fc — run func_02053158(sub+0xc40,
 * *a0) + func_02052c38(sub+0xc40), then func_0203276c(a0). Keep a0+0x1fc as the
 * retained base (two-add addressing). */
extern void func_02053158(void *, int);
extern void func_02052c38(void *);
extern void func_0203276c(void *);
void func_02033278(char *a0){
    char *sub = a0 + 0x1fc;
    func_02053158(sub + 0xc40, *(int *)a0);
    func_02052c38(sub + 0xc40);
    func_0203276c(a0);
}
