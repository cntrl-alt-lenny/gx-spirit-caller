; func_ov002_0228d8dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern func_0202f994
        .global func_ov002_0228d8dc
        .arm
func_ov002_0228d8dc:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r2, _LIT0
    and r3, r0, #0x1
    mov r0, #0x14
    mul r6, r3, r2
    ldr r2, _LIT1
    mul r5, r1, r0
    add r0, r2, r6
    add r0, r0, r5
    ldr r0, [r0, #0x30]
    mov r4, #0x0
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202f994
    cmp r0, #0x0
    beq .L_e98
    ldr r0, _LIT2
    add r0, r0, r6
    ldrh r0, [r5, r0]
    cmp r0, #0x0
    moveq r4, #0x1
.L_e98:
    mov r0, r4
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf0c4
