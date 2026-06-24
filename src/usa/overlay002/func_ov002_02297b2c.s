; func_ov002_02297b2c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022c93f8
        .extern func_ov002_02297048
        .global func_ov002_02297b2c
        .arm
func_ov002_02297b2c:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r5, _LIT0
    mov r6, r0
    mov r4, #0x0
.L_ca8:
    mov r0, r6
    mov r1, r5
    bl func_ov002_02297048
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, pc}
    add r4, r4, #0x1
    cmp r4, #0xb9
    add r5, r5, #0x8
    bcc .L_ca8
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022c93f8
