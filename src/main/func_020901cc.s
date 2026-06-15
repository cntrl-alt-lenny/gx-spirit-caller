; func_020901cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern data_0210249c
        .extern data_021a633c
        .extern data_021a634c
        .extern data_021a6350
        .extern func_02093e38
        .extern func_02094030
        .global func_020901cc
        .arm
func_020901cc:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    ldr r3, _LIT0
    mov r7, r0
    ldr r5, [r3]
    mov r6, r2
    cmp r5, #0x0
    ldreq r0, _LIT1
    ldreq r0, [r0]
    addeq r2, r0, r1
    beq .L_f40
    ldr r0, _LIT2
    add r2, r1, r6
    ldr r4, [r0]
    cmp r2, r4
    ldrcc r0, _LIT1
    ldrcc r0, [r0]
    addcc r2, r0, r1
    bcc .L_f40
    cmp r1, r4
    addcs r0, r5, r1
    subcs r2, r0, r4
    bcs .L_f40
    ldr r2, _LIT1
    ldr r0, _LIT3
    ldr r3, [r2]
    ldr r0, [r0]
    mvn r2, #0x0
    cmp r0, r2
    sub r4, r4, r1
    add r2, r3, r1
    beq .L_ed8
    cmp r4, #0x30
    bls .L_ed8
    mov r1, r7
    mov r3, r4
    bl func_02094030
    b .L_ee8
.L_ed8:
    mov r1, r2
    mov r0, r7
    mov r2, r4
    bl Copy32
.L_ee8:
    ldr r0, _LIT3
    mvn r1, #0x0
    ldr r0, [r0]
    cmp r0, r1
    beq .L_f24
    mov ip, #0x0
    str ip, [sp]
    mov r2, r5
    add r1, r7, r4
    sub r3, r6, r4
    str ip, [sp, #0x4]
    bl func_02093e38
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_f24:
    mov r1, r5
    add r0, r7, r4
    sub r2, r6, r4
    bl Copy32
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_f40:
    ldr r0, _LIT3
    mvn r1, #0x0
    ldr r0, [r0]
    cmp r0, r1
    beq .L_f78
    mov r4, #0x0
    str r4, [sp]
    mov r1, r7
    mov r3, r6
    str r4, [sp, #0x4]
    bl func_02093e38
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_f78:
    mov r1, r2
    mov r0, r7
    mov r2, r6
    bl Copy32
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
_LIT0: .word data_021a634c
_LIT1: .word data_021a633c
_LIT2: .word data_021a6350
_LIT3: .word data_0210249c
