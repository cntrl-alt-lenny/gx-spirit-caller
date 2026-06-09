; func_ov002_0228de58 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021c84e0
        .extern func_ov002_022536e8
        .extern func_ov002_0228dc90
        .global func_ov002_0228de58
        .arm
func_ov002_0228de58:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    bl func_ov002_021c84e0
    mov r4, r0
    ldr r1, _LIT0
    mov r0, r6
    mov r2, r4
    bl func_ov002_022536e8
    cmp r0, #0x0
    beq .L_48
    mov r0, r6
    mov r1, r5
    bl func_ov002_0228dc90
    cmp r0, #0x0
    movne r4, #0x64
    mov r0, r4
    ldmia sp!, {r4, r5, r6, pc}
.L_48:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00001a98
