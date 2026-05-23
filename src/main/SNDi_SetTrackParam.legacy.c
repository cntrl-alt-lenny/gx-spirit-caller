/* SNDi_SetTrackParam: NitroSDK sound-driver track-parameter setter
 * — packs (tracks | flag<<24) into the second word and forwards to
 * func_02094c94 with cmd=7.
 *
 *     stmdb sp!, {lr}
 *     sub   sp, sp, #4
 *     ldr   r12, [sp, #0x8]              ; flag (stack arg 1)
 *     mov   lr, r2                       ; save param
 *     str   r3, [sp]                     ; *sp = value (stack arg for callee)
 *     mov   r2, r1                       ; r2 = b
 *     orr   r1, r0, r12, lsl #24         ; r1 = tracks | (flag<<24)
 *     mov   r3, lr                       ; r3 = param
 *     mov   r0, #7
 *     bl    func_02094c94
 *     add   sp, sp, #4
 *     ldmfd sp!, {lr}
 *     bx    lr                            ; Style A → .legacy.c
 *
 * Picks 12/13/14 are all-thin wrappers around this function.
 */

extern void func_02094c94(int cmd, int packed, int b, int param, int value);

void SNDi_SetTrackParam(int tracks, int b, int param, int value, int flag) {
    func_02094c94(7, tracks | (flag << 24), b, param, value);
}
