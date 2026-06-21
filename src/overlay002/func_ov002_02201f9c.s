; func_ov002_02201f9c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021eace4
        .extern func_ov002_02257878
        .global func_ov002_02201f9c
        .arm
func_ov002_02201f9c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, #0x0
    ldr ip, _LIT0
    ldr r2, _LIT1
    mov lr, r4
.L_14:
    and r3, r4, #0x1
    mla r1, r3, r2, ip
    mov r5, lr
    add r6, r1, #0x30
.L_24:
    ldr r3, [r6]
    mov r3, r3, lsl #0x13
    movs r3, r3, lsr #0x13
    beq .L_50
    ldrh r3, [r1, #0x38]
    cmp r3, #0x0
    bne .L_50
    ldrh r3, [r1, #0x36]
    cmp r3, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, pc}
.L_50:
    add r5, r5, #0x1
    cmp r5, #0x5
    add r6, r6, #0x14
    add r1, r1, #0x14
    blt .L_24
    add r4, r4, #0x1
    cmp r4, #0x2
    blt .L_14
    ldr r1, _LIT2
    bl func_ov002_02257878
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
_LIT2: .word func_ov002_021eace4
