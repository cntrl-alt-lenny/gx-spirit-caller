; func_0207108c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219eed4
        .extern data_021a63d0
        .global func_0207108c
        .arm
func_0207108c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r0, _LIT0
    ldr r6, [r0, #0x8]
    ldr r2, _LIT1
    mov r4, #0x400
    mov r3, #0x1
    mov r5, #0x0
    ldr r1, _LIT2
.L_70:
    ldrh ip, [r2]
    mov r0, r5
    add ip, ip, #0x1
    strh ip, [r2]
    ldrh ip, [r2]
    cmp ip, #0x400
    bcc .L_94
    cmp ip, r1
    bcc .L_98
.L_94:
    strh r4, [r2]
.L_98:
    mov r8, r6
    cmp r6, #0x0
    beq .L_dc
    ldrh r7, [r2]
.L_a8:
    ldr lr, [r8, #0xa4]
    cmp lr, #0x0
    beq .L_d0
    ldr ip, [lr]
    cmp ip, #0x0
    beq .L_d0
    ldrh ip, [lr, #0xa]
    cmp ip, r7
    moveq r0, r3
    beq .L_dc
.L_d0:
    ldr r8, [r8, #0x68]
    cmp r8, #0x0
    bne .L_a8
.L_dc:
    cmp r0, #0x0
    bne .L_70
    ldr r0, _LIT1
    ldrh r0, [r0]
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
_LIT0: .word data_021a63d0
_LIT1: .word data_0219eed4
_LIT2: .word 0x00001388
