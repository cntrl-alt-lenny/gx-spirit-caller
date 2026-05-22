/* func_02095130: SNDi_SetTrackParam wrapper — param=26, flag=1.
 * Sibling of func_02095108; same shape, different `param` constant.
 *
 *     stmdb sp!, {lr}
 *     sub   sp, sp, #4
 *     mov   r3, r2
 *     mov   r12, #1
 *     mov   r2, #26
 *     str   r12, [sp]
 *     bl    SNDi_SetTrackParam
 *     add   sp, sp, #4
 *     ldmfd sp!, {lr}
 *     bx    lr                     ; Style A epilogue → .legacy.c
 */

extern void SNDi_SetTrackParam(int tracks, int b, int param, int value, int flag);

void func_02095130(int tracks, int b, int value) {
    SNDi_SetTrackParam(tracks, b, 26, value, 1);
}
