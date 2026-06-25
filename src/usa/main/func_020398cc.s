; func_020398cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b212
        .extern data_0219b220
        .extern data_0219b22c
        .extern data_0219c3a0
        .extern func_0203a0b4
        .extern func_020919a4
        .extern func_02091c10
        .global func_020398cc
        .arm
func_020398cc:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r4, _LIT0
    ldr r5, _LIT1
    ldr r7, _LIT2
    ldr r6, _LIT3
    mov r8, #0x0
.L_914:
    ldrh r0, [r7]
    tst r0, #0x4
    beq .L_92c
    bic r0, r0, #0x4
    strh r0, [r7]
    bl func_02091c10
.L_92c:
    bl func_0203a0b4
    and r1, r0, #0x1
    strh r1, [r6, #0x2]
    cmp r0, #0x0
    bne .L_914
    ldr r1, [r5]
    cmp r1, #0x0
    beq .L_954
    ldr r0, [r4]
    blx r1
.L_954:
    mov r0, r8
    bl func_020919a4
    b .L_914
_LIT0: .word data_0219b22c
_LIT1: .word data_0219b220
_LIT2: .word data_0219b212
_LIT3: .word data_0219c3a0
