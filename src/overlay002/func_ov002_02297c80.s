; func_ov002_02297c80 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022c8ff0
        .extern data_ov002_022c9010
        .extern func_ov002_02297158
        .global func_ov002_02297c80
        .arm
func_ov002_02297c80:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r5, _LIT0
    mov r7, r0
    mov r6, r1
    mov r4, #0x0
.L_14:
    mov r0, r7
    mov r1, r5
    bl func_ov002_02297158
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    add r4, r4, #0x1
    cmp r4, #0x4
    add r5, r5, #0x8
    bcc .L_14
    cmp r6, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r4, _LIT1
    mov r5, #0x0
.L_50:
    mov r0, r7
    mov r1, r4
    bl func_ov002_02297158
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    add r5, r5, #0x1
    cmp r5, #0x5
    add r4, r4, #0x8
    bcc .L_50
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022c8ff0
_LIT1: .word data_ov002_022c9010
