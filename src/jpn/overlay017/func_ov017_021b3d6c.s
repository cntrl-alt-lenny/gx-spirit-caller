; func_ov017_021b3d6c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .extern data_ov017_021b8510
        .extern data_ov017_021b8794
        .extern func_020371b8
        .extern func_0208dfb8
        .extern func_0208e0c4
        .extern func_02094410
        .extern func_ov017_021b4470
        .global func_ov017_021b3d6c
        .arm
func_ov017_021b3d6c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r2, [r4, #0xc]
    cmp r2, #0x4
    bne .L_9d8
    mov r0, #0x42
    sub r1, r0, #0x43
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_9d8:
    cmp r2, #0x2
    bne .L_a14
    ldr r0, _LIT0
    ldr r1, [r0, #0xa64]
    and r1, r1, #0x1f00000
    movs r1, r1, lsr #0x14
    ldreq r0, [r0, #0xa74]
    cmpeq r0, #0x0
    bne .L_a14
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_ac4
.L_a14:
    cmp r2, #0x1
    bne .L_a48
    ldr r0, _LIT1
    ldrb r0, [r0, #0x1ce]
    cmp r0, #0x6
    cmpne r0, #0xb
    bne .L_a48
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_ac4
.L_a48:
    ldr r2, _LIT2
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    bic r0, r3, #0x6
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
    bl func_0208e0c4
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x800
    bl func_02094410
    bl func_0208dfb8
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x800
    bl func_02094410
    mov r2, #0x0
    ldr r1, _LIT3
    ldr r0, _LIT4
    strh r2, [r1]
    ldr r1, [r4, #0xc]
    bl func_ov017_021b4470
    mov r3, #0x1
    str r3, [r4, #0x4]
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    bl func_020371b8
.L_ac4:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_02104e6c
_LIT1: .word data_ov017_021b8794
_LIT2: .word 0x04001000
_LIT3: .word 0x04001050
_LIT4: .word data_ov017_021b8510
