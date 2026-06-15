; func_02020398 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02191f40
        .extern func_0201f19c
        .global func_02020398
        .arm
func_02020398:
    stmdb sp!, {r3, lr}
    mov r1, r0
    ldrh r0, [r1, #0x2]
    cmp r0, #0x0
    beq .L_1c
    bl func_0201f19c
    ldmia sp!, {r3, pc}
.L_1c:
    ldr r0, _LIT0
    ldr r3, [r0, #0x1c]
    cmp r3, #0x0
    ldmeqia sp!, {r3, pc}
    ldrh r0, [r1, #0x4]
    cmp r0, #0x15
    bne .L_4c
    ldrh r0, [r1, #0x12]
    ldrh r2, [r1, #0x10]
    ldr r1, [r1, #0xc]
    blx r3
    ldmia sp!, {r3, pc}
.L_4c:
    cmp r0, #0x9
    ldmneia sp!, {r3, pc}
    ldrh r0, [r1, #0x12]
    mov r1, #0x0
    mov r2, r1
    blx r3
    ldmia sp!, {r3, pc}
_LIT0: .word data_02191f40
