; func_0201f1a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02191e60
        .extern func_0201f0e4
        .extern func_0201f148
        .extern func_0201f208
        .extern func_0201f2a0
        .global func_0201f1a4
        .arm
func_0201f1a4:
    stmdb sp!, {r3, lr}
    ldrh r0, [r0, #0x2]
    cmp r0, #0x0
    beq .L_20
    bl func_0201f148
    mov r0, #0x9
    bl func_0201f0e4
    ldmia sp!, {r3, pc}
.L_20:
    ldr r0, _LIT0
    ldr r0, [r0, #0x24]
    cmp r0, #0x0
    beq .L_48
    bl func_0201f208
    cmp r0, #0x0
    ldmneia sp!, {r3, pc}
    mov r0, #0x9
    bl func_0201f0e4
    ldmia sp!, {r3, pc}
.L_48:
    bl func_0201f2a0
    cmp r0, #0x0
    ldmneia sp!, {r3, pc}
    mov r0, #0x9
    bl func_0201f0e4
    ldmia sp!, {r3, pc}
_LIT0: .word data_02191e60
