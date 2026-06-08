; func_ov002_021de4d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021c2084
        .extern func_ov002_021de408
        .global func_ov002_021de4d8
        .arm
func_ov002_021de4d8:
    stmdb sp!, {r4, r5, r6, lr}
    mov r3, #0x1
    mov r6, r0
    mov r5, r1
    mov r4, r2
    bl func_ov002_021c2084
    cmp r0, #0x0
    beq .L_48
    add r0, r4, r5, lsl #0x4
    mov r1, #0x1
    mov r4, r1, lsl r0
    mov r0, r6
    mov r1, r4
    bl func_ov002_021de408
    tst r4, r0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_48:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
