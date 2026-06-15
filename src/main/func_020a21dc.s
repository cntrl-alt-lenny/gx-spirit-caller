; func_020a21dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02093bfc
        .global func_020a21dc
        .arm
func_020a21dc:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    ldr r1, [r1]
    mov r7, r2
    mov r6, r3
    cmp r1, #0x0
    beq .L_3ac
    cmp r1, #0x1
    beq .L_410
    cmp r1, #0x2
    beq .L_4ec
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_3ac:
    ldr r2, [r0, #0x28]
    add r3, r0, #0x28
    cmp r2, #0x2000000
    bcc .L_400
    cmp r2, #0x22c0000
    bcs .L_400
    ldr r1, [r3, #0x4]
    add r0, r2, r1
    cmp r0, #0x22c0000
    bhi .L_400
    str r1, [r7, #0x8]
    ldr r0, [r3]
    add sp, sp, #0x4
    str r0, [r7, #0x4]
    ldr r0, [r7, #0x4]
    str r0, [r7]
    ldr r0, [r7, #0xc]
    bic r0, r0, #0x1
    str r0, [r7, #0xc]
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_400:
    bl func_02093bfc
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_410:
    add r4, r0, #0x38
    ldr r2, [r0, #0x38]
    ldr r1, [r4, #0x4]
    mov ip, #0x0
    mov r5, ip
    cmp r2, #0x2000000
    add r3, r2, r1
    bcc .L_460
    ldr r0, _LIT0
    cmp r2, r0
    bcs .L_460
    cmp r3, #0x2300000
    bls .L_48c
    cmp r3, r0
    bcs .L_458
    cmp r1, #0x40000
    movls r5, #0x1
    bls .L_48c
.L_458:
    mov ip, #0x1
    b .L_48c
.L_460:
    ldr r0, _LIT1
    cmp r2, r0
    bcc .L_488
    ldr r0, _LIT2
    cmp r2, r0
    bcs .L_488
    cmp r3, r0
    movls r5, #0x1
    movhi ip, #0x1
    b .L_48c
.L_488:
    mov ip, #0x1
.L_48c:
    cmp ip, #0x1
    bne .L_498
    bl func_02093bfc
.L_498:
    ldr r0, [r4, #0x4]
    cmp r5, #0x0
    str r0, [r7, #0x8]
    ldr r0, [r4]
    str r0, [r7, #0x4]
    ldreq r0, [r7, #0x4]
    streq r0, [r7]
    beq .L_4d0
    ldr r0, [r6]
    str r0, [r7]
    ldr r1, [r6]
    ldr r0, [r7, #0x8]
    add r0, r1, r0
    str r0, [r6]
.L_4d0:
    ldr r0, [r7, #0xc]
    add sp, sp, #0x4
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r7, #0xc]
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_4ec:
    mov r1, #0x160
    ldr r0, _LIT3
    str r1, [r7, #0x8]
    str r0, [r7, #0x4]
    ldr r0, [r7, #0x4]
    str r0, [r7]
    ldr r0, [r7, #0xc]
    bic r0, r0, #0x1
    str r0, [r7, #0xc]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
_LIT0: .word 0x023fe800
_LIT1: .word 0x037f8000
_LIT2: .word 0x0380f000
_LIT3: .word 0x027ffe00
