; func_ov002_02264bfc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b3dec
        .extern func_ov002_021bbe70
        .extern func_ov002_021df5e4
        .extern func_ov002_021e267c
        .global func_ov002_02264bfc
        .arm
func_ov002_02264bfc:
    stmdb sp!, {r4, lr}
    ldr r2, _LIT0
    mov r1, #0xb
    mov r4, r0
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_1c4
    mov r0, r4
    bl func_ov002_021bbe70
    cmp r0, #0x0
    beq .L_1c4
    rsb r0, r4, #0x1
    bl func_ov002_021bbe70
    cmp r0, #0x0
    bne .L_1c4
    ldr r1, _LIT0
    mov r0, r4
    bl func_ov002_021df5e4
    ldr r1, _LIT0
    mov r0, r4
    mov r2, #0x5
    mov r3, #0x0
    bl func_ov002_021e267c
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_1c4:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word 0x0000151e
