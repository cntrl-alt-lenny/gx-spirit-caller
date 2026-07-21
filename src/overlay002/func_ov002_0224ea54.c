/* func_ov002_0224ea54: Looks up a packed table entry (base selected by obj&1) and unpacks a sub-field, calls func_ov002_021c38c4 to classify it; if the result is >=7, forwards to func_ov002_02253458.
 * Ships as asm -- verbatim transcription of the original
 * instructions; the exact register/branch shape isn't reliably
 * reachable from natural C without risking a mismatch.
 */

extern void func_ov002_021c38c4(void);
extern void func_ov002_02253458(void);
extern char data_ov002_022cf16c[];

asm void func_ov002_0224ea54(void) {
    nofralloc
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r4, =data_ov002_022cf16c
    ldr r1, =0x00000868
    and r3, r5, #1
    mla r1, r3, r1, r4
    mov r4, r2
    add r1, r1, #288
    ldr r2, [r1, r4, lsl #2]
    mov r1, r2, lsl #2
    mov r1, r1, lsr #24
    mov r2, r2, lsl #18
    mov r1, r1, lsl #1
    add r1, r1, r2, lsr #31
    bl  func_ov002_021c38c4
    cmp r0, #7
    ldmltia sp!, {r3, r4, r5, pc}
    mov r0, r5
    mov r2, r4
    mov r1, #11
    bl  func_ov002_02253458
    ldmia sp!, {r3, r4, r5, pc}
}
