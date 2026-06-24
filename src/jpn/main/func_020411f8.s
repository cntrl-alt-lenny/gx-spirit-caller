; func_020411f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fe7b4
        .extern data_020fe7bc
        .extern data_020fe7c8
        .extern data_020fe7cc
        .extern func_020aace8
        .extern func_020aadcc
        .extern func_020aafd0
        .extern func_020acd0c
        .global func_020411f8
        .arm
func_020411f8:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r1
    mov r5, r0
    mov r0, r6
    mov r4, #0x0
    bl func_020aace8
    cmp r0, #0x100
    movcs r0, r4
    ldmcsia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT0
    mov r1, r6
    add r0, r5, r0
    mov r2, #0x100
    bl func_020aadcc
    mov r0, r6
    bl func_020aace8
    ldr r1, _LIT0
    mov r6, r0
    add r0, r5, r1
    bl func_020aace8
    cmp r6, r0
    movne r0, r4
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT0
    ldr r1, _LIT1
    add r0, r5, r0
    bl func_020aafd0
    cmp r0, #0x0
    beq .L_9c
    ldr r0, _LIT2
    add r1, r5, #0x1000
    add r0, r5, r0
    str r0, [r1, #0x124]
    mov r0, r4
    str r0, [r1, #0x12c]
    add r0, r5, #0x1100
    mov r1, #0x50
    strh r1, [r0, #0x30]
    b .L_d8
.L_9c:
    ldr r0, _LIT0
    ldr r1, _LIT3
    add r0, r5, r0
    bl func_020aafd0
    cmp r0, #0x0
    moveq r0, r4
    ldmeqia sp!, {r4, r5, r6, pc}
    add r1, r0, #0x8
    add r0, r5, #0x1000
    str r1, [r0, #0x124]
    mov r2, #0x1
    ldr r1, _LIT4
    str r2, [r0, #0x12c]
    add r0, r5, #0x1100
    strh r1, [r0, #0x30]
.L_d8:
    add r0, r5, #0x1000
    ldr r0, [r0, #0x124]
    ldr r1, _LIT5
    bl func_020aafd0
    cmp r0, #0x0
    movne r1, #0x0
    strneb r1, [r0]
    addne r4, r0, #0x1
    add r0, r5, #0x1000
    ldr r0, [r0, #0x124]
    ldr r1, _LIT6
    bl func_020aafd0
    cmp r0, #0x0
    addeq r0, r5, #0x1000
    moveq r1, #0x0
    streq r1, [r0, #0x128]
    movne r1, #0x0
    strneb r1, [r0]
    addne r1, r0, #0x1
    addne r0, r5, #0x1000
    strne r1, [r0, #0x128]
    cmp r4, #0x0
    beq .L_144
    mov r0, r4
    bl func_020acd0c
    add r1, r5, #0x1100
    strh r0, [r1, #0x30]
.L_144:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00001024
_LIT1: .word data_020fe7b4
_LIT2: .word 0x0000102b
_LIT3: .word data_020fe7bc
_LIT4: .word 0x000001bb
_LIT5: .word data_020fe7c8
_LIT6: .word data_020fe7cc
