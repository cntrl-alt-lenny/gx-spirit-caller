; func_ov002_0226e9fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021bb068
        .extern func_ov002_021bbb1c
        .extern func_ov002_021bc68c
        .extern func_ov002_021c38c4
        .global func_ov002_0226e9fc
        .arm
func_ov002_0226e9fc:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, _LIT0
    mov r4, r1
    bl func_ov002_021bb068
    cmp r0, #0x0
    movgt r0, #0x0
    ldmgtia sp!, {r3, r4, r5, pc}
    mov r0, r5
    bl func_ov002_021bc68c
    cmp r0, #0x0
    beq .L_70
    mov r0, r5
    mov r1, r4
    bl func_ov002_021c38c4
    cmp r0, #0x5
    blt .L_70
    cmp r0, #0x7
    movge r2, #0x1
    movlt r2, #0x0
    ldr r1, _LIT1
    mov r0, r5
    add r2, r2, #0x1
    bl func_ov002_021bbb1c
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_70:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x000013f2
_LIT1: .word 0x000019b2
