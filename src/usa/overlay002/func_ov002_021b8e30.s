; func_ov002_021b8e30 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b8eec
        .extern func_ov002_0223dda4
        .global func_ov002_021b8e30
        .arm
func_ov002_021b8e30:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r1, #0x0
    bl func_ov002_0223dda4
    mov r1, r0, lsl #0x10
    ldrh r2, [r4, #0x6]
    mov r3, r1, lsr #0x10
    and r0, r0, #0xff
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    cmp r1, #0x1
    mov r2, r3, asr #0x8
    and r1, r2, #0xff
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    cmp r1, #0x5
    blt .L_50
    cmp r1, #0xa
    movle r0, #0x1
    ldmleia sp!, {r4, pc}
.L_50:
    cmp r1, #0x5
    bge .L_68
    bl func_ov002_021b8eec
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
.L_68:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
