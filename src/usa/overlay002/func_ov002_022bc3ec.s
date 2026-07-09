; func_ov002_022bc3ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ccee4
        .extern data_ov002_022ccef8
        .extern data_ov002_022d0e4c
        .extern data_ov002_022d1a18
        .extern data_ov002_022d281c
        .extern func_020221e0
        .extern func_02036540
        .extern func_020371b8
        .extern func_02037d70
        .extern func_020a9698
        .extern func_ov002_022bc1a4
        .extern func_ov002_022bda78
        .extern func_ov002_022bde20
        .global func_ov002_022bc3ec
        .arm
func_ov002_022bc3ec:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0xc60]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_274
    b .L_2c
    b .L_4c
    b .L_194
    b .L_230
    b .L_250
.L_2c:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x4]
    str r1, [r4, #0xc48]
    mov r0, #0x1
    str r0, [r4, #0xc60]
    str r1, [r4, #0xc64]
    b .L_274
.L_4c:
    ldr r0, [r4, #0xc64]
    cmp r0, #0x1
    ldreq r0, [r4, #0xc5c]
    cmpeq r0, #0x0
    bne .L_74
    mov r0, #0x8f
    sub r1, r0, #0x90
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_74:
    ldr r0, [r4, #0xc64]
    cmp r0, #0x1e
    blt .L_274
    ldr r0, [r4, #0xc5c]
    cmp r0, #0x0
    moveq r5, #0x0
    beq .L_d0
    mov r2, #0x0
    ldr r0, _LIT1
    mov r3, r2
    str r2, [sp]
    mov r1, #0x3c
    bl func_ov002_022bda78
    ldr r5, [r4, #0xc5c]
    add r0, r4, #0x19c
    ldr r1, _LIT2
    mov r2, r5
    add r0, r0, #0x800
    bl func_020a9698
    add r0, r4, #0x1c4
    ldr r1, _LIT3
    add r0, r0, #0x800
    bl func_020a9698
.L_d0:
    mov r0, r5
    bl func_ov002_022bde20
    cmp r0, #0x0
    bne .L_e8
    mov r0, #0x0
    bl func_ov002_022bde20
.L_e8:
    ldrsh r1, [r0, #0x2]
    mov r0, #0x8
    str r1, [r4, #0xca4]
    bl func_020221e0
    ldr r0, [r4, #0xc4c]
    bl func_ov002_022bc1a4
    cmp r0, #0x0
    beq .L_14c
    mov r1, #0xf
    bl func_02036540
    ldr r0, [r4, #0xc50]
    cmp r0, #0x0
    bne .L_140
    ldr r0, [r4, #0xc5c]
    bl func_ov002_022bc1a4
    cmp r0, #0x0
    beq .L_140
    ldr r0, _LIT4
    mov r1, #0x0
    ldr r0, [r0, #0xd8]
    mov r2, #0xf
    bl func_02037d70
.L_140:
    mov r0, #0x0
    str r0, [r4, #0xc50]
    b .L_160
.L_14c:
    ldr r0, _LIT4
    mov r1, #0x0
    ldr r0, [r0, #0xd8]
    mov r2, #0xf
    bl func_02037d70
.L_160:
    ldr r0, [r4, #0xc5c]
    cmp r0, #0x0
    beq .L_180
    mov r0, #0x8f
    sub r1, r0, #0x90
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_180:
    mov r0, #0x2
    str r0, [r4, #0xc60]
    mov r0, #0x0
    str r0, [r4, #0xc64]
    b .L_274
.L_194:
    ldr r0, [r4, #0xc5c]
    cmp r0, #0x0
    moveq r5, #0x1e
    movne r5, #0x5a
    cmp r0, #0x0
    beq .L_1cc
    ldr r0, [r4, #0xc64]
    cmp r0, #0x2d
    bne .L_1cc
    mov r0, #0x90
    sub r1, r0, #0x91
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_1cc:
    ldr r0, [r4, #0xc64]
    cmp r0, r5
    blt .L_274
    ldr r0, [r4, #0xc5c]
    str r0, [r4, #0xc4c]
    bl func_ov002_022bc1a4
    cmp r0, #0x0
    beq .L_208
    mvn r1, #0x0
    mov r2, #0x1e
    mov r3, #0x1
    bl func_020371b8
    mov r0, #0xf0
    str r0, [r4, #0xc50]
    b .L_21c
.L_208:
    ldr r0, _LIT4
    mov r1, #0x7f
    ldr r0, [r0, #0xd8]
    mov r2, #0xf
    bl func_02037d70
.L_21c:
    mov r0, #0x3
    str r0, [r4, #0xc60]
    mov r0, #0x0
    str r0, [r4, #0xc64]
    b .L_274
.L_230:
    ldr r0, [r4, #0xc64]
    cmp r0, #0x1e
    blt .L_274
    mov r0, #0x4
    str r0, [r4, #0xc60]
    mov r0, #0x0
    str r0, [r4, #0xc64]
    b .L_274
.L_250:
    ldr r0, _LIT0
    mov r1, #0x1
    str r1, [r0, #0x4]
    str r1, [r4, #0xc48]
    mov r0, #0xc
    str r0, [r4, #0xcc8]
    mov r0, #0x0
    str r0, [r4, #0xc54]
    ldmia sp!, {r3, r4, r5, pc}
.L_274:
    ldr r1, [r4, #0xc64]
    mov r0, #0x1
    add r1, r1, #0x1
    str r1, [r4, #0xc64]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022d1a18
_LIT1: .word data_ov002_022d281c
_LIT2: .word data_ov002_022ccee4
_LIT3: .word data_ov002_022ccef8
_LIT4: .word data_ov002_022d0e4c
