/* func_020198bc: GetSystemWork + func_02018bc0 + set bit 1 of [+0x10] to (b & 1). */

typedef struct {
    char _pad0[0x10];
    unsigned int f_10;
} record_18bc0_t;

extern void *GetSystemWork(void);
extern record_18bc0_t *func_02018bc0(int x);

void func_020198bc(int a, unsigned int b) {
    record_18bc0_t *r;
    GetSystemWork();
    r = func_02018bc0(a);
    r->f_10 = (r->f_10 & ~0x2) | (((b & 1) << 0x1f) >> 0x1e);
}
