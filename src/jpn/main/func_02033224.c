/* func_02033224: init the sub-object at a0+0x1f4 — run func_020530e4(sub+0xc40,
 * *a0) + func_02052bc4(sub+0xc40), then func_02032718(a0). Keep a0+0x1f4 as the
 * retained base (two-add addressing). */
extern void func_020530e4(void *, int);
extern void func_02052bc4(void *);
extern void func_02032718(void *);
void func_02033224(char *a0){
    char *sub = a0 + 0x1f4;
    func_020530e4(sub + 0xc40, *(int *)a0);
    func_02052bc4(sub + 0xc40);
    func_02032718(a0);
}
