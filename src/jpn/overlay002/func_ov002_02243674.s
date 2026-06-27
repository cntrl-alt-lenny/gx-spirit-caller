; func_ov002_02243674 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b939c
        .extern func_ov002_0223dd14
        .global func_ov002_02243674
        .arm
func_ov002_02243674:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x14]
    mov r0, r0, lsl #0x17
    mov r0, r0, lsr #0x17
    bl func_ov002_021b939c
    mov r3, r0
    mov r0, r3, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r0, r0, #0xff
    cmp r0, #0xe
    bne .L_50
    ldr r1, [r4, #0x14]
    mov r0, r4
    mov r2, r1, lsl #0x17
    and r1, r3, #0xff
    mov r3, r2, lsr #0x17
    mov r2, #0xe
    bl func_ov002_0223dd14
.L_50:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
