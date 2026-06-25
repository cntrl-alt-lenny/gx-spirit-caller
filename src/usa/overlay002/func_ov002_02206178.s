; func_ov002_02206178 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021bcf50
        .extern func_ov002_021ff2cc
        .extern func_ov002_022576f4
        .global func_ov002_02206178
        .arm
func_ov002_02206178:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r0, #0x1
    strh r0, [r5, #0xc]
    ldrh r0, [r5, #0x2]
    mov r4, r1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bcf50
    cmp r0, #0x0
    blt .L_40
    mov r0, r5
    bl func_ov002_022576f4
    cmp r0, #0x0
    movne r0, #0x2
    ldmneia sp!, {r3, r4, r5, pc}
.L_40:
    mov r2, #0x2
    mov r0, r5
    mov r1, r4
    strh r2, [r5, #0xc]
    bl func_ov002_021ff2cc
    cmp r0, #0x0
    beq .L_70
    mov r0, r5
    bl func_ov002_022576f4
    cmp r0, #0x0
    movne r0, #0x2
    ldmneia sp!, {r3, r4, r5, pc}
.L_70:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
