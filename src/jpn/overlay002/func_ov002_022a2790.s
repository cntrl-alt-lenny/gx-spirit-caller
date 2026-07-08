; func_ov002_022a2790 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d008c
        .extern func_ov002_021afa10
        .extern func_ov002_021afa84
        .extern func_ov002_021afe6c
        .extern func_ov002_0229f678
        .extern func_ov002_022abe4c
        .global func_ov002_022a2790
        .arm
func_ov002_022a2790:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x5
    beq .L_f1c
    cmp r1, #0x6
    cmpne r1, #0x9
    beq .L_f34
    b .L_f80
.L_f1c:
    ldr r2, [r4, #0x20]
    ldr r1, _LIT0
    add r2, r2, #0x1
    str r2, [r1, #0xd44]
    bl func_ov002_0229f678
    b .L_f90
.L_f34:
    ldr r0, [r4, #0x20]
    ldr r2, [r4, #0xc]
    add r0, r0, #0x1
    mov r1, #0x1
    orr r0, r2, r1, lsl r0
    str r0, [r4, #0xc]
    ldr r0, [r4, #0x4c]
    add r1, r0, #0x1
    str r1, [r4, #0x4c]
    ldr r0, [r4, #0x8]
    mov r0, r0, lsl #0x10
    cmp r1, r0, lsr #0x10
    blt .L_f90
    ldr r2, [r4, #0xc]
    ldr r1, _LIT0
    mov r0, r4
    str r2, [r1, #0xd44]
    bl func_ov002_0229f678
    b .L_f90
.L_f80:
    ldr r2, [r4, #0x20]
    ldr r1, _LIT0
    str r2, [r1, #0xd44]
    bl func_ov002_0229f678
.L_f90:
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    ldmgeia sp!, {r3, r4, r5, pc}
    rsb r0, r0, #0x0
    cmp r0, #0x5
    bgt .L_fb4
    mov r0, r4
    bl func_ov002_0229f678
    ldmia sp!, {r3, r4, r5, pc}
.L_fb4:
    cmp r0, #0x4b
    blt .L_fdc
    ldr r1, [r4, #0x20]
    mov r0, r4
    bl func_ov002_022abe4c
    ldr r1, _LIT0
    str r0, [r1, #0xd44]
    mov r0, r4
    bl func_ov002_0229f678
    ldmia sp!, {r3, r4, r5, pc}
.L_fdc:
    cmp r0, #0x48
    blt .L_ffc
    ldr r2, [r4, #0x4c]
    ldr r1, _LIT0
    mov r0, r4
    str r2, [r1, #0xd44]
    bl func_ov002_0229f678
    ldmia sp!, {r3, r4, r5, pc}
.L_ffc:
    cmp r0, #0x6
    ble .L_104c
    cmp r0, #0x49
    bge .L_104c
    bl func_ov002_021afa10
    cmp r0, #0x1
    bne .L_1034
    ldr r0, [r4, #0x4c]
    ldr r3, [r4, #0x68]
    ldr r2, [r4, #0x20]
    add r1, r0, #0x1
    ldr r0, [r3, r2, lsl #0x2]
    str r1, [r4, #0x4c]
    bl func_ov002_021afe6c
.L_1034:
    ldr r2, [r4, #0x4c]
    ldr r1, _LIT0
    mov r0, r4
    str r2, [r1, #0xd44]
    bl func_ov002_0229f678
    ldmia sp!, {r3, r4, r5, pc}
.L_104c:
    cmp r0, #0x6
    ldmltia sp!, {r3, r4, r5, pc}
    ldr r2, [r4, #0x68]
    ldr r0, [r4, #0x20]
    ldr r1, _LIT0
    ldr r5, [r2, r0, lsl #0x2]
    mov r2, #0x1
    mov r0, r5
    str r2, [r1, #0xd44]
    bl func_ov002_021afa84
    ldr r1, [r4, #0x4c]
    mov r0, r5
    add r1, r1, #0x1
    str r1, [r4, #0x4c]
    bl func_ov002_021afe6c
    mov r0, r4
    bl func_ov002_0229f678
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022d008c
