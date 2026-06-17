; func_ov002_02252734 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf17c
        .extern func_0202f578
        .extern func_ov002_02253458
        .global func_ov002_02252734
        .arm
func_ov002_02252734:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r7, r0
    ldr r0, _LIT0
    and r2, r7, #0x1
    mul r1, r2, r0
    ldr r0, _LIT1
    mov r4, #0x0
    ldr r0, [r0, r1]
    cmp r0, #0x0
    ldmlsia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, _LIT2
    mov r8, #0xd
    add r6, r0, r1
    add r5, r6, #0x260
.L_2c8:
    ldr r0, [r5]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202f578
    cmp r0, #0x0
    beq .L_2f0
    mov r0, r7
    mov r1, r8
    mov r2, r4
    bl func_ov002_02253458
.L_2f0:
    ldr r0, [r6, #0x10]
    add r4, r4, #0x1
    cmp r4, r0
    add r5, r5, #0x4
    bcc .L_2c8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf17c
_LIT2: .word data_ov002_022cf16c
