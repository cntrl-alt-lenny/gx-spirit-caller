; func_ov002_0227e88c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cdc78
        .extern data_ov002_022cdc88
        .extern func_0202b9b0
        .extern func_ov002_0227e76c
        .extern func_ov002_02281994
        .global func_ov002_0227e88c
        .arm
func_ov002_0227e88c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r7, _LIT0
    mov r6, r0
    ldr r0, [r7, #0xc]
    mov r4, #0x0
    cmp r0, #0x0
    bls .L_11c
    ldr r5, _LIT1
.L_c4:
    mov r0, r4
    bl func_ov002_0227e76c
    cmp r0, #0x0
    bne .L_108
    ldr r1, [r5]
    mov r0, r6
    mov r1, r1, lsl #0x13
    mov r8, r1, lsr #0x13
    mov r1, r8
    bl func_ov002_02281994
    cmp r0, #0x0
    bne .L_108
    mov r0, r8
    bl func_0202b9b0
    cmp r0, #0x1
    movle r0, r4
    ldmleia sp!, {r4, r5, r6, r7, r8, pc}
.L_108:
    ldr r0, [r7, #0xc]
    add r4, r4, #0x1
    cmp r4, r0
    add r5, r5, #0x4
    bcc .L_c4
.L_11c:
    mvn r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022cdc78
_LIT1: .word data_ov002_022cdc88
