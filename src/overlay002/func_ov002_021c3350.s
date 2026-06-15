; func_ov002_021c3350 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf188
        .extern func_0202e234
        .global func_ov002_021c3350
        .arm
func_ov002_021c3350:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r1, _LIT0
    and r0, r0, #0x1
    mul r1, r0, r1
    ldr r0, _LIT1
    mov r5, #0x0
    ldr r0, [r0, r1]
    mov r4, r5
    cmp r0, #0x0
    bls .L_158c
    ldr r0, _LIT2
    add r7, r0, r1
    add r6, r7, #0x5d0
.L_1540:
    add r0, r7, r4, lsl #0x1
    add r0, r0, #0x700
    ldrh r0, [r0, #0x88]
    and r0, r0, #0xff
    cmp r0, #0x40
    beq .L_1560
    cmp r0, #0x80
    beq .L_1578
.L_1560:
    ldr r0, [r6]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e234
    cmp r0, #0x0
    addne r5, r5, #0x1
.L_1578:
    ldr r0, [r7, #0x1c]
    add r4, r4, #0x1
    cmp r4, r0
    add r6, r6, #0x4
    bcc .L_1540
.L_158c:
    mov r0, r5
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf188
_LIT2: .word data_ov002_022cf16c
