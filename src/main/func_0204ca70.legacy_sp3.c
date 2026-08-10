/* func_0204ca70: scan a table via func_020498f0()'s singleton, calling
 * func_0204ead0 per entry; falls through to a 4-field reset + callback.
 *
 * func_020498f0() (void *func_020498f0(void)) is re-invoked at every
 * field access (5 times per loop iteration alone) -- mwcc never caches
 * the pointer, so neither can this source. Classic loop rotation: guard
 * test up front (count>=1), same test re-evaluated as the back edge.
 *
 * Argument evaluation order matters here: the five func_020498f0() calls
 * inside the loop happen in the SAME order as func_0204ead0's argument
 * list (left to right), with each result stashed in a callee-saved reg
 * only long enough to survive the intervening calls before use.
 */

struct S020498f0 {
    unsigned char pad_00[0x4];
    int **field_4;                       /* 0x4 */
    unsigned char pad_08[0x0d - 0x08];
    unsigned char count;                 /* 0x0d */
    unsigned char pad_0e[0x17 - 0x0e];
    unsigned char field_17;              /* 0x17 */
    unsigned char pad_18[0x20 - 0x18];
    int field_20;                        /* 0x20 */
    int arr_24[1];                       /* 0x24 */
    unsigned char pad_28[0xa4 - 0x28];
    unsigned short arr_a4[1];            /* 0xa4 */
    unsigned char pad_a6[0xf4 - 0xa6];
    int arr_f4[1];                       /* 0xf4 */
    unsigned char pad_f8[0x1a8 - 0xf8];
    unsigned char field_1a8;             /* 0x1a8 */
    unsigned char pad_1a9[0x348 - 0x1a9];
    int field_348;                       /* 0x348 */
};

extern struct S020498f0 *func_020498f0(void);
extern int func_0204ead0(int a, int b, int c, int d, int *e, int f);
extern int func_02062530(int *p);

int func_0204ca70(void) {
    int i;

    for (i = 1; i <= func_020498f0()->count; i++) {
        int r = func_0204ead0(10,
                               func_020498f0()->arr_f4[i],
                               func_020498f0()->arr_24[i],
                               func_020498f0()->arr_a4[i],
                               &func_020498f0()->field_348,
                               func_020498f0()->field_348 + 1);
        if (r != 0) {
            return r;
        }
    }

    func_020498f0()->field_17 = 0;
    func_020498f0()->field_20 = 0;
    func_020498f0()->field_1a8 = 1;
    func_02062530(*func_020498f0()->field_4);
    func_020498f0()->field_1a8 = 0;
    return 0;
}
