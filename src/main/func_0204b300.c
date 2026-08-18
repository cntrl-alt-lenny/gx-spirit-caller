/* func_0204b300: find the lowest byte value (starting at 0, capped at
 * 0x20) not already present in the singleton's active slice of
 * arr_2d0[0..count]. */

struct S0204b300_Obj {
    unsigned char _pad_00[0x14];
    unsigned char f_14;   /* +0x14 */
    unsigned char _pad_15[0x2d0 - 0x15];
    unsigned char arr_2d0[1];   /* +0x2d0 */
};

extern struct S0204b300_Obj *func_020498f0(void);

int func_0204b300(void) {
    int inner;
    unsigned char outer;
    int frozen;
    int count;

    outer = 0;
    frozen = outer;

top:
    inner = frozen;
    count = func_020498f0()->f_14;
    if (count < 0) {
        goto after_inner;
    }
inner_loop:
    if (outer == func_020498f0()->arr_2d0[inner]) {
        goto after_inner;
    }
    inner++;
    if (inner <= func_020498f0()->f_14) {
        goto inner_loop;
    }
after_inner:
    if (inner > func_020498f0()->f_14) {
        goto end;
    }
    outer = (outer + 1) & 0xff;
    if (outer < 0x20) {
        goto top;
    }
end:
    return outer;
}
