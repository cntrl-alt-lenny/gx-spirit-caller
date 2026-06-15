; func_02096f64 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020970a8
        .global func_02096f64
        .arm
func_02096f64:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r6, r0
    ldr r5, [r6, #0x8]
    add r4, r6, #0x30
    str r5, [sp, #0x8]
    ldrh r1, [r4, #0x4]
    ldr r2, [r5, #0x34]
    add r0, sp, #0x8
    add r3, r2, r1, lsl #0x3
    add r1, sp, #0x0
    mov r2, #0x8
    str r3, [sp, #0xc]
    bl func_020970a8
    movs r3, r0
    bne .L_834
    add ip, r6, #0x20
    ldmia r4, {r0, r1, r2}
    stmia ip, {r0, r1, r2}
    ldrh r0, [r4, #0x6]
    cmp r0, #0x0
    bne .L_824
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    bne .L_824
    ldrh r0, [sp, #0x4]
    strh r0, [r6, #0x26]
    ldr r1, [r5, #0x34]
    ldr r0, [sp]
    add r0, r1, r0
    str r0, [r6, #0x28]
.L_824:
    ldrh r1, [sp, #0x6]
    ldr r0, _LIT0
    and r0, r1, r0
    str r0, [r6, #0x2c]
.L_834:
    mov r0, r3
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word 0x00000fff
