; func_02053fc4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffb04
        .extern data_020ffb3c
        .extern func_020540d0
        .extern func_0205428c
        .extern func_020542b8
        .extern func_020a6d54
        .extern func_020a7388
        .global func_02053fc4
        .arm
func_02053fc4:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    movs r4, r2
    mov r6, r0
    mov r5, r1
    bmi .L_1e8
    ldr r0, [r6]
    cmp r4, r0
    ble .L_1fc
.L_1e8:
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0xa7
    bl func_020a6d54
.L_1fc:
    ldr r1, [r6]
    ldr r0, [r6, #0x4]
    cmp r1, r0
    bne .L_214
    mov r0, r6
    bl func_020542b8
.L_214:
    ldr r0, [r6]
    add r0, r0, #0x1
    str r0, [r6]
    ldr r0, [r6]
    sub r8, r0, #0x1
    cmp r4, r8
    bge .L_264
    mov r0, r6
    add r1, r4, #0x1
    bl func_020540d0
    mov r7, r0
    mov r0, r6
    mov r1, r4
    bl func_020540d0
    mov r1, r0
    ldr r3, [r6, #0x8]
    sub r0, r8, r4
    mul r2, r3, r0
    mov r0, r7
    bl func_020a7388
.L_264:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_0205428c
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_020ffb3c
_LIT1: .word data_020ffb04
