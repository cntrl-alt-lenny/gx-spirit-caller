; func_ov002_022bb8c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ccee4
        .extern data_ov002_022ccef8
        .extern data_ov002_022d1a18
        .extern data_ov002_022d281c
        .extern func_020371b8
        .extern func_020a9698
        .extern func_ov002_022bda78
        .global func_ov002_022bb8c8
        .arm
func_ov002_022bb8c8:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0xc60]
    cmp r0, #0x0
    beq .L_98c
    cmp r0, #0x1
    beq .L_9e4
    cmp r0, #0x2
    beq .L_a58
    b .L_a80
.L_98c:
    mov r2, #0x0
    ldr r0, _LIT0
    str r2, [sp]
    add r3, r4, #0xc80
    mov r1, #0x33
    bl func_ov002_022bda78
    add r0, r4, #0x124
    ldr r2, [r4, #0xc5c]
    ldr r1, _LIT1
    add r0, r0, #0x800
    bl func_020a9698
    add r0, r4, #0x14c
    ldr r1, _LIT2
    add r0, r0, #0x800
    bl func_020a9698
    ldr r0, _LIT3
    mov r1, #0x0
    str r1, [r0, #0x4]
    mov r0, #0x1
    str r0, [r4, #0xc60]
    str r1, [r4, #0xc64]
    b .L_a80
.L_9e4:
    ldr r0, [r4, #0xc64]
    ldr r5, _LIT0
    cmp r0, #0xf
    bne .L_a08
    mov r0, #0x34
    sub r1, r0, #0x35
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_a08:
    mov r1, #0x0
.L_a0c:
    ldr r0, [r5]
    cmp r0, #0x0
    beq .L_a28
    ldr r0, [r5, #0x4]
    cmp r0, #0x33
    moveq r0, #0x1
    beq .L_a3c
.L_a28:
    add r1, r1, #0x1
    cmp r1, #0x10
    add r5, r5, #0x8
    blt .L_a0c
    mov r0, #0x0
.L_a3c:
    cmp r0, #0x0
    bne .L_a80
    mov r0, #0x2
    str r0, [r4, #0xc60]
    mov r0, #0x0
    str r0, [r4, #0xc64]
    b .L_a80
.L_a58:
    ldr r0, _LIT3
    mov r1, #0x1
    str r1, [r0, #0x4]
    mov r0, #0xc
    str r0, [r4, #0xcc8]
    mov r0, #0x3
    str r0, [r4, #0xcd0]
    mov r0, #0x0
    str r0, [r4, #0xc54]
    ldmia sp!, {r3, r4, r5, pc}
.L_a80:
    ldr r1, [r4, #0xc64]
    mov r0, #0x1
    add r1, r1, #0x1
    str r1, [r4, #0xc64]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022d281c
_LIT1: .word data_ov002_022ccee4
_LIT2: .word data_ov002_022ccef8
_LIT3: .word data_ov002_022d1a18
