; func_020152ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_02019034
        .extern func_020190c0
        .extern func_020190ec
        .extern func_020195ec
        .extern func_02019640
        .extern func_02019664
        .extern func_0201969c
        .extern func_0201abd4
        .extern func_0201b7b4
        .global func_020152ec
        .arm
func_020152ec:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl GetSystemWork
    mov r4, r0
    ldr r0, [r4, #0x8d8]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x920]
    cmp r0, #0x1
    beq .L_18c0
    cmp r0, #0x2
    beq .L_19bc
    ldmia sp!, {r3, r4, r5, pc}
.L_18c0:
    ldr r0, [r4, #0x924]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_18e4
    b .L_1978
    b .L_1920
    b .L_18ec
.L_18e4:
    mov r0, #0x4
    str r0, [r4, #0x924]
.L_18ec:
    bl func_02019664
    cmp r0, #0x65
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_0201969c
    cmp r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT0
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x8e0]
    ldmia sp!, {r3, r4, r5, pc}
.L_1920:
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020195ec
    cmp r0, #0x0
    bne .L_196c
    ldr r0, _LIT1
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    ldreq r0, [r4, #0x924]
    subeq r0, r0, #0x1
    streq r0, [r4, #0x924]
    bl func_0201b7b4
    mov r0, #0x1
    bl func_0201abd4
    ldmia sp!, {r3, r4, r5, pc}
.L_196c:
    ldr r0, _LIT2
    str r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_1978:
    ldr r0, _LIT3
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    bne .L_19a0
    mov r0, #0x1
    str r0, [r4, #0x920]
    mov r0, #0x5
    str r0, [r4, #0x924]
.L_19a0:
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, #0x0
    bl func_02019640
    ldmia sp!, {r3, r4, r5, pc}
.L_19bc:
    bl func_0201969c
    cmp r0, #0x4
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02019664
    cmp r0, #0x6a
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02019034
    ldr r1, [r4, #0x8dc]
    add r1, r1, #0x1
    cmp r0, r1
    ldmccia sp!, {r3, r4, r5, pc}
    bl func_020190c0
    cmp r0, #0x4
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_020190c0
    cmp r0, #0x5
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_020190ec
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT4
    str r0, [r5, #0x8]
    bl func_0201b7b4
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00100100
_LIT1: .word 0x00100104
_LIT2: .word 0x00100102
_LIT3: .word 0x00100103
_LIT4: .word 0x00100200
