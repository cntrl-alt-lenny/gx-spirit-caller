; func_0201d150 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020be71c
        .extern data_0218febc
        .extern data_0218ff8c
        .extern data_0219060c
        .extern func_0201c9b4
        .extern func_0201ca88
        .extern func_0201cfe0
        .extern func_0201f7f0
        .extern func_0201fb8c
        .extern func_0202046c
        .extern func_02020490
        .extern func_020206d8
        .extern func_02020914
        .extern func_02020a24
        .extern func_02020b84
        .extern func_02020ba0
        .extern func_02020c94
        .extern func_0209e124
        .global func_0201d150
        .arm
func_0201d150:
    stmdb sp!, {r4, lr}
    bl func_0202046c
    cmp r0, #0xa
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r4, pc}
    b .L_40
    b .L_68
    b .L_d8
    ldmia sp!, {r4, pc}
    b .L_144
    ldmia sp!, {r4, pc}
    ldmia sp!, {r4, pc}
    b .L_18c
    b .L_1ac
    b .L_1ac
    b .L_1ac
.L_40:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x8]
    bl func_0201ca88
    ldr r0, _LIT0
    ldr r1, [r0, #0x14]
    cmp r1, #0x1
    moveq r1, #0x1
    streq r1, [r0, #0x8]
    ldmia sp!, {r4, pc}
.L_68:
    bl func_0201ca88
    ldr r0, _LIT0
    ldr r1, [r0, #0x14]
    cmp r1, #0x5
    addls pc, pc, r1, lsl #0x2
    ldmia sp!, {r4, pc}
    b .L_98
    b .L_98
    ldmia sp!, {r4, pc}
    b .L_a0
    b .L_b4
    b .L_bc
.L_98:
    bl func_02020c94
    ldmia sp!, {r4, pc}
.L_a0:
    ldr r0, _LIT1
    ldr r1, _LIT2
    mov r2, #0x0
    bl func_0201f7f0
    ldmia sp!, {r4, pc}
.L_b4:
    bl func_02020490
    ldmia sp!, {r4, pc}
.L_bc:
    ldr r2, [r0, #0x18]
    ldr r1, _LIT3
    mov r0, #0xc0
    mla r1, r2, r0, r1
    mov r0, #0x1
    bl func_02020a24
    ldmia sp!, {r4, pc}
.L_d8:
    ldr r0, _LIT0
    mov r1, #0x3
    str r1, [r0, #0x8]
    ldr r1, _LIT4
    mov r2, #0x0
.L_ec:
    ldr r0, [r1, r2, lsl #0x2]
    cmp r0, #0x0
    subgt r0, r0, #0x1
    strgt r0, [r1, r2, lsl #0x2]
    add r2, r2, #0x1
    cmp r2, #0x20
    blt .L_ec
    ldr r0, _LIT0
    ldr r0, [r0, #0x14]
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r4, pc}
    b .L_134
    b .L_134
    ldmia sp!, {r4, pc}
    ldmia sp!, {r4, pc}
    b .L_13c
    b .L_13c
.L_134:
    bl func_02020ba0
    ldmia sp!, {r4, pc}
.L_13c:
    bl func_0201fb8c
    ldmia sp!, {r4, pc}
.L_144:
    bl func_0201cfe0
    cmp r0, #0x0
    movne r1, #0x4
    ldr r0, _LIT0
    moveq r1, #0x5
    str r1, [r0, #0x8]
    ldr r0, [r0, #0x14]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r4, pc}
    b .L_184
    b .L_184
    b .L_17c
    b .L_17c
.L_17c:
    bl func_02020b84
    ldmia sp!, {r4, pc}
.L_184:
    bl func_02020ba0
    ldmia sp!, {r4, pc}
.L_18c:
    bl func_020206d8
    mov r4, r0
    bl func_0209e124
    mov r1, r0
    mov r2, r4
    mov r0, #0x0
    bl func_02020914
    ldmia sp!, {r4, pc}
.L_1ac:
    ldr r0, _LIT0
    mov r1, #0x1
    str r1, [r0, #0x8]
    bl func_0201ca88
    ldr r0, _LIT0
    ldr r0, [r0, #0x14]
    cmp r0, #0x0
    beq .L_1e0
    cmp r0, #0x2
    cmpne r0, #0x3
    ldmneia sp!, {r4, pc}
    bl func_02020b84
    ldmia sp!, {r4, pc}
.L_1e0:
    bl func_02020ba0
    ldmia sp!, {r4, pc}
_LIT0: .word data_0218febc
_LIT1: .word func_0201c9b4
_LIT2: .word data_020be71c
_LIT3: .word data_0219060c
_LIT4: .word data_0218ff8c
