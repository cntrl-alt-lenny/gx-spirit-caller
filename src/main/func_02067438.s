; func_02067438 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101798
        .extern func_02055330
        .extern func_02066010
        .extern func_02066224
        .global func_02067438
        .arm
func_02067438:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    bl func_02055330
    ldr r2, [r5]
    mvn r1, #0x0
    cmp r2, r1
    mov r4, r0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, pc}
    ldr r2, [r5, #0xb8]
    cmp r2, #0x0
    ble .L_174
    ldr r1, [r5, #0xac]
    ldr r0, _LIT0
    sub r1, r4, r1
    cmp r1, r0
    bls .L_174
    cmp r2, #0x4
    blt .L_158
    mov r0, #0x0
    str r0, [r5, #0xb8]
    ldr r2, [r5, #0x10c]
    ldr r3, [r5, #0x9c]
    ldr r1, _LIT1
    mov r0, #0x5
    blx r3
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_158:
    mov r0, r5
    mov r1, #0x3
    bl func_02066010
    ldr r0, [r5, #0xb8]
    add r0, r0, #0x1
    str r0, [r5, #0xb8]
    b .L_1d4
.L_174:
    ldr r0, [r5, #0xb4]
    cmp r0, #0x0
    beq .L_1a4
    ldr r1, [r5, #0xac]
    ldr r0, _LIT0
    sub r1, r4, r1
    cmp r1, r0
    bls .L_1a4
    mov r0, r5
    mov r1, #0x1
    bl func_02066010
    b .L_1d4
.L_1a4:
    ldr r2, [r5, #0xac]
    ldr r0, _LIT2
    sub r1, r4, r2
    cmp r1, r0
    bhi .L_1c8
    cmp r2, #0x0
    beq .L_1c8
    cmp r4, r2
    bcs .L_1d4
.L_1c8:
    mov r0, r5
    mov r1, #0x0
    bl func_02066010
.L_1d4:
    ldr r1, [r5, #0xb0]
    ldr r0, _LIT3
    sub r1, r4, r1
    cmp r1, r0
    addls sp, sp, #0x4
    ldmlsia sp!, {r4, r5, pc}
    mov r0, r5
    bl func_02066224
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word 0x00002710
_LIT1: .word data_02101798
_LIT2: .word 0x0000ea60
_LIT3: .word 0x00004e20
