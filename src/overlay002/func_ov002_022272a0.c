/* func_ov002_022272a0: duel-progress state tick, dispatch on
 * data_ov002_022ce288+0x5a8 (0x7e/0x7f/0x80), sibling of
 * func_ov002_0223483c/func_ov002_0222706c/func_ov002_02224398 (same
 * state field, same self struct shape: u16 f0 @0, bit0:1 bitfield @2).
 * Case order mirrors the .s comparison chain (0x7e, 0x7f, 0x80) per S-2.
 */
typedef unsigned short u16;

struct S {
    u16 f0;
    u16 bit0 : 1;
    u16 rest : 15;
    u16 _pad4[2];
    u16 f8;
    u16 fA;
};

extern char data_ov002_022ce288[];
extern char data_ov002_022d0e6c[];

extern int func_ov002_02257b48(struct S *self, int arg1);
extern void func_ov002_0226afb4(int arg0, int arg1);
extern int func_ov002_021e278c(int arg0, int arg1);
extern int func_ov002_021c38c4(int flag, int field);
extern void func_ov002_021e2b3c(void);
extern void func_ov002_021df818(void *self, int flag, int val);
extern int func_ov002_021b9b64(u16 arg);
extern void func_ov002_021d7c1c(int a, int b, int c);
extern void func_ov002_021e2c5c(void);

int func_ov002_022272a0(struct S *self, int arg1) {
    switch (*(int *)(data_ov002_022ce288 + 0x5a8)) {
    case 0x80:
        if (func_ov002_02257b48(self, arg1) == 0) return 0;
        func_ov002_0226afb4(self->bit0, self->f0);
        return 0x7f;
    case 0x7f:
        self->f8 = *(u16 *)(data_ov002_022d0e6c + 0xb2);
        func_ov002_0226afb4(1 - self->bit0, self->f0);
        return 0x7e;
    case 0x7e: {
        int r6, r5;
        self->fA = *(u16 *)(data_ov002_022d0e6c + 0xb2);
        func_ov002_021e278c(self->bit0, self->f8);
        func_ov002_021e278c(1 - self->bit0, self->fA);
        r6 = func_ov002_021c38c4(self->bit0, self->f8);
        r5 = func_ov002_021c38c4(1 - self->bit0, self->fA);
        func_ov002_021e2b3c();
        if (r6 > r5) {
            int result;
            func_ov002_021df818(self, 1 - self->bit0, 1000);
            result = func_ov002_021b9b64(self->fA);
            func_ov002_021d7c1c(1 - self->bit0, result, 0);
        } else if (r6 < r5) {
            int result;
            func_ov002_021df818(self, self->bit0, 1000);
            result = func_ov002_021b9b64(self->f8);
            func_ov002_021d7c1c(self->bit0, result, 0);
        }
        func_ov002_021e2c5c();
        break;
    }
    }
    return 0;
}
