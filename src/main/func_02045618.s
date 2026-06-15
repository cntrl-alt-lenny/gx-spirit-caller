; func_02045618 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dad0
        .extern func_0203cb40
        .extern func_02091768
        .global func_02045618
        .arm
func_02045618:
    stmdb sp!, {r4, lr}
    ldr r0, _LIT0
    ldr r1, [r0]
    cmp r1, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r1, [r1, #0x4]
    cmp r1, #0x1
    moveq r1, #0x0
    streq r1, [r0]
    ldmeqia sp!, {r4, pc}
    bl func_0203cb40
    cmp r0, #0x0
    bne .L_c8
    mov r4, #0xa
.L_b4:
    mov r0, r4
    bl func_02091768
    bl func_0203cb40
    cmp r0, #0x0
    beq .L_b4
.L_c8:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0]
    ldmia sp!, {r4, pc}
_LIT0: .word data_0219dad0
