; func_0203953c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b330
        .extern data_0219c480
        .extern data_0219c494
        .extern func_02038c84
        .extern func_02038e58
        .extern func_02038fb0
        .extern func_0203a84c
        .extern func_0207d12c
        .extern func_02089008
        .extern func_02089024
        .extern func_020890e4
        .global func_0203953c
        .arm
func_0203953c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x8
    ldr r3, _LIT0
    mov sl, r0
    ldrh r3, [r3, #0x4]
    mov r9, r1
    mov r8, r2
    cmp r3, #0x0
    beq .L_8d4
    bl func_02089024
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_8d4:
    tst r8, #0x400
    beq .L_8f0
    mov r7, #0x2
    tst r8, #0x200
    mvn r6, #0x0
    movne r7, #0x1
    b .L_8f8
.L_8f0:
    mov r7, #0x0
    mov r6, #0x1
.L_8f8:
    mov r0, sl
    bl func_0203a84c
    movs r5, r0
    beq .L_918
    ldrb r0, [r5, #0x1c]
    add r0, r0, #0x1
    strb r0, [r5, #0x1c]
    b .L_9cc
.L_918:
    mov r0, sl
    bl func_020890e4
    movs r4, r0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, _LIT1
    add r1, r4, #0x20
    ldr r0, [r0]
    mov r2, r6, lsl #0x5
    bl func_02038c84
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
    beq .L_9c0
    str r0, [sp]
    mov r1, sl
    mov r3, r4
    add r2, r5, #0x20
    str r0, [sp, #0x4]
    bl func_02038e58
    cmp r4, r0
    addne sp, sp, #0x8
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    mov r2, #0x1
    mov r0, sl
    add r1, r5, #0x20
    strb r2, [r5, #0x1d]
    bl func_02089008
.L_9c0:
    ldr r0, _LIT2
    mov r1, r5
    bl func_0207d12c
.L_9cc:
    ldr r1, _LIT0
    mov r2, #0x81
    mov r0, r5
    strh r2, [r1]
    bl func_02038fb0
    mov r0, r5
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_0219c480
_LIT1: .word data_0219b330
_LIT2: .word data_0219c494
