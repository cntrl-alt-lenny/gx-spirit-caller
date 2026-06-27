; func_ov002_021c390c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern func_0202b824
        .global func_ov002_021c390c
        .arm
func_ov002_021c390c:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, _LIT0
    and r0, r0, #0x1
    mul r1, r0, r1
    ldr r0, _LIT1
    mov r4, #0x0
    ldr r0, [r0, r1]
    cmp r0, #0x0
    bls .L_708
    ldr r0, _LIT2
    add r6, r0, r1
    add r5, r6, #0x120
.L_6cc:
    ldr r0, [r5]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq .L_6f4
    bl func_0202b824
    cmp r0, #0x16
    moveq r0, r4
    ldmeqia sp!, {r4, r5, r6, pc}
.L_6f4:
    ldr r0, [r6, #0xc]
    add r4, r4, #0x1
    cmp r4, r0
    add r5, r5, #0x4
    bcc .L_6cc
.L_708:
    mvn r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf098
_LIT2: .word data_ov002_022cf08c
