/* func_02038908: C-42 — sign-clamp + helper + multiply + u16-shift.
 *
 *   push {r4, lr}; mov r4, r0
 *   cmp r4, #1; movle r0, #0; pople              ; if n <= 1 return 0
 *   bl func_020388b8
 *   lsl r0, r0, #16; lsr r0, r0, #16             ; (unsigned short) cast
 *   mul r0, r4, r0
 *   lsr r0, r0, #16
 *   pop
 */

extern int func_020388b8(void);

unsigned int func_02038908(int n) {
    if (n <= 1) return 0;
    return ((unsigned int)n * (unsigned short)func_020388b8()) >> 16;
}
