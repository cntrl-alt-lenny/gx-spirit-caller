; func_ov008_021b19b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov008_021b25ec
        .extern func_02001cec
        .extern func_02001e74
        .extern func_0200506c
        .extern func_0202c418
        .extern func_0208ddac
        .extern func_0208e038
        .extern func_02094410
        .global func_ov008_021b19b4
        .arm
func_ov008_021b19b4:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r5, r0
    bl func_0208ddac
    add r6, r0, #0x4e0
    ldr r2, _LIT0
    add r1, r6, #0x2000
    mov r0, #0x0
    bl func_02094410
    cmp r5, #0x0
    beq .L_1e0
    ldr r0, _LIT1
    ldr r2, [r0]
    ldr r4, [r2, #0x50]
    ldrsb r1, [r4]
    cmp r1, #0x0
    beq .L_1e0
    mov r1, #0x4
    str r1, [r2, #0x34]
    ldr r0, [r0]
    mov r1, #0x13
    mov r2, r1
    add r0, r0, #0x28
    bl func_02001cec
    mov r0, #0x4
    str r0, [sp]
    mov r1, #0xc
    ldr r0, _LIT1
    str r1, [sp, #0x4]
    ldr r0, [r0]
    mov r1, r4
    add r0, r0, #0x28
    add r2, r6, #0x2000
    mov r3, #0x6
    bl func_0200506c
    ldr r0, _LIT1
    mov r1, #0x1
    ldr r0, [r0]
    str r1, [r0, #0x68]
    b .L_244
.L_1e0:
    ldr r0, _LIT1
    mov r1, #0x13
    ldr r0, [r0]
    mov r2, r1
    add r0, r0, #0x28
    bl func_02001cec
    ldr r0, _LIT1
    mov r2, #0x4
    ldr r1, [r0]
    str r2, [r1, #0x34]
    ldr r2, [r0]
    ldr r1, [r2, #0x48]
    orr r1, r1, #0x800000
    str r1, [r2, #0x48]
    ldr r0, [r0]
    ldr r0, [r0, #0x10]
    bl func_0202c418
    ldr r1, _LIT1
    mov r2, #0x1
    ldr r3, [r1]
    str r0, [r3, #0x50]
    ldr r0, [r1]
    str r2, [r0, #0x68]
    ldr r0, [r1]
    str r5, [r0, #0x5c]
.L_244:
    bl func_0208e038
    ldr r1, _LIT1
    mov r3, r0
    ldr r0, [r1]
    ldr r2, _LIT2
    add r0, r0, #0x28
    add r1, r3, #0xd8
    mov r3, #0x1
    bl func_02001e74
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00002d20
_LIT1: .word data_ov008_021b25ec
_LIT2: .word 0x00000127
