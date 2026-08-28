/* func_02066d8c: guarded string-table append. Bail on out-of-range a3 or a
 * zero terminator byte, else build into a stack buffer, append the a0+0x44
 * string via func_02066e6c, flush via func_02066fb0, then advance a1's
 * running string-table offset (f_800) past the newly appended NUL-terminated
 * string (func_020aace8 is a signed-byte strlen).
 */

typedef struct {
    char _pad[0x800];
    int f_800;
} s2_t;

extern void func_020aad04(void *buf, void *a2);
extern int func_020aace8(const char *s);
extern void func_02066e6c(void *dst, int len, void *buf, int k);
extern void func_02066fb0(void *buf, int k, char *dst);

void func_02066d8c(void *a0, s2_t *a1, signed char *a2, int a3) {
    if (a3 < 1) {
        return;
    }
    if (a3 > 0x41) {
        return;
    }
    if (a2[a3 - 1] != 0) {
        return;
    }
    char buf[0x48];
    func_020aad04(buf, a2);
    int len = func_020aace8((char *)a0 + 0x44);
    func_02066e6c((char *)a0 + 0x44, len, buf, a3 - 1);
    func_02066fb0(buf, a3 - 1, (char *)a1 + a1->f_800);
    a1->f_800 = func_020aace8((char *)a1 + a1->f_800) + 1 + a1->f_800;
}
