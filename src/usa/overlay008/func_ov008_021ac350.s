; func_ov008_021ac350 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov008_021b2ca0
        .extern func_ov008_021ac27c
        .global func_ov008_021ac350
        .arm
func_ov008_021ac350:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r0, _LIT0
    ldrh r0, [r0, #0x4]
    mov r0, r0, lsl #0x18
    movs r0, r0, lsr #0x18
    bne .L_1304
    mov r4, #0x0
.L_12e8:
    mov r0, r4
    mov r1, r4
    bl func_ov008_021ac27c
    add r4, r4, #0x1
    cmp r4, #0x7
    blt .L_12e8
    ldmia sp!, {r4, r5, r6, pc}
.L_1304:
    sub r0, r0, #0x1
    mov r0, r0, lsl #0x10
    mov r4, r0, lsr #0x10
    rsb r0, r4, #0x1a
    cmp r0, #0x8
    movgt r0, #0x8
    mov r0, r0, lsl #0x10
    mov r5, r0, lsr #0x10
    mov r6, #0x0
    cmp r5, #0x0
    ldmleia sp!, {r4, r5, r6, pc}
.L_1330:
    mov r1, r4, lsr #0x1f
    rsb r0, r1, r4, lsl #0x1d
    add r0, r1, r0, ror #0x1d
    mov r1, r0, lsl #0x10
    mov r0, r4
    mov r1, r1, lsr #0x10
    bl func_ov008_021ac27c
    add r0, r4, #0x1
    mov r0, r0, lsl #0x10
    add r6, r6, #0x1
    cmp r6, r5
    mov r4, r0, lsr #0x10
    blt .L_1330
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov008_021b2ca0
