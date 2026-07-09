; func_ov002_022bcbdc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern data_ov002_022d1a18
        .extern data_ov002_022d281c
        .extern func_0202160c
        .extern func_0202165c
        .extern func_020371b8
        .extern func_ov002_022bda78
        .global func_ov002_022bcbdc
        .arm
func_ov002_022bcbdc:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0xc60]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_1030
    b .L_e90
    b .L_eac
    b .L_f0c
    b .L_ff0
    b .L_1010
.L_e90:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x4]
    mov r0, #0x1
    str r0, [r5, #0xc60]
    str r1, [r5, #0xc64]
    b .L_1030
.L_eac:
    ldr r0, [r5, #0xc64]
    cmp r0, #0x2d
    blt .L_1030
    ldr r1, _LIT1
    mov r3, #0x0
    ldr r1, [r1, #0x34]
    ldr r0, _LIT2
    str r3, [sp]
    cmp r1, #0x0
    moveq r1, #0x3d
    ldr r2, [r5, #0xc58]
    movne r1, #0x18
    bl func_ov002_022bda78
    mov r1, #0x6
    mov r2, #0x0
    bl func_0202160c
    ldr r2, [r5, #0xc58]
    mov r1, #0xd
    bl func_0202165c
    mov r0, #0x2
    str r0, [r5, #0xc60]
    mov r0, #0x0
    str r0, [r5, #0xc64]
    b .L_1030
.L_f0c:
    ldr r0, [r5, #0xc58]
    ldr r4, _LIT2
    cmp r0, #0x5
    ldr r0, [r5, #0xc64]
    bne .L_f70
    cmp r0, #0x9
    cmpne r0, #0x18
    cmpne r0, #0x27
    cmpne r0, #0x36
    cmpne r0, #0x45
    bne .L_f4c
    mov r0, #0x5b
    sub r1, r0, #0x5c
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_f4c:
    ldr r0, [r5, #0xc64]
    cmp r0, #0xb4
    bne .L_f8c
    mov r0, #0x5c
    sub r1, r0, #0x5d
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_f8c
.L_f70:
    cmp r0, #0x18
    bne .L_f8c
    mov r0, #0x60
    sub r1, r0, #0x61
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_f8c:
    ldr r0, _LIT1
    mov r1, #0x0
    ldr r0, [r0, #0x34]
    cmp r0, #0x0
    moveq r2, #0x3d
    movne r2, #0x18
.L_fa4:
    ldr r0, [r4]
    cmp r0, #0x0
    beq .L_fc0
    ldr r0, [r4, #0x4]
    cmp r0, r2
    moveq r0, #0x1
    beq .L_fd4
.L_fc0:
    add r1, r1, #0x1
    cmp r1, #0x10
    add r4, r4, #0x8
    blt .L_fa4
    mov r0, #0x0
.L_fd4:
    cmp r0, #0x0
    bne .L_1030
    mov r0, #0x3
    str r0, [r5, #0xc60]
    mov r0, #0x0
    str r0, [r5, #0xc64]
    b .L_1030
.L_ff0:
    ldr r0, [r5, #0xc64]
    cmp r0, #0xf
    blt .L_1030
    mov r0, #0x4
    str r0, [r5, #0xc60]
    mov r0, #0x0
    str r0, [r5, #0xc64]
    b .L_1030
.L_1010:
    ldr r0, _LIT0
    mov r1, #0x1
    str r1, [r0, #0x4]
    mov r0, #0xc
    str r0, [r5, #0xcc8]
    mov r0, #0x0
    str r0, [r5, #0xc54]
    ldmia sp!, {r3, r4, r5, pc}
.L_1030:
    ldr r1, [r5, #0xc64]
    mov r0, #0x1
    add r1, r1, #0x1
    str r1, [r5, #0xc64]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022d1a18
_LIT1: .word data_02103fcc
_LIT2: .word data_ov002_022d281c
