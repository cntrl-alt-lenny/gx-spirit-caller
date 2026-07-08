; func_ov002_02244efc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern data_ov002_022ce783
        .extern data_ov002_022ce7a0
        .extern data_ov002_022d008c
        .extern func_ov002_021b1490
        .global func_ov002_02244efc
        .arm
func_ov002_02244efc:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x8
    ldr r2, _LIT0
    ldr r3, [r2, #0xd0c]
    cmp r3, #0x0
    beq .L_58
    ldr r3, [r2, #0xcec]
    ldr r2, _LIT1
    ldr r2, [r2, r3, lsl #0x2]
    cmp r2, #0x2
    bne .L_58
    strh r0, [sp]
    mov ip, r1, lsr #0x10
    mov r0, #0x9
    strh r1, [sp, #0x2]
    add r2, sp, #0x0
    sub r1, r0, #0xa
    mov r3, #0x6
    strh ip, [sp, #0x4]
    bl func_ov002_021b1490
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
.L_58:
    ldr r2, _LIT2
    ldr r3, [r2, #0x5d8]
    cmp r3, #0x0
    addne sp, sp, #0x8
    ldmneia sp!, {r3, pc}
    ldr r3, [r2, #0x5cc]
    cmp r3, #0x0
    beq .L_a8
    ldr r2, [r2, #0x5d4]
    ldr r3, _LIT3
    add ip, r2, #0x1
    cmp ip, #0x20
    ldr r2, _LIT2
    movhi ip, #0x20
    str ip, [r2, #0x5d4]
    strb r0, [r3, ip]
    ldr r3, [r2, #0x5d4]
    ldr r2, _LIT4
    str r1, [r2, r3, lsl #0x2]
    b .L_c4
.L_a8:
    mov r3, #0x1
    str r3, [r2, #0x5d4]
    ldr r3, [r2, #0x5d0]
    add r3, r3, #0x1
    str r3, [r2, #0x5d0]
    strb r0, [r2, #0x5dc]
    str r1, [r2, #0x5fc]
.L_c4:
    ldr r2, _LIT0
    cmp r0, #0x3
    ldr ip, [r2, #0xcec]
    ldr r1, _LIT2
    mov r3, #0x0
    str ip, [r1, #0x684]
    cmpne r0, #0x4
    cmpne r0, #0x17
    str r3, [r1, #0x680]
    mov r2, #0x1
    str r2, [r1, #0x688]
    str r3, [r1, #0x68c]
    ldreq r0, _LIT2
    rsbeq r1, ip, #0x1
    streq r1, [r0, #0x684]
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word data_ov002_022cd664
_LIT2: .word data_ov002_022ce1a8
_LIT3: .word data_ov002_022ce783
_LIT4: .word data_ov002_022ce7a0
