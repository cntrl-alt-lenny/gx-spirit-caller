; func_02043280 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fe978
        .extern data_020fea2c
        .extern data_020feaa0
        .extern data_020feab0
        .extern data_0219d910
        .extern data_0219d91c
        .extern func_0204032c
        .extern func_0204185c
        .global func_02043280
        .arm
func_02043280:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    ldr r0, _LIT1
    ldr r1, [r1]
    ldr r0, [r0]
    add r1, r1, #0x1000
    cmp r0, #0x0
    ldr r4, [r1, #0x10c]
    beq .L_48
    bl func_0204185c
    ldr r1, _LIT1
    ldr r0, _LIT2
    ldr r1, [r1]
    mov r2, #0x0
    blx r4
    ldr r0, _LIT1
    mov r1, #0x0
    str r1, [r0]
.L_48:
    bl func_0204032c
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    add r0, r0, #0x1000
    ldr r1, [r0, #0x114]
    cmp r1, #0x0
    beq .L_8c
    ldr r0, _LIT3
    mov r2, #0x0
    blx r4
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0]
    add r0, r0, #0x1000
    str r1, [r0, #0x114]
.L_8c:
    ldr r0, _LIT0
    ldr r0, [r0]
    add r0, r0, #0x1000
    ldr r1, [r0, #0x118]
    cmp r1, #0x0
    beq .L_c4
    ldr r0, _LIT4
    mov r2, #0x0
    blx r4
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0]
    add r0, r0, #0x1000
    str r1, [r0, #0x118]
.L_c4:
    ldr r1, _LIT0
    ldr r0, _LIT5
    ldr r1, [r1]
    mov r2, #0x0
    blx r4
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0]
    ldmia sp!, {r4, pc}
_LIT0: .word data_0219d910
_LIT1: .word data_0219d91c
_LIT2: .word data_020feaa0
_LIT3: .word data_020fe978
_LIT4: .word data_020fea2c
_LIT5: .word data_020feab0
