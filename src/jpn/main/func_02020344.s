; func_02020344 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02191e60
        .extern func_0201f148
        .global func_02020344
        .arm
func_02020344:
    stmdb sp!, {r3, lr}
    mov r1, r0
    ldrh r0, [r1, #0x2]
    cmp r0, #0x0
    beq .L_108
    bl func_0201f148
    ldmia sp!, {r3, pc}
.L_108:
    ldr r0, _LIT0
    ldr r3, [r0, #0x1c]
    cmp r3, #0x0
    ldmeqia sp!, {r3, pc}
    ldrh r0, [r1, #0x4]
    cmp r0, #0x15
    bne .L_138
    ldrh r0, [r1, #0x12]
    ldrh r2, [r1, #0x10]
    ldr r1, [r1, #0xc]
    blx r3
    ldmia sp!, {r3, pc}
.L_138:
    cmp r0, #0x9
    ldmneia sp!, {r3, pc}
    ldrh r0, [r1, #0x12]
    mov r1, #0x0
    mov r2, r1
    blx r3
    ldmia sp!, {r3, pc}
_LIT0: .word data_02191e60
