; func_ov002_021c194c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern func_ov002_021b8eec
        .extern func_ov002_021bcf50
        .extern func_ov002_021c1874
        .global func_ov002_021c194c
        .arm
func_ov002_021c194c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r2, _LIT0
    and ip, r5, #0x1
    mul r2, ip, r2
    ldr ip, _LIT1
    mov r4, r1
    mov r3, #0x14
    mul r3, r4, r3
    add ip, ip, r2
    add ip, ip, r3
    ldr ip, [ip, #0x30]
    mov ip, ip, lsl #0x13
    movs ip, ip, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr ip, _LIT2
    add r2, ip, r2
    ldrh r2, [r3, r2]
    cmp r2, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_ov002_021c1874
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_021b8eec
    cmp r0, #0x0
    beq .L_1770
    rsb r0, r5, #0x1
    bl func_ov002_021bcf50
    cmp r0, #0x0
    movlt r0, #0x0
    ldmltia sp!, {r3, r4, r5, pc}
.L_1770:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf0c4
