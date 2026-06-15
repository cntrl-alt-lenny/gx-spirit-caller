; func_ov002_021bc0d4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .global func_ov002_021bc0d4
        .arm
func_ov002_021bc0d4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    ldr r4, _LIT0
    ldr r3, _LIT1
    and r0, r0, #0x1
    mla ip, r0, r3, r4
    mov r0, #0x0
    mov r5, #0x1
    mov r7, r0
    add r3, ip, #0x30
    mov r6, r0
    mov lr, r5
.L_2c:
    ldr r4, [r3]
    mov r4, r4, lsl #0x13
    movs r4, r4, lsr #0x13
    beq .L_78
    mov r8, r6
    mov r9, r6
    cmp r1, #0x0
    beq .L_58
    ldrh r4, [ip, #0x38]
    cmp r4, #0x0
    beq .L_5c
.L_58:
    mov r8, r5
.L_5c:
    cmp r2, #0x0
    ldrneh r4, [ip, #0x36]
    cmpne r4, #0x0
    moveq r9, lr
    cmp r8, #0x0
    cmpne r9, #0x0
    addne r0, r0, #0x1
.L_78:
    add r7, r7, #0x1
    cmp r7, #0x5
    add r3, r3, #0x14
    add ip, ip, #0x14
    blt .L_2c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
