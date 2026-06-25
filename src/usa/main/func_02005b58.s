; func_02005b58 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103c8c
        .extern func_02005c84
        .extern func_0208fd08
        .extern func_0208fd70
        .extern func_02094398
        .global func_02005b58
        .arm
func_02005b58:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    cmp r5, #0x1
    beq .L_1c
    cmp r5, #0x2
    beq .L_28
    b .L_34
.L_1c:
    ldr r0, _LIT0
    ldr r4, [r0]
    b .L_38
.L_28:
    ldr r0, _LIT0
    ldr r4, [r0, #0x4]
    b .L_38
.L_34:
    mov r4, #0x0
.L_38:
    ldr r2, _LIT1
    mov r1, r4
    mov r0, #0x0
    bl func_02094398
    mov r0, r5
    bl func_02005c84
    str r5, [r4, #0xa44]
    cmp r5, #0x1
    beq .L_6c
    cmp r5, #0x2
    ldreq r0, _LIT2
    streq r0, [r4, #0xa48]
    ldmia sp!, {r3, r4, r5, pc}
.L_6c:
    ldr r0, _LIT3
    str r0, [r4, #0xa48]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_02103c8c
_LIT1: .word 0x00000a4c
_LIT2: .word func_0208fd08
_LIT3: .word func_0208fd70
