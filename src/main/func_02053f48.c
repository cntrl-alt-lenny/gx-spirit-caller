typedef struct {
    int count;                 /* +0x00 */
    char _pad_8[0x8 - 0x4];
    int elemsize;                /* +0x08 */
    char _pad_14[0x14 - 0xc];
    int f14;                       /* +0x14 */
} Self02053f48;

extern char data_020ffb04;
extern char data_020ffb30;
extern void func_020a6d54(void *file, void *msg, int zero, int line);
extern int  func_02053b38(void *val, int f14, int count, int elemsize, int n, void *out_buf);
extern int  func_020b3870(int diff, int elemsize);
extern void func_02053fc4(Self02053f48 *arr, void *val, int idx);

void func_02053f48(Self02053f48 *self, void *val, int n) {
    int out_buf[2];
    int idx;

    if (n == 0) {
        func_020a6d54(&data_020ffb30, &data_020ffb04, 0, 0xb7);
    }

    idx = func_02053b38(val, self->f14, self->count, self->elemsize, n, out_buf);
    idx = func_020b3870(idx - self->f14, self->elemsize);
    func_02053fc4(self, val, idx);
}
