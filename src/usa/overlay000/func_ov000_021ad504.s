; func_ov000_021ad504 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov000_021ad460
        .global func_ov000_021ad504
        .arm
func_ov000_021ad504:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x10
    ldr r2, [r0]
    add r3, sp, #0x8
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x17
    mov r2, r2, lsl #0xc
    str r2, [sp, #0x8]
    ldr r2, [r0]
    mov r1, #0x0
    mov r2, r2, lsl #0x7
    mov r2, r2, lsr #0x17
    mov r2, r2, lsl #0xc
    str r2, [sp, #0xc]
    ldr r2, [r0]
    mov r2, r2, lsl #0x19
    mov r2, r2, lsr #0x1c
    cmp r2, #0x1
    str r3, [sp]
    mov r2, #0x1
    str r2, [sp, #0x4]
    ldr r0, [r0, #0x4]
    moveq r1, #0x1
    mov r0, r0, lsl #0x8
    mov r2, #0x0
    mov r0, r0, lsr #0x18
    mov r3, #0x10
    bl func_ov000_021ad460
    mov r0, #0x0
    add sp, sp, #0x10
    ldmia sp!, {r3, pc}
