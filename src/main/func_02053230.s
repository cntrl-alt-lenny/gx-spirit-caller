; func_02053230 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02044c60
        .extern func_02053600
        .extern func_020536c8
        .extern func_020536d0
        .extern func_02093b00
        .global func_02053230
        .arm
func_02053230:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x38
    mov r6, r0
    add r0, sp, #0x14
    bl func_02093b00
    mov r3, #0x1
    add r2, sp, #0x14
.L_8c:
    add r0, r2, r3, lsl #0x2
    ldr r1, [r2, r3, lsl #0x2]
    ldr r0, [r0, #-4]
    eor r0, r1, r0
    str r0, [r2, r3, lsl #0x2]
    add r3, r3, #0x1
    cmp r3, #0x8
    bcc .L_8c
    add r0, sp, #0x0
    ldr r5, [sp, #0x30]
    mov r4, #0x0
    bl func_02044c60
    ldr r0, [sp, #0x10]
    cmp r0, #0x0
    beq .L_dc
    ldr r1, [sp]
    ldr r2, [sp, #0x4]
    mov r0, r6
    bl func_020536d0
    b .L_ec
.L_dc:
    ldr r1, [sp, #0x8]
    ldr r2, [sp, #0xc]
    mov r0, r6
    bl func_020536d0
.L_ec:
    ldr r0, _LIT0
    ldr r1, _LIT1
    umull r3, r2, r5, r0
    mla r2, r5, r1, r2
    ldr r1, _LIT2
    mla r2, r4, r0, r2
    adds r0, r3, r1
    mov r0, r6
    adc r1, r2, #0x0
    bl func_020536c8
    mov r0, r6
    mov r1, #0x1
    bl func_02053600
    add sp, sp, #0x38
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x6c078965
_LIT1: .word 0x5d588b65
_LIT2: .word 0x00269ec3
