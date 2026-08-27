typedef struct {
    int f0;      /* +0x0 */
    int f4;      /* +0x4 */
    int f8;      /* +0x8 */
} Arg3_0205c340;

extern char data_02100a84;
extern char data_02100aa4;
extern char data_02100ab0;
extern void func_020a6c60(void *file, void *msg, int zero, int line);
extern void func_020a9698(void *out, void *lit3, void *arg2, int f0, int f4, int f8);
extern void func_02057cb8(void *arg0, void *arg1, void *out2);

void func_0205c2cc(void *arg0, void *arg1, void *arg2, Arg3_0205c340 *arg3) {
    char buf[64];
    int f4 = arg3->f4;
    int f0 = arg3->f0;
    int f8 = arg3->f8;

    if (arg3 == 0) {
        func_020a6c60(&data_02100aa4, &data_02100a84, 0, 0x376);
    }

    func_020a9698(buf, &data_02100ab0, arg2, f0, f4, f8);
    func_02057cb8(arg0, arg1, buf);
}
