; func_0203cd38 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_0219d9b8
        .extern data_0219d9bc
        .extern data_0219d9c0
        .extern data_0219d9c4
        .extern data_0219d9c8
        .extern func_0203c968
        .extern func_0203cac0
        .extern func_020446f0
        .extern func_0207c280
        .global func_0203cd38
        .arm
func_0203cd38:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r2, [r4]
    mov r0, #0x1
    mov r1, #0x18
    blx r2
    mov r1, r0
    ldr r3, _LIT0
    mov r0, #0x0
    mov r2, #0x18
    str r1, [r3]
    bl Fill32
    ldr r0, _LIT0
    ldr r1, [r4]
    ldr r3, [r0]
    mov r2, #0x1
    str r1, [r3]
    ldr r0, [r4, #0x4]
    ldr r1, _LIT1
    str r0, [r3, #0x4]
    strb r2, [r3, #0x9]
    strb r2, [r3, #0x16]
    mov r0, #0x10
    strb r2, [r3, #0x8]
    bl func_0203cac0
    ldr r2, _LIT2
    mov r1, #0x2300
    str r0, [r2]
    mov r0, #0x2
    bl func_0203cac0
    ldr r2, _LIT3
    mov r1, #0x58
    str r0, [r2]
    mov r0, #0x4
    bl func_0203cac0
    ldr r2, _LIT4
    mov r1, #0xc
    str r0, [r2]
    mov r0, #0x8
    bl func_0203cac0
    ldr r2, _LIT5
    ldr r1, _LIT2
    str r0, [r2]
    ldr r1, [r1]
    mov r0, #0x0
    ldr r2, _LIT1
    bl Fill32
    mov r0, #0x0
    ldr r1, _LIT3
    mov r2, #0x2300
    ldr r1, [r1]
    bl Fill32
    mov r0, #0x0
    ldr r1, _LIT4
    mov r2, #0x58
    ldr r1, [r1]
    bl Fill32
    mov r0, #0x0
    ldr r1, _LIT5
    mov r2, #0xc
    ldr r1, [r1]
    bl Fill32
    ldr r0, _LIT2
    ldrb r1, [r4, #0x8]
    ldr r0, [r0]
    strb r1, [r0, #0xd0a]
    ldrb r2, [r0, #0xd0b]
    ldrb r1, [r4, #0x9]
    bic r2, r2, #0x3
    and r1, r1, #0x3
    orr r1, r2, r1
    strb r1, [r0, #0xd0b]
    ldr r1, _LIT5
    ldr r2, [r4]
    ldr r3, [r1]
    mov r1, #0x0
    str r2, [r3]
    ldr r2, [r4, #0x4]
    str r2, [r3, #0x4]
    str r1, [r3, #0x8]
    ldrb r2, [r0, #0xd0c]
    ldrb r1, [r4, #0xa]
    bic r2, r2, #0xf
    and r1, r1, #0xf
    orr r1, r2, r1
    strb r1, [r0, #0xd0c]
    ldrb r2, [r0, #0xd0c]
    ldrb r1, [r4, #0xb]
    bic r2, r2, #0x30
    and r1, r1, #0x3
    orr r1, r2, r1, lsl #0x4
    strb r1, [r0, #0xd0c]
    bl func_020446f0
    ldr r0, _LIT3
    mov r1, #0x2300
    ldr r0, [r0]
    bl func_0207c280
    cmp r0, #0x1
    beq .L_30c
    cmp r0, #0x4
    blt .L_318
.L_30c:
    bl func_0203c968
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_318:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_0219d9c8
_LIT1: .word 0x00000d18
_LIT2: .word data_0219d9b8
_LIT3: .word data_0219d9bc
_LIT4: .word data_0219d9c0
_LIT5: .word data_0219d9c4
