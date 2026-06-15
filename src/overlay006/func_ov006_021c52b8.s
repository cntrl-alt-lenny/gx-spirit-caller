; func_ov006_021c52b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fdb90
        .extern data_020fdd80
        .extern data_ov006_0225dc14
        .extern func_020211c8
        .extern func_0202147c
        .extern func_ov006_021c5cc0
        .extern func_ov006_021c5d00
        .extern func_ov006_021c5f44
        .extern func_ov006_021c6454
        .extern func_ov006_021c669c
        .extern func_ov006_021c6798
        .extern func_ov006_021c6840
        .global func_ov006_021c52b8
        .arm
func_ov006_021c52b8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r2, #0x0
    str r2, [r4, #0x50]
    ldr r0, [r4, #0x54]
    cmp r0, #0x0
    beq .L_4c
    ldr r0, _LIT0
    ldr r1, [r0, #0xc]
    str r1, [r0, #0x6c]
    ldr r1, [r0, #0x10]
    str r1, [r0, #0x8c]
    ldr r1, [r0, #0x14]
    str r1, [r0, #0x90]
    ldr r1, [r0, #0x18]
    str r1, [r0, #0x94]
    ldr r1, [r0, #0x1c]
    str r1, [r0, #0x98]
    b .L_80
.L_4c:
    str r2, [r4, #0x4c]
    str r2, [r4, #0x6c]
    ldr r0, _LIT0
    str r2, [r4, #0x70]
    ldr r0, [r0, #0x24c]
    str r0, [r4, #0x74]
    ldr r1, [r4, #0x78]
    cmp r0, #0x6
    movgt r2, #0x1
    and r0, r2, #0x1
    bic r1, r1, #0x1
    orr r0, r1, r0
    str r0, [r4, #0x78]
.L_80:
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    bne .L_9c
    ldr r0, _LIT1
    bl func_020211c8
    str r0, [r4, #0x4]
    bl func_0202147c
.L_9c:
    ldr r0, [r4]
    cmp r0, #0x0
    bne .L_b8
    ldr r0, _LIT2
    bl func_020211c8
    str r0, [r4]
    bl func_0202147c
.L_b8:
    mov r0, r4
    bl func_ov006_021c5cc0
    mov r0, r4
    bl func_ov006_021c5d00
    mov r0, r4
    bl func_ov006_021c5f44
    mov r0, r4
    bl func_ov006_021c6454
    mov r0, r4
    bl func_ov006_021c669c
    mov r0, r4
    bl func_ov006_021c6798
    mov r0, r4
    bl func_ov006_021c6840
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov006_0225dc14
_LIT1: .word data_020fdb90
_LIT2: .word data_020fdd80
