; func_ov002_0226a284 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022d016c
        .extern data_ov002_022d0e6c
        .extern func_0202b100
        .extern func_ov002_021ae430
        .extern func_ov002_021f4260
        .global func_ov002_0226a284
        .arm
func_ov002_0226a284:
    stmdb sp!, {r4, lr}
    ldr r3, _LIT0
    mov r4, r0
    ldr r0, [r3, r4, lsl #0x2]
    cmp r0, #0x1
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
    ldr r0, _LIT1
    ldr r3, [r0, #0xd9c]
    cmp r3, #0x0
    bne .L_7f0
    ldr r3, _LIT2
    cmp r1, r3
    bgt .L_768
    bge .L_7a8
    sub r0, r3, #0x76
    cmp r1, r0
    bgt .L_740
    bge .L_7a8
    ldr r0, _LIT3
    cmp r1, r0
    beq .L_7a8
    b .L_7c0
.L_740:
    sub r0, r3, #0x4b
    cmp r1, r0
    bgt .L_7c0
    sub r0, r3, #0x4e
    cmp r1, r0
    blt .L_7c0
    subne r0, r3, #0x4b
    cmpne r1, r0
    beq .L_7a8
    b .L_7c0
.L_768:
    add r0, r3, #0xf5
    cmp r1, r0
    bgt .L_788
    bge .L_7a8
    add r0, r3, #0xbf
    cmp r1, r0
    beq .L_7a8
    b .L_7c0
.L_788:
    ldr r0, _LIT4
    cmp r1, r0
    bgt .L_79c
    beq .L_7a8
    b .L_7c0
.L_79c:
    add r0, r3, #0x4a0
    cmp r1, r0
    bne .L_7c0
.L_7a8:
    mov r0, r2
    bl func_0202b100
    mov r1, r0
    mov r0, r4
    bl func_ov002_021ae430
    b .L_7d8
.L_7c0:
    mov r0, r1
    mov r1, r2
    bl func_ov002_021f4260
    mov r1, r0
    mov r0, r4
    bl func_ov002_021ae430
.L_7d8:
    ldr r1, _LIT1
    mov r0, #0x0
    ldr r2, [r1, #0xd9c]
    add r2, r2, #0x1
    str r2, [r1, #0xd9c]
    ldmia sp!, {r4, pc}
.L_7f0:
    ldr r2, [r0, #0xd44]
    ldr r1, _LIT5
    mov r0, #0x1
    strh r2, [r1, #0xb0]
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022cd744
_LIT1: .word data_ov002_022d016c
_LIT2: .word 0x000015de
_LIT3: .word 0x00001368
_LIT4: .word 0x00001803
_LIT5: .word data_ov002_022d0e6c
