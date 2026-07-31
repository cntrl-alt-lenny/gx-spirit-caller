extern char data_ov002_022cf1a4[];

extern int func_ov002_021b9ecc(int self, int arg1);
extern int func_0202df78(int a, int b);
extern int func_ov002_021bc8c8(int a, int b, int c);
extern int func_ov002_021bc618(int arg0);
extern int func_ov002_021bc288(int a, int b);

struct Obj0bf0 {
    char _pad0[2];
    unsigned short b0 : 1;
};

/* func_ov002_02210bf0: guard chain gated by obj->b0 (bit0 of the halfword
 * at +0x2) matching arg1 (the "player" argument), with one extra table
 * check that only runs when arg1 differs from obj->b0.
 */
int func_ov002_02210bf0(void *r0arg, int arg1, int arg2) {
    struct Obj0bf0 *obj = r0arg;

    if (obj->b0 != arg1) {
        return 0;
    }
    if (func_0202df78(func_ov002_021b9ecc(arg1, arg2), 0xfc9) == 0) {
        return 0;
    }
    if (func_ov002_021bc8c8(obj->b0, arg1, arg2) == 0) {
        return 0;
    }

    if (arg1 != obj->b0) {
        if (*(unsigned short *)(data_ov002_022cf1a4 + (arg1 & 1) * 0x868 + arg2 * 20) == 0) {
            return 0;
        }
    }

    if (func_ov002_021bc618(obj->b0) == 0) {
        if (obj->b0 != arg1) {
            return 0;
        }
        if (func_ov002_021bc288(arg1, arg2) == 0) {
            return 0;
        }
    }

    return 1;
}
