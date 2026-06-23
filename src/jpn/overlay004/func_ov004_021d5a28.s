; func_ov004_021d5a28 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_02209c6c
        .extern func_02032638
        .extern func_020334ec
        .extern func_020334fc
        .extern func_ov004_021d3ae0
        .global func_ov004_021d5a28
        .arm
func_ov004_021d5a28:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r2, [r4, #0x30]
    ldr r1, _LIT0
    ldr r1, [r1, r2, lsl #0x2]
    blx r1
    ldr r0, [r4, #0x30]
    cmp r0, #0x27
    bge .L_350
    bl func_02032638
    cmp r0, #0x0
    beq .L_350
    bl func_02032638
    bl func_020334ec
    cmp r0, #0x0
    beq .L_350
    bl func_02032638
    bl func_020334fc
    cmp r0, #0x1
    bne .L_338
    mov r0, r4
    bl func_ov004_021d3ae0
    b .L_350
.L_338:
    mov r0, #0x27
    str r0, [r4, #0x30]
    mov r0, #0x1
    str r0, [r4, #0x38]
    mov r0, #0x0
    str r0, [r4, #0x3c]
.L_350:
    ldr r0, [r4, #0x3c]
    add r0, r0, #0x1
    str r0, [r4, #0x3c]
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov004_02209c6c
