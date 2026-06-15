; func_020205ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c67dc
        .extern data_02191f40
        .extern func_0201f138
        .extern func_0201f19c
        .extern func_02020550
        .global func_020205ec
        .arm
func_020205ec:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    cmp r0, #0x0
    beq .L_180
    bl func_0201f19c
    mov r0, #0x9
    bl func_0201f138
    ldmia sp!, {r4, pc}
.L_180:
    ldr r0, _LIT0
    ldr r3, [r0, #0x38]
    cmp r3, #0x0
    beq .L_1a0
    ldrh r1, [r4, #0x8]
    ldrh r2, [r4, #0xa]
    ldr r0, _LIT1
    blx r3
.L_1a0:
    ldr r0, _LIT0
    ldrh r3, [r4, #0xa]
    ldrh r1, [r0, #0x8]
    ldrh ip, [r4, #0x8]
    cmp r1, r3
    bls .L_1d0
    sub r1, ip, #0x1
    mov r2, #0x1
    mov r1, r2, lsl r1
    strh r3, [r0, #0x8]
    strh r1, [r0, #0x6]
    b .L_1e8
.L_1d0:
    bne .L_1e8
    ldrh r3, [r0, #0x6]
    sub r1, ip, #0x1
    mov r2, #0x1
    orr r1, r3, r2, lsl r1
    strh r1, [r0, #0x6]
.L_1e8:
    add r0, ip, #0x1
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bl func_02020550
    cmp r0, #0x18
    bne .L_20c
    mov r0, #0x7
    bl func_0201f138
    ldmia sp!, {r4, pc}
.L_20c:
    cmp r0, #0x2
    ldmeqia sp!, {r4, pc}
    mov r0, #0x9
    bl func_0201f138
    ldmia sp!, {r4, pc}
_LIT0: .word data_02191f40
_LIT1: .word data_020c67dc
