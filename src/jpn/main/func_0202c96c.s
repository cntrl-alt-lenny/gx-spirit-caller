; func_0202c96c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020b4634
        .extern data_020c6bc8
        .extern data_020c6be0
        .extern data_020c6bfc
        .extern data_0219ac68
        .extern func_02006bf0
        .extern func_02006e00
        .extern func_0201d428
        .extern func_0201d460
        .extern func_0201d4dc
        .extern func_0201e564
        .extern func_0202c6dc
        .extern func_0202c71c
        .extern func_0202c794
        .extern func_02034734
        .extern func_0208fe9c
        .extern func_0208ff04
        .extern func_02094410
        .global func_0202c96c
        .arm
func_0202c96c:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x50
    ldr r1, _LIT0
    str r0, [r1]
    ldr r0, [r1, #0x68]
    bl func_0202c6dc
    cmp r0, #0x0
    beq .L_6c
    ldr r1, _LIT1
    ldr r0, _LIT0
    ldr r1, [r1]
    ldr r0, [r0, #0x68]
    and r5, r1, #0x1f00
    bl func_0202c71c
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x6c]
    bl func_0202c71c
    ldr r1, _LIT1
    orr r2, r4, r0
    ldr r0, [r1]
    mvn r2, r2
    and r2, r2, r5, lsr #0x8
    bic r0, r0, #0x1f00
    orr r0, r0, r2, lsl #0x8
    str r0, [r1]
    b .L_b4
.L_6c:
    ldr r0, _LIT0
    mov r1, #0x4000000
    ldr r1, [r1]
    ldr r0, [r0, #0x68]
    and r5, r1, #0x1f00
    bl func_0202c71c
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x6c]
    bl func_0202c71c
    mov r1, #0x4000000
    orr r2, r4, r0
    ldr r0, [r1]
    mvn r2, r2
    and r2, r2, r5, lsr #0x8
    bic r0, r0, #0x1f00
    orr r0, r0, r2, lsl #0x8
    str r0, [r1]
.L_b4:
    ldr r0, _LIT0
    ldr r1, [r0]
    cmp r1, #0x0
    addeq sp, sp, #0x50
    ldmeqia sp!, {r3, r4, r5, pc}
    mvn r1, #0x0
    str r1, [r0, #0x1c]
    str r1, [r0, #0x20]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    mov r2, r1
    bl func_0202c794
    ldr r0, _LIT0
    ldr r0, [r0, #0x68]
    bl func_0201d4dc
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x20
    bl func_02094410
    ldr r0, _LIT0
    ldr r0, [r0, #0x68]
    bl func_0201d460
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x600
    bl func_02094410
    ldr r0, _LIT0
    mvn r1, #0x3
    ldr r0, [r0, #0x6c]
    mov r2, #0x0
    bl func_0202c794
    ldr r0, _LIT0
    ldr r0, [r0, #0x6c]
    bl func_0201d460
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x600
    bl func_02094410
    ldr r0, _LIT0
    ldr r0, [r0, #0x68]
    bl func_0202c6dc
    cmp r0, #0x0
    mov r1, #0x0
    mov r2, #0x20
    beq .L_184
    ldr r0, _LIT2
    bl func_0208fe9c
    mov r1, #0x20
    ldr r0, _LIT2
    mov r2, r1
    bl func_0208fe9c
    b .L_19c
.L_184:
    ldr r0, _LIT2
    bl func_0208ff04
    mov r1, #0x20
    ldr r0, _LIT2
    mov r2, r1
    bl func_0208ff04
.L_19c:
    ldr r0, _LIT3
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    mov r4, r0
    add r0, sp, #0x28
    bl func_0201d428
    ldrh ip, [sp, #0x3c]
    ldr r0, _LIT0
    str r4, [sp, #0x28]
    ldr r0, [r0, #0x68]
    mvn r3, #0x0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r2, #0x5200
    mov r1, #0x80
    bic ip, ip, #0xf
    and r0, r0, #0xf
    orr ip, ip, r0
    add r0, sp, #0x28
    strh ip, [sp, #0x3c]
    str r3, [sp, #0x30]
    str r2, [sp, #0x34]
    strh r1, [sp, #0x38]
    bl func_0201e564
    mov r0, r4
    bl func_02006e00
    bl func_02034734
    cmp r0, #0x0
    beq .L_28c
    bl func_02034734
    cmp r0, #0x2
    ldreq r0, _LIT4
    mov r1, #0x4
    ldrne r0, _LIT5
    mov r2, #0x0
    bl func_02006bf0
    mov r4, r0
    add r0, sp, #0x0
    bl func_0201d428
    ldrh ip, [sp, #0x14]
    ldr r0, _LIT0
    str r4, [sp]
    ldr r0, [r0, #0x68]
    mvn r3, #0x0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r2, #0x20
    mov r1, #0xa0
    bic ip, ip, #0xf
    and r0, r0, #0xf
    orr ip, ip, r0
    add r0, sp, #0x0
    strh ip, [sp, #0x14]
    str r3, [sp, #0x8]
    str r2, [sp, #0xc]
    strh r1, [sp, #0x10]
    bl func_0201e564
    mov r0, r4
    bl func_02006e00
.L_28c:
    ldr r0, _LIT0
    mvn r1, #0x0
    str r1, [r0, #0x4]
    cmp r1, #0x0
    movgt r1, #0x1
    ldr r0, _LIT0
    movle r1, #0x0
    str r1, [r0, #0x24]
    add sp, sp, #0x50
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_0219ac68
_LIT1: .word 0x04001000
_LIT2: .word data_020b4634
_LIT3: .word data_020c6bc8
_LIT4: .word data_020c6be0
_LIT5: .word data_020c6bfc
