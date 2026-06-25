; func_020394ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b250
        .extern data_0219c3a0
        .extern data_0219c3b4
        .extern func_02038c34
        .extern func_02038e08
        .extern func_02038f60
        .extern func_0203a7fc
        .extern func_0207d044
        .extern func_02088f20
        .extern func_02088f3c
        .extern func_02088ffc
        .global func_020394ec
        .arm
func_020394ec:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x8
    ldr r3, _LIT0
    mov sl, r0
    ldrh r3, [r3, #0x4]
    mov r9, r1
    mov r8, r2
    cmp r3, #0x0
    beq .L_54c
    bl func_02088f3c
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_54c:
    tst r8, #0x400
    beq .L_568
    mov r7, #0x2
    tst r8, #0x200
    mvn r6, #0x0
    movne r7, #0x1
    b .L_570
.L_568:
    mov r7, #0x0
    mov r6, #0x1
.L_570:
    mov r0, sl
    bl func_0203a7fc
    movs r5, r0
    beq .L_590
    ldrb r0, [r5, #0x1c]
    add r0, r0, #0x1
    strb r0, [r5, #0x1c]
    b .L_644
.L_590:
    mov r0, sl
    bl func_02088ffc
    movs r4, r0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, _LIT1
    add r1, r4, #0x20
    ldr r0, [r0]
    mov r2, r6, lsl #0x5
    bl func_02038c34
    movs r5, r0
    addeq sp, sp, #0x8
    mov r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    str sl, [r5, #0x14]
    str r0, [r5, #0x8]
    mov r1, #0x1
    strb r1, [r5, #0x1c]
    str r0, [r5, #0x18]
    strb r7, [r5, #0x1f]
    strb r9, [r5, #0x1e]
    str r4, [r5, #0xc]
    mov r1, #0x2
    strb r1, [r5, #0x1d]
    tst r8, #0x8000
    beq .L_638
    str r0, [sp]
    mov r1, sl
    mov r3, r4
    add r2, r5, #0x20
    str r0, [sp, #0x4]
    bl func_02038e08
    cmp r4, r0
    addne sp, sp, #0x8
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    mov r2, #0x1
    mov r0, sl
    add r1, r5, #0x20
    strb r2, [r5, #0x1d]
    bl func_02088f20
.L_638:
    ldr r0, _LIT2
    mov r1, r5
    bl func_0207d044
.L_644:
    ldr r1, _LIT0
    mov r2, #0x81
    mov r0, r5
    strh r2, [r1]
    bl func_02038f60
    mov r0, r5
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_0219c3a0
_LIT1: .word data_0219b250
_LIT2: .word data_0219c3b4
