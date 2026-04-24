/* func_ov002_02288704: predicate — `return arg1 != 0`. Arg 0 is
 * ignored; only arg 1 (r1) is tested.
 *
 *     cmp   r1, #0x0
 *     movne r0, #0x1
 *     moveq r0, #0x0
 *     bx    lr
 */

int func_ov002_02288704(int unused, int flag) {
    (void)unused;
    return (flag != 0);
}
