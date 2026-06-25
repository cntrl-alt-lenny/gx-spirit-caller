; func_0203a0b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219c3a0
        .extern func_02039cd8
        .extern func_0203b8ac
        .extern func_0203c38c
        .global func_0203a0b4
        .arm
func_0203a0b4:
    stmdb sp!, {r4, lr}
    ldr r0, _LIT0
    mov r4, #0x0
    ldrh r1, [r0]
    ldrh r0, [r0, #0x2]
    orrs r0, r1, r0
    beq .L_1350
    bl func_02039cd8
    cmp r0, #0x1
    moveq r4, #0x1
.L_1350:
    bl func_0203c38c
    cmp r0, #0x3
    blt .L_1368
    mov r0, r4
    bl func_0203b8ac
    orr r4, r4, #0x80
.L_1368:
    mov r0, r4
    ldmia sp!, {r4, pc}
_LIT0: .word data_0219c3a0
