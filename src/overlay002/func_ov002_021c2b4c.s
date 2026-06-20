; func_ov002_021c2b4c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf180
        .extern func_ov002_021b91c4
        .global func_ov002_021c2b4c
        .arm
func_ov002_021c2b4c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r2, _LIT0
    and r0, r0, #0x1
    mul r3, r0, r2
    ldr r2, _LIT1
    mov r4, r1
    ldr r0, [r2, r3]
    cmp r4, r0
    bcs .L_104
    sub r0, r0, #0x1
    str r0, [r2, r3]
    cmp r4, r0
    bcs .L_fc
    ldr r0, _LIT2
    add r7, r0, r3
    add r0, r7, #0x18
    add r5, r0, #0x400
    add r6, r5, r4, lsl #0x2
.L_d8:
    add r1, r4, #0x1
    mov r0, r6
    add r1, r5, r1, lsl #0x2
    bl func_ov002_021b91c4
    ldr r0, [r7, #0x14]
    add r4, r4, #0x1
    cmp r4, r0
    add r6, r6, #0x4
    bcc .L_d8
.L_fc:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_104:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf180
_LIT2: .word data_ov002_022cf16c
