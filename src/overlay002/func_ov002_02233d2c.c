/* func_ov002_02233d2c: default tier (r3-spill: 4 callee-saved is
 * odd... wait 4 is even, but +lr=5 is odd, padded with r3).
 * Guard chain (func_ov002_0223df38/0225764c) then dispatches
 * func_ov002_021d5a08 with a computed msec value.
 */

extern void func_ov002_021e9ac4(void);
extern int func_ov002_02257750(void *self, void *callback);
extern int func_ov002_021de408(void *self, int a);
extern int func_ov002_0223df38(void *self, int a, int b);
extern int func_ov002_0223de94(void *self, int a);
extern int func_ov002_0225764c(void *self, int byte0, int byte1);
extern int func_ov002_021b4618(int a);
extern int func_ov002_021d5a08(void *self, int a, int b, int word0, int c, int d);

typedef struct {
    unsigned short word0;
} func_ov002_02233d2c_t;

int func_ov002_02233d2c(func_ov002_02233d2c_t *self) {
    int r1v = func_ov002_02257750(self, (void *)func_ov002_021e9ac4);
    int r7 = func_ov002_021de408(self, r1v);

    if (func_ov002_0223df38(self, 0, 0) != 0) {
        int packed = func_ov002_0223de94(self, 0);
        int byte0 = packed & 0xff;
        unsigned short lo16 = (unsigned short)packed;
        int byte1 = (lo16 >> 8) & 0xff;

        if (func_ov002_0225764c(self, byte0, byte1) != 0) {
            int val = func_ov002_021b4618(r7) * 1000;
            unsigned short trunc = (unsigned short)val;
            func_ov002_021d5a08(self, byte0, byte1, self->word0, 3, trunc);
        }
    }

    return 0;
}
