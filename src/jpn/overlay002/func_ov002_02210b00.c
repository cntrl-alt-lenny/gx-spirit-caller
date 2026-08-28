extern char data_ov002_022cf0c4[];

extern int func_ov002_021b9dec(int self, int arg1);
extern int func_0202df24(int a, int b);
extern int func_ov002_021bc7e8(int a, int b, int c);
extern int func_ov002_021bc538(int arg0);
extern int func_ov002_021bc1a8(int a, int b);

struct Obj0bf0 {
    char _pad0[2];
    unsigned short b0 : 1;
};

/* func_ov002_02210b00: guard chain gated by obj->b0 (bit0 of the halfword
 * at +0x2) matching arg1 (the "player" argument), with one extra table
 * check that only runs when arg1 differs from obj->b0.
 */
int func_ov002_02210b00(void *r0arg, int arg1, int arg2) {
    struct Obj0bf0 *obj = r0arg;

    if (obj->b0 != arg1) {
        return 0;
    }
    if (func_0202df24(func_ov002_021b9dec(arg1, arg2), 0xfc9) == 0) {
        return 0;
    }
    if (func_ov002_021bc7e8(obj->b0, arg1, arg2) == 0) {
        return 0;
    }

    if (arg1 != obj->b0) {
        if (*(unsigned short *)(data_ov002_022cf0c4 + (arg1 & 1) * 0x868 + arg2 * 20) == 0) {
            return 0;
        }
    }

    if (func_ov002_021bc538(obj->b0) == 0) {
        if (obj->b0 != arg1) {
            return 0;
        }
        if (func_ov002_021bc1a8(arg1, arg2) == 0) {
            return 0;
        }
    }

    return 1;
}
