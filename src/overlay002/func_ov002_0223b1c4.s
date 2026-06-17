; func_ov002_0223b1c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d016c
        .extern func_ov002_021d93e0
        .extern func_ov002_0225764c
        .global func_ov002_0223b1c4
        .arm
func_ov002_0223b1c4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r8, #0xa
    ldr r6, _LIT0
    mov r5, r0
    mov r4, #0x0
    mov r7, #0x2
    mov r9, r8
.L_1c:
    ldr r1, [r6, #0xcec]
    mov r0, r5
    eor sl, r1, r4
    mov r1, sl
    mov r2, r9
    bl func_ov002_0225764c
    cmp r0, #0x0
    beq .L_4c
    mov r0, sl
    mov r1, r8
    mov r2, r7
    bl func_ov002_021d93e0
.L_4c:
    add r4, r4, #0x1
    cmp r4, #0x2
    blt .L_1c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022d016c
