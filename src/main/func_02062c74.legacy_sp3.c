/* func_02062c74: validate via func_02062eec (a0, mode 3, a3+0x27, &local);
 * bail 0 if it fails, bail 1 if local came back nonzero. Otherwise copy
 * a1 and a2/a3 into a0+0x50 via func_020613d8 and report func_02062e6c's
 * result as a bool. */

extern int func_02062eec(void *a0, int mode, void *arg2, int *out);
extern void func_020613d8(void *dst, void *src, unsigned int len);
extern int func_02062e6c(void *a0);

int func_02062c74(unsigned char *a0, void *a1, void *a2, unsigned char *a3) {
    int local;
    if (func_02062eec(a0, 3, a3 + 0x27, &local) == 0) {
        return 0;
    }
    if (local != 0) {
        return 1;
    }
    func_020613d8(a0 + 0x50, a1, 0x20);
    func_020613d8(a0 + 0x50, a2, (unsigned int)a3);
    return func_02062e6c(a0) != 0;
}
