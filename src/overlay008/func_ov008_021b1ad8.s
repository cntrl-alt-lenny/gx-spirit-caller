; func_ov008_021b1ad8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov008_021b270c
        .extern func_02001d0c
        .extern func_02001e94
        .extern func_02005088
        .extern func_0202c46c
        .extern func_0208de94
        .extern func_0208e120
        .extern func_02094504
        .global func_ov008_021b1ad8
        .arm
func_ov008_021b1ad8:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r5, r0
    bl func_0208de94
    add r6, r0, #0x4e0
    ldr r2, _LIT0
    add r1, r6, #0x2000
    mov r0, #0x0
    bl func_02094504
    cmp r5, #0x0
    beq .L_17c0
    ldr r0, _LIT1
    ldr r2, [r0]
    ldr r4, [r2, #0x50]
    ldrsb r1, [r4]
    cmp r1, #0x0
    beq .L_17c0
    mov r1, #0x4
    str r1, [r2, #0x34]
    ldr r0, [r0]
    mov r1, #0x13
    mov r2, r1
    add r0, r0, #0x28
    bl func_02001d0c
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
    bl func_02005088
    ldr r0, _LIT1
    mov r1, #0x1
    ldr r0, [r0]
    str r1, [r0, #0x68]
    b .L_1824
.L_17c0:
    ldr r0, _LIT1
    mov r1, #0x13
    ldr r0, [r0]
    mov r2, r1
    add r0, r0, #0x28
    bl func_02001d0c
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
    bl func_0202c46c
    ldr r1, _LIT1
    mov r2, #0x1
    ldr r3, [r1]
    str r0, [r3, #0x50]
    ldr r0, [r1]
    str r2, [r0, #0x68]
    ldr r0, [r1]
    str r5, [r0, #0x5c]
.L_1824:
    bl func_0208e120
    ldr r1, _LIT1
    mov r3, r0
    ldr r0, [r1]
    ldr r2, _LIT2
    add r0, r0, #0x28
    add r1, r3, #0xd8
    mov r3, #0x1
    bl func_02001e94
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00002d20
_LIT1: .word data_ov008_021b270c
_LIT2: .word 0x00000127
