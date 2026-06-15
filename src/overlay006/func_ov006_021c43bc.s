; func_ov006_021c43bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov006_021cddfc
        .extern data_ov006_021cde14
        .extern data_ov006_021cde2c
        .global func_ov006_021c43bc
        .arm
func_ov006_021c43bc:
    stmdb sp!, {r3, r4, r5, lr}
    ldr ip, [r0, #0x64]
    mov r4, #0x0
    str r4, [r3]
    str r4, [r3, #0x4]
    add lr, r0, #0x9c
    ldr r5, _LIT0
    str r4, [r3, #0x8]
    add ip, lr, ip, lsl #0x4
.L_1ed0:
    ldrsh lr, [r5]
    cmp r1, lr
    ldrgesh lr, [r5, #0x2]
    cmpge r2, lr
    blt .L_1f0c
    ldrsh lr, [r5, #0x4]
    cmp r1, lr
    ldrlesh lr, [r5, #0x6]
    cmple r2, lr
    bgt .L_1f0c
    mov r0, #0x1
    str r0, [r3]
    ldr r1, [r5, #0x8]
    str r1, [r3, #0x4]
    ldmia sp!, {r3, r4, r5, pc}
.L_1f0c:
    add r4, r4, #0x1
    cmp r4, #0x2
    add r5, r5, #0xc
    blt .L_1ed0
    ldr lr, [r0, #0x58]
    ldr r0, _LIT1
    mov lr, lr, lsl #0x2
    ldrsh r0, [r0, lr]
    cmp r0, #0x2
    bne .L_1f84
    ldr r4, _LIT2
    mov r5, #0x0
.L_1f3c:
    ldrsh r0, [r4]
    cmp r1, r0
    ldrgesh r0, [r4, #0x2]
    cmpge r2, r0
    blt .L_1f74
    ldrsh r0, [r4, #0x4]
    cmp r1, r0
    ldrlesh r0, [r4, #0x6]
    cmple r2, r0
    bgt .L_1f74
    mov r0, #0x3
    stmia r3, {r0, r5}
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_1f74:
    add r5, r5, #0x1
    cmp r5, #0x2
    add r4, r4, #0xc
    blt .L_1f3c
.L_1f84:
    mov r5, #0x0
    mov r4, #0x1e
    mov lr, #0x2e
.L_1f90:
    cmp r5, #0x1
    blt .L_1fb4
    ldr r0, [ip, #0xc]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    bne .L_1fb4
    ldr r0, [ip, #0x8]
    cmp r5, r0
    bge .L_1fdc
.L_1fb4:
    cmp r1, #0xf
    cmpge r2, r4
    blt .L_1fdc
    cmp r1, #0xd4
    cmplt r2, lr
    bge .L_1fdc
    mov r0, #0x2
    stmia r3, {r0, r5}
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_1fdc:
    add r5, r5, #0x1
    cmp r5, #0x6
    add r4, r4, #0x13
    add lr, lr, #0x13
    blt .L_1f90
    mov r0, #0x0
    str r0, [r3]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov006_021cddfc
_LIT1: .word data_ov006_021cde2c
_LIT2: .word data_ov006_021cde14
