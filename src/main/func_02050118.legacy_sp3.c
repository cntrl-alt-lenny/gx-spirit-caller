/* func_02050118: 2x helper-returns-ptr + 2 strb writes (mwcc 1.2/sp3).
 *
 *     stmfd sp!, {lr}
 *     sub   sp, sp, #4
 *     bl    helper
 *     mov   r1, #0xff
 *     strb  r1, [r0, #972]
 *     bl    helper
 *     mov   r1, #0
 *     strb  r1, [r0, #973]
 *     add   sp, sp, #4
 *     ldmfd sp!, {pc}
 *
 * Brief 241 C-42 sub-shape (legacy_sp3 + dup-helper + 2 strb).
 * Sibling of func_02049f38 but with no register saves needed
 * (no args, byte writes only).
 */
struct Func02050118Target {
    char pad[972];
    unsigned char f972;
    unsigned char f973;
};

extern struct Func02050118Target *func_020498f0(void);

void func_02050118(void) {
    func_020498f0()->f972 = 0xff;
    func_020498f0()->f973 = 0;
}
