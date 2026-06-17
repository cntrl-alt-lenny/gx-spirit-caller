/* func_020950b4: SNDi_SetTrackParam wrapper — param=10, flag=2.
 * Sibling of func_02095014; same shape, different `param` + `flag`.
 *
 *     stmdb sp!, {lr}
 *     sub   sp, sp, #4
 *     mov   r3, r2
 *     mov   r12, #2
 *     mov   r2, #10
 *     str   r12, [sp]
 *     bl    SNDi_SetTrackParam
 *     add   sp, sp, #4
 *     ldmfd sp!, {lr}
 *     bx    lr                     ; Style A epilogue → .legacy.c
 */

extern void SNDi_SetTrackParam(int tracks, int b, int param, int value, int flag);

void func_020950b4(int tracks, int b, int value) {
    SNDi_SetTrackParam(tracks, b, 10, value, 2);
}
