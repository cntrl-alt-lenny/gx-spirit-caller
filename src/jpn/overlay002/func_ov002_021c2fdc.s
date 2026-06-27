; func_ov002_021c2fdc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0a8
        .extern func_ov002_021b90e4
        .global func_ov002_021c2fdc
        .arm
func_ov002_021c2fdc:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r2, _LIT0
    and r0, r0, #0x1
    mul r3, r0, r2
    ldr r2, _LIT1
    mov r7, r1
    ldr r0, [r2, r3]
    cmp r7, r0
    bcs .L_134
    sub r0, r0, #0x1
    str r0, [r2, r3]
    cmp r7, r0
    bcs .L_12c
    ldr r0, _LIT2
    add r6, r0, r3
    add r4, r6, #0x5d0
    add r5, r4, r7, lsl #0x2
.L_f8:
    add r1, r7, #0x1
    mov r0, r5
    add r1, r4, r1, lsl #0x2
    bl func_ov002_021b90e4
    add r0, r6, r7, lsl #0x1
    add r0, r0, #0x700
    ldrh r1, [r0, #0x8a]
    add r7, r7, #0x1
    add r5, r5, #0x4
    strh r1, [r0, #0x88]
    ldr r0, [r6, #0x1c]
    cmp r7, r0
    bcc .L_f8
.L_12c:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_134:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0a8
_LIT2: .word data_ov002_022cf08c
