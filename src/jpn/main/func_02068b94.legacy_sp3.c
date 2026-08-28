/* func_02068b94: lazy-init singleton. If the global handle is null,
 * construct it via func_0205468c with 3 callback pointers; return the
 * (now-populated) global either way. */

extern void *data_0219ebe8;
extern void *func_0205468c(int a, int b, int c, void *cb1, void *cb2, void *cb3);
extern void func_02068bf8(void);
extern void func_02068c08(void);
extern void func_02068c1c(void);

void *func_02068b94(void) {
    if (data_0219ebe8 == 0) {
        data_0219ebe8 = func_0205468c(8, 0x64, 2, func_02068c1c, func_02068c08, func_02068bf8);
    }
    return data_0219ebe8;
}
