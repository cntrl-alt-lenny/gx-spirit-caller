; func_0202c028 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern data_020c6ae0
        .extern func_02006c0c
        .extern func_0202b0b4
        .global func_0202c028
        .arm
func_0202c028:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, _LIT0
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    mov r4, r0
    mov r0, r5
    bl func_0202b0b4
    mov r0, r0, lsl #0x1
    cmp r4, #0x0
    ldrh r5, [r4, r0]
    beq .L_3b4
    mov r0, r4
    bl Task_InvokeLocked
.L_3b4:
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_020c6ae0
