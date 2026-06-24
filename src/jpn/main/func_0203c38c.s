; func_0203c38c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b28c
        .extern data_0219d2a8
        .extern func_0203b7e0
        .extern func_02092660
        .extern func_020926d0
        .global func_0203c38c
        .arm
func_0203c38c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r0, _LIT0
    ldr r7, _LIT1
    bl func_020926d0
    mov r6, #0x0
    mov r4, r6
    mov r5, #0x10000
.L_28c:
    ldrh r0, [r7, #0xb0]
    tst r0, #0x8000
    beq .L_2ac
    mov r0, r7
    bl func_0203b7e0
    cmp r0, r5
    movlt r5, r0
    add r6, r6, #0x1
.L_2ac:
    add r4, r4, #0x1
    cmp r4, #0x8
    add r7, r7, #0xc4
    blt .L_28c
    ldr r0, _LIT0
    bl func_02092660
    cmp r6, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    cmp r5, #0x0
    movle r0, #0x4
    ldmleia sp!, {r3, r4, r5, r6, r7, pc}
    cmp r5, #0x4
    movgt r0, #0x1
    ldmgtia sp!, {r3, r4, r5, r6, r7, pc}
    cmp r5, #0x2
    movgt r0, #0x2
    movle r0, #0x3
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_0219b28c
_LIT1: .word data_0219d2a8
