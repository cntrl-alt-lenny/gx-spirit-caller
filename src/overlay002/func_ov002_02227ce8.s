; func_ov002_02227ce8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d016c
        .extern func_ov002_021d91e0
        .extern func_ov002_0225764c
        .global func_ov002_02227ce8
        .arm
func_ov002_02227ce8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r5, #0x0
    ldr r7, _LIT0
    mov r6, r0
    mov r8, #0x1
    mov r9, r5
.L_c48:
    ldr r0, [r7, #0xcec]
    mov r4, r9
    eor sl, r0, r5
.L_c54:
    mov r0, r6
    mov r1, sl
    mov r2, r4
    bl func_ov002_0225764c
    cmp r0, #0x0
    beq .L_c7c
    mov r0, sl
    mov r1, r4
    mov r2, r8
    bl func_ov002_021d91e0
.L_c7c:
    add r4, r4, #0x1
    cmp r4, #0xa
    ble .L_c54
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_c48
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022d016c
