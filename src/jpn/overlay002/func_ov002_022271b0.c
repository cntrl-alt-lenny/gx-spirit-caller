/* func_ov002_022271b0: duel-progress state tick, dispatch on
 * data_ov002_022ce1a8+0x5a8 (0x7e/0x7f/0x80), sibling of
 * func_ov002_0223474c/func_ov002_02226f7c/func_ov002_022242a8 (same
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

extern char data_ov002_022ce1a8[];
extern char data_ov002_022d0d8c[];

extern int func_ov002_02257a60(struct S *self, int arg1);
extern void func_ov002_0226aec4(int arg0, int arg1);
extern int func_ov002_021e269c(int arg0, int arg1);
extern int func_ov002_021c37e4(int flag, int field);
extern void func_ov002_021e2a4c(void);
extern void func_ov002_021df728(void *self, int flag, int val);
extern int func_ov002_021b9a84(u16 arg);
extern void func_ov002_021d7b2c(int a, int b, int c);
extern void func_ov002_021e2b6c(void);

int func_ov002_022271b0(struct S *self, int arg1) {
    switch (*(int *)(data_ov002_022ce1a8 + 0x5a8)) {
    case 0x80:
        if (func_ov002_02257a60(self, arg1) == 0) return 0;
        func_ov002_0226aec4(self->bit0, self->f0);
        return 0x7f;
    case 0x7f:
        self->f8 = *(u16 *)(data_ov002_022d0d8c + 0xb2);
        func_ov002_0226aec4(1 - self->bit0, self->f0);
        return 0x7e;
    case 0x7e: {
        int r6, r5;
        self->fA = *(u16 *)(data_ov002_022d0d8c + 0xb2);
        func_ov002_021e269c(self->bit0, self->f8);
        func_ov002_021e269c(1 - self->bit0, self->fA);
        r6 = func_ov002_021c37e4(self->bit0, self->f8);
        r5 = func_ov002_021c37e4(1 - self->bit0, self->fA);
        func_ov002_021e2a4c();
        if (r6 > r5) {
            int result;
            func_ov002_021df728(self, 1 - self->bit0, 1000);
            result = func_ov002_021b9a84(self->fA);
            func_ov002_021d7b2c(1 - self->bit0, result, 0);
        } else if (r6 < r5) {
            int result;
            func_ov002_021df728(self, self->bit0, 1000);
            result = func_ov002_021b9a84(self->f8);
            func_ov002_021d7b2c(self->bit0, result, 0);
        }
        func_ov002_021e2b6c();
        break;
    }
    }
    return 0;
}
