/* func_02095014: SNDi_SetTrackParam wrapper — param=25, flag=1.
 *
 *     stmdb sp!, {lr}
 *     sub   sp, sp, #4
 *     mov   r3, r2
 *     mov   r12, #1
 *     mov   r2, #25
 *     str   r12, [sp]
 *     bl    SNDi_SetTrackParam
 *     add   sp, sp, #4
 *     ldmfd sp!, {lr}
 *     bx    lr                     ; Style A epilogue → .legacy.c
 *
 * Wraps SNDi_SetTrackParam(tracks, ..., 25, value, 1). One of 3 sibling
 * wrappers (this + func_0209503c + func_020950b4) differing only in
 * the constant `param` (3rd arg) and `flag` (5th arg).
 */

extern void SNDi_SetTrackParam(int tracks, int b, int param, int value, int flag);

void func_02095014(int tracks, int b, int value) {
    SNDi_SetTrackParam(tracks, b, 25, value, 1);
}
