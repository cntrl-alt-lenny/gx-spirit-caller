; func_ov002_022079e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021ca1d8
        .extern func_ov002_021ff1c8
        .extern func_ov002_02253600
        .global func_ov002_022079e8
        .arm
func_ov002_022079e8:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, #0x0
    mov r6, r0
    mov r4, r5
.L_2d0:
    mov r0, r6
    mov r1, r5
    bl func_ov002_021ff1c8
    cmp r0, #0x0
    beq .L_310
    mov r0, r5
    bl func_ov002_021ca1d8
    cmp r0, #0x0
    beq .L_310
    ldrh r1, [r6]
    mov r0, r5
    mov r2, r4
    bl func_ov002_02253600
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, pc}
.L_310:
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_2d0
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
