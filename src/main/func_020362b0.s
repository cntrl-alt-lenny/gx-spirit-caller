; func_020362b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b2e0
        .extern data_0219b344
        .extern func_0203624c
        .extern func_02036c68
        .extern func_02036d7c
        .extern func_0203724c
        .extern func_02037328
        .extern func_02037780
        .extern func_020382d8
        .global func_020362b0
        .arm
func_020362b0:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
.L_8:
    mov r6, #0x0
    ldr r3, _LIT0
    ldr r0, _LIT1
    mov r5, r6
    mov r4, r6
    mov r7, r6
    mov lr, r6
.L_24:
    ldr ip, [r3, lr, lsl #0x2]
    cmp ip, #0x0
    beq .L_78
    ldrh r1, [ip, #0x68]
    tst r1, r0
    beq .L_6c
    tst r1, #0x2000
    movne r4, ip
    tst r1, #0x1000
    beq .L_78
    cmp r5, #0x0
    beq .L_64
    ldrsb r2, [ip, #0x6f]
    ldrsb r1, [r5, #0x6f]
    cmp r2, r1
    ble .L_78
.L_64:
    mov r5, ip
    b .L_78
.L_6c:
    tst r1, #0x200
    addeq r7, r7, #0x1
    movne r6, ip
.L_78:
    add lr, lr, #0x1
    cmp lr, #0x4
    blt .L_24
    cmp r7, #0x0
    addgt sp, sp, #0x8
    ldmgtia sp!, {r3, r4, r5, r6, r7, pc}
    cmp r4, #0x0
    beq .L_11c
    ldrb r7, [r4, #0x6c]
    ldr r3, [r4, #0x3c]
    ldrh r2, [r4, #0x1c]
    ldr r0, [r4, #0x34]
    orr r1, r7, #0x8000
    bic r3, r3, #0x6000
    bl func_02036d7c
    movs r5, r0
    beq .L_f8
    cmp r4, r5
    beq .L_d0
    mov r0, r4
    mov r1, #0x0
    bl func_0203624c
.L_d0:
    cmp r6, #0x0
    bne .L_e8
    ldr r0, _LIT2
    ldr r1, _LIT0
    strh r7, [r0, #0x4]
    str r5, [r1, r7, lsl #0x2]
.L_e8:
    bl func_0203724c
    bl func_02036c68
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_f8:
    mov r0, #0x0
    bl func_02037328
    cmp r0, #0x0
    addne sp, sp, #0x8
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r4
    mov r1, #0x0
    bl func_0203624c
    b .L_8
.L_11c:
    cmp r5, #0x0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldrb r2, [r5, #0x2f]
    mov r0, r5
    mov r1, #0x0
    str r2, [sp]
    ldrb r2, [r5, #0x2e]
    ldrb r3, [r5, #0x30]
    bl func_020382d8
    ldrh r0, [r5, #0x68]
    bic r0, r0, #0x1000
    strh r0, [r5, #0x68]
    bl func_0203724c
    ldrsh r0, [r5, #0x22]
    cmp r0, #0x0
    blt .L_1a8
    ldrb r1, [r5, #0x2f]
    mov r4, #0xa0
    ldr r2, _LIT3
    str r1, [sp]
    sub r1, r4, #0xa1
    mov r3, #0x0
    str r4, [sp, #0x4]
    bl func_02037780
    cmp r0, #0x0
    beq .L_1a0
    ldrh r1, [r5, #0x68]
    orr r1, r1, #0x100
    strh r1, [r5, #0x68]
    ldrh r1, [r0, #0x68]
    orr r1, r1, #0x200
    strh r1, [r0, #0x68]
.L_1a0:
    mvn r0, #0x0
    strh r0, [r5, #0x22]
.L_1a8:
    bl func_02036c68
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_0219b344
_LIT1: .word 0x00003003
_LIT2: .word data_0219b2e0
_LIT3: .word 0x00002601
