; func_ov002_021c3bdc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern func_0202e234
        .global func_ov002_021c3bdc
        .arm
func_ov002_021c3bdc:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r1, _LIT0
    and r0, r0, #0x1
    mul r1, r0, r1
    ldr r0, _LIT1
    mov r4, #0x0
    ldr r0, [r0, r1]
    mov r5, r4
    cmp r0, #0x0
    bls .L_378
    ldr r0, _LIT2
    add r7, r0, r1
    add r6, r7, #0x120
.L_34c:
    ldr r0, [r6]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e234
    cmp r0, #0x0
    ldr r0, [r7, #0xc]
    add r4, r4, #0x1
    addne r5, r5, #0x1
    cmp r4, r0
    add r6, r6, #0x4
    bcc .L_34c
.L_378:
    mov r0, r5
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf178
_LIT2: .word data_ov002_022cf16c
