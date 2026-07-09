; func_ov002_022bc970 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ccb54
        .extern data_ov002_022ccee4
        .extern data_ov002_022d0e4c
        .extern data_ov002_022d1a18
        .extern data_ov002_022d281c
        .extern func_020371b8
        .extern func_02037d70
        .extern func_020a9698
        .extern func_ov002_022bda78
        .global func_ov002_022bc970
        .arm
func_ov002_022bc970:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x4
    mov r4, r0
    ldr r0, [r4, #0xc60]
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b .L_7c4
    b .L_5b8
    b .L_5d4
    b .L_680
    b .L_740
    b .L_780
    b .L_7a0
.L_5b8:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x4]
    mov r0, #0x1
    str r0, [r4, #0xc60]
    str r1, [r4, #0xc64]
    b .L_7c4
.L_5d4:
    ldr r0, [r4, #0xc64]
    cmp r0, #0x8
    bne .L_5f4
    ldr r0, _LIT1
    mov r1, #0x0
    ldr r0, [r0, #0xd8]
    mov r2, #0x1e
    bl func_02037d70
.L_5f4:
    ldr r0, [r4, #0xc64]
    cmp r0, #0x27
    bne .L_614
    mov r0, #0x2d
    sub r1, r0, #0x2e
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_614:
    ldr r0, [r4, #0xc64]
    cmp r0, #0x2d
    blt .L_7c4
    mov r2, #0x0
    ldr r0, _LIT2
    mov r3, r2
    mov r1, #0x15
    str r2, [sp]
    bl func_ov002_022bda78
    add r0, r4, #0x124
    ldr r6, _LIT3
    ldr r5, _LIT4
    add r8, r0, #0x800
    mov r7, #0x0
.L_64c:
    ldr r2, [r5, r7, lsl #0x2]
    mov r0, r8
    mov r1, r6
    bl func_020a9698
    add r7, r7, #0x1
    cmp r7, #0x5
    add r8, r8, #0x28
    blt .L_64c
    mov r0, #0x2
    str r0, [r4, #0xc60]
    mov r0, #0x0
    str r0, [r4, #0xc64]
    b .L_7c4
.L_680:
    ldr r0, [r4, #0xc64]
    ldr r5, _LIT2
    cmp r0, #0x37
    cmpne r0, #0x46
    cmpne r0, #0x55
    cmpne r0, #0x64
    cmpne r0, #0x73
    bne .L_6b4
    mov r0, #0x52
    sub r1, r0, #0x53
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_6b4:
    ldr r0, [r4, #0xc64]
    cmp r0, #0xbe
    bne .L_6d4
    mov r0, #0x50
    sub r1, r0, #0x51
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_6d4:
    mov r2, r5
    mov r1, #0x0
.L_6dc:
    ldr r0, [r2]
    cmp r0, #0x0
    beq .L_6f8
    ldr r0, [r2, #0x4]
    cmp r0, #0x15
    moveq r0, #0x1
    beq .L_70c
.L_6f8:
    add r1, r1, #0x1
    cmp r1, #0x10
    add r2, r2, #0x8
    blt .L_6dc
    mov r0, #0x0
.L_70c:
    cmp r0, #0x0
    bne .L_7c4
    mov r2, #0x0
    mov r0, r5
    mov r3, r2
    mov r1, #0x16
    str r2, [sp]
    bl func_ov002_022bda78
    mov r0, #0x3
    str r0, [r4, #0xc60]
    mov r0, #0x0
    str r0, [r4, #0xc64]
    b .L_7c4
.L_740:
    ldr r0, [r4, #0xc64]
    cmp r0, #0xe1
    bne .L_760
    mov r0, #0x51
    sub r1, r0, #0x52
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_760:
    ldr r0, [r4, #0xc64]
    cmp r0, #0x12c
    blt .L_7c4
    mov r0, #0x4
    str r0, [r4, #0xc60]
    mov r0, #0x0
    str r0, [r4, #0xc64]
    b .L_7c4
.L_780:
    ldr r0, [r4, #0xc64]
    cmp r0, #0xf
    blt .L_7c4
    mov r0, #0x5
    str r0, [r4, #0xc60]
    mov r0, #0x0
    str r0, [r4, #0xc64]
    b .L_7c4
.L_7a0:
    ldr r0, _LIT0
    mov r1, #0x1
    str r1, [r0, #0x4]
    mov r0, #0xc
    str r0, [r4, #0xcc8]
    mov r0, #0x0
    add sp, sp, #0x4
    str r0, [r4, #0xc54]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_7c4:
    ldr r1, [r4, #0xc64]
    mov r0, #0x1
    add r1, r1, #0x1
    str r1, [r4, #0xc64]
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022d1a18
_LIT1: .word data_ov002_022d0e4c
_LIT2: .word data_ov002_022d281c
_LIT3: .word data_ov002_022ccee4
_LIT4: .word data_ov002_022ccb54
