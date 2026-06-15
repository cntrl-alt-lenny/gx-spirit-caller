; func_0201f6c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c6578
        .extern data_02191f40
        .extern data_021922e0
        .extern func_0201f19c
        .extern func_0201f724
        .extern func_02020b84
        .extern func_020a05f8
        .global func_0201f6c0
        .arm
func_0201f6c0:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    bl func_020a05f8
    cmp r0, #0x0
    beq .L_20
    bl func_0201f19c
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_20:
    bl func_0201f724
    cmp r0, #0x0
    bne .L_50
    ldr r0, _LIT1
    ldr r1, [r0, #0x38]
    cmp r1, #0x0
    beq .L_44
    ldr r0, _LIT2
    blx r1
.L_44:
    bl func_02020b84
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_50:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
_LIT0: .word data_021922e0
_LIT1: .word data_02191f40
_LIT2: .word data_020c6578
