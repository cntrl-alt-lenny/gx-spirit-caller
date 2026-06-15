; func_ov002_021ba38c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf17c
        .extern func_ov002_021b91c4
        .global func_ov002_021ba38c
        .arm
func_ov002_021ba38c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r3, _LIT0
    and r0, r0, #0x1
    mul r4, r0, r3
    ldr r0, _LIT1
    mov r6, r1
    ldr r0, [r0, r4]
    cmp r6, r0
    bcs .L_188
    ldr r1, _LIT2
    mov r0, r2
    add r1, r1, r4
    add r1, r1, #0x260
    add r5, r1, r6, lsl #0x2
    mov r1, r5
    bl func_ov002_021b91c4
    ldr r1, _LIT1
    ldr r0, [r1, r4]
    sub r0, r0, #0x1
    str r0, [r1, r4]
    cmp r6, r0
    bcs .L_180
    ldr r0, _LIT2
    add r7, r0, r4
    add r4, r7, #0x260
.L_15c:
    add r1, r6, #0x1
    mov r0, r5
    add r1, r4, r1, lsl #0x2
    bl func_ov002_021b91c4
    ldr r0, [r7, #0x10]
    add r6, r6, #0x1
    cmp r6, r0
    add r5, r5, #0x4
    bcc .L_15c
.L_180:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_188:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf17c
_LIT2: .word data_ov002_022cf16c
