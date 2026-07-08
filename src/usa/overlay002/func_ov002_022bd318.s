; func_ov002_022bd318 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d1a18
        .extern data_ov002_022d281c
        .extern func_020371b8
        .extern func_ov002_022bda78
        .global func_ov002_022bd318
        .arm
func_ov002_022bd318:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0xc60]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_160
    b .L_2c
    b .L_4c
    b .L_84
    b .L_11c
    b .L_13c
.L_2c:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x4]
    str r1, [r4, #0xc48]
    mov r0, #0x1
    str r0, [r4, #0xc60]
    str r1, [r4, #0xc64]
    b .L_160
.L_4c:
    ldr r0, [r4, #0xc64]
    cmp r0, #0xf
    blt .L_160
    mov r3, #0x0
    str r3, [sp]
    ldr r2, [r4, #0xc58]
    ldr r0, _LIT1
    mov r1, #0x7
    bl func_ov002_022bda78
    mov r0, #0x2
    str r0, [r4, #0xc60]
    mov r0, #0x0
    str r0, [r4, #0xc64]
    b .L_160
.L_84:
    ldr r0, [r4, #0xc64]
    ldr r5, _LIT1
    cmp r0, #0x4b
    cmpne r0, #0x5a
    bne .L_b0
    mov r0, #0x3b
    sub r1, r0, #0x3c
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_cc
.L_b0:
    cmp r0, #0x9b
    bne .L_cc
    mov r0, #0x4a
    sub r1, r0, #0x4b
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_cc:
    mov r1, #0x0
.L_d0:
    ldr r0, [r5]
    cmp r0, #0x0
    beq .L_ec
    ldr r0, [r5, #0x4]
    cmp r0, #0x7
    moveq r0, #0x1
    beq .L_100
.L_ec:
    add r1, r1, #0x1
    cmp r1, #0x10
    add r5, r5, #0x8
    blt .L_d0
    mov r0, #0x0
.L_100:
    cmp r0, #0x0
    bne .L_160
    mov r0, #0x3
    str r0, [r4, #0xc60]
    mov r0, #0x0
    str r0, [r4, #0xc64]
    b .L_160
.L_11c:
    ldr r0, [r4, #0xc64]
    cmp r0, #0xf
    blt .L_160
    mov r0, #0x4
    str r0, [r4, #0xc60]
    mov r0, #0x0
    str r0, [r4, #0xc64]
    b .L_160
.L_13c:
    ldr r0, _LIT0
    mov r1, #0x1
    str r1, [r0, #0x4]
    str r1, [r4, #0xc48]
    mov r0, #0xc
    str r0, [r4, #0xcc8]
    mov r0, #0x0
    str r0, [r4, #0xc54]
    ldmia sp!, {r3, r4, r5, pc}
.L_160:
    ldr r1, [r4, #0xc64]
    mov r0, #0x1
    add r1, r1, #0x1
    str r1, [r4, #0xc64]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022d1a18
_LIT1: .word data_ov002_022d281c
