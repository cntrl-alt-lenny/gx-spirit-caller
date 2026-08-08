/* func_02068c08: lazy-init singleton. If the global handle is null,
 * construct it via func_02054700 with 3 callback pointers; return the
 * (now-populated) global either way. */

extern void *data_0219ecc8;
extern void *func_02054700(int a, int b, int c, void *cb1, void *cb2, void *cb3);
extern void func_02068c6c(void);
extern void func_02068c7c(void);
extern void func_02068c90(void);

void *func_02068c08(void) {
    if (data_0219ecc8 == 0) {
        data_0219ecc8 = func_02054700(8, 0x64, 2, func_02068c90, func_02068c7c, func_02068c6c);
    }
    return data_0219ecc8;
}
