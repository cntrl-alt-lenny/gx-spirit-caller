; func_ov004_021d3e64 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_02291388
        .extern func_02032638
        .extern func_020337ac
        .global func_ov004_021d3e64
        .arm
func_ov004_021d3e64:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    bne .L_38
    bl func_02032638
    bl func_020337ac
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
.L_38:
    ldr r0, [r4, #0x258]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    bl func_02032638
    ldr r0, [r0, #0xeac]
    tst r0, #0x1000
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x1
    bne .L_b4
    bl func_02032638
    ldr r0, [r0, #0xeac]
    mov r1, #0x0
    tst r0, #0x2000
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x1
    bne .L_9c
    mov r0, #0x20
    str r0, [r4, #0x30]
    mov r0, #0x1
    str r0, [r4, #0x38]
    str r1, [r4, #0x3c]
    ldmia sp!, {r4, pc}
.L_9c:
    mov r0, #0x1f
    str r0, [r4, #0x30]
    mov r0, #0x1
    str r0, [r4, #0x38]
    str r1, [r4, #0x3c]
    ldmia sp!, {r4, pc}
.L_b4:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov004_02291388
