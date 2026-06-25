; func_ov002_0225bc0c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern func_ov002_021bc7e8
        .global func_ov002_0225bc0c
        .arm
func_ov002_0225bc0c:
    stmdb sp!, {r3, r4, r5, lr}
    add r4, r1, r2
    mov r5, r0
    cmp r4, #0x4
    bgt .L_a08
    ldr r0, _LIT0
    mov r1, r5
    ldr r0, [r0]
    mov r2, r4
    bl func_ov002_021bc7e8
    cmp r0, #0x0
    beq .L_a08
    ldr r0, _LIT0
    ldr r1, [r0]
    cmp r5, r1
    ldreq r0, [r0, #0x1c]
    cmpeq r0, r4
    movne r0, #0x800
    ldmneia sp!, {r3, r4, r5, pc}
.L_a08:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cd314
