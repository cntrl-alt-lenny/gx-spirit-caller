; func_ov002_0228dbe4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_0202eab0
        .extern func_0202f620
        .extern func_ov002_021ba294
        .extern func_ov002_021c3b60
        .global func_ov002_0228dbe4
        .arm
func_ov002_0228dbe4:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldr r0, _LIT0
    ldr r2, _LIT1
    and r3, r4, #0x1
    mla r2, r3, r0, r2
    mov r0, #0x14
    mla r0, r1, r0, r2
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    mov r5, r0, lsr #0x13
    mov r0, r5
    bl func_0202eab0
    cmp r0, #0x0
    beq .L_98
    add r1, sp, #0x0
    mov r0, r5
    bl func_0202f620
    add r1, sp, #0x0
    sub r6, r0, #0x1
    ldr r1, [r1, r6, lsl #0x2]
    cmp r5, r1
    bge .L_98
    mov r0, r4
    bl func_ov002_021c3b60
    cmp r0, #0x0
    bge .L_88
    add r1, sp, #0x0
    ldr r1, [r1, r6, lsl #0x2]
    mov r0, r4
    bl func_ov002_021ba294
    cmp r0, #0x0
    blt .L_98
.L_88:
    add r0, sp, #0x0
    add sp, sp, #0x8
    ldr r0, [r0, r6, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_98:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
