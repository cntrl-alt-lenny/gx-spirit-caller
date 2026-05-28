/* func_02049f38: 2x same-helper-returns-ptr + 2 field writes (mwcc 1.2/sp3).
 *
 *     push  {r4, r5, lr}
 *     sub   sp, sp, #4
 *     mov   r5, r0
 *     mov   r4, r1
 *     bl    helper
 *     str   r5, [r0, #28]
 *     bl    helper
 *     strh  r4, [r0, #26]
 *     add   sp, sp, #4
 *     pop   {r4, r5, pc}
 *
 * Brief 241 C-42 sub-shape (legacy_sp3 + dup-helper). The helper
 * is called twice (re-reads the pointer each time — TBAA
 * conservatism). Routes through *.legacy_sp3.c for the `sub sp,
 * sp, #4` prologue + style A pop.
 */
struct Func02049f38Target {
    char pad[26];
    unsigned short f26;
    int f28;
};

extern struct Func02049f38Target *func_020498f0(void);

void func_02049f38(int arg0, unsigned short arg1) {
    func_020498f0()->f28 = arg0;
    func_020498f0()->f26 = arg1;
}
