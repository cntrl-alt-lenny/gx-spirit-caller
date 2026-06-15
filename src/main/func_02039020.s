; func_02039020 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b330
        .extern data_0219c480
        .extern data_0219c494
        .extern func_02038c84
        .extern func_02038e58
        .extern func_0203a84c
        .extern func_0207d12c
        .extern func_02095de0
        .global func_02039020
        .arm
func_02039020:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x8
    mov r7, r3
    mov r8, r0
    mov r6, r2
    tst r7, #0x400
    beq .L_3b8
    mov r4, #0x2
    tst r7, #0x200
    mvn r5, #0x0
    movne r4, #0x1
    b .L_3c0
.L_3b8:
    mov r4, #0x0
    mov r5, #0x1
.L_3c0:
    orr r2, r1, r6, lsl #0x6
    mov r0, r8
    mov r1, r6
    orr sl, r2, #0x8d00000
    bl func_02095de0
    cmp r0, #0x0
    beq .L_3f0
    sub r9, r0, #0x20
    ldrb r0, [r9, #0x1c]
    add r0, r0, #0x1
    strb r0, [r9, #0x1c]
    b .L_4c4
.L_3f0:
    mov r0, sl
    bl func_0203a84c
    movs r9, r0
    beq .L_410
    ldrb r0, [r9, #0x1c]
    add r0, r0, #0x1
    strb r0, [r9, #0x1c]
    b .L_4c4
.L_410:
    ldr r2, [r8, #0x38]
    add r0, r2, r6
    add r1, r8, r0, lsl #0x2
    sub r0, r2, #0x1
    cmp r6, r0
    ldr r6, [r1, #0x3c]
    ldrcc r1, [r1, #0x40]
    ldr r0, _LIT0
    ldrcs r1, [r8, #0x8]
    ldr r0, [r0]
    sub r8, r1, r6
    add r1, r8, #0x20
    mov r2, r5, lsl #0x5
    bl func_02038c84
    movs r9, r0
    addeq sp, sp, #0x8
    mov r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    str sl, [r9, #0x14]
    str r0, [r9, #0x8]
    mov r1, #0x1
    strb r1, [r9, #0x1c]
    str r6, [r9, #0x18]
    strb r4, [r9, #0x1f]
    mov r1, #0x6
    strb r1, [r9, #0x1e]
    str r8, [r9, #0xc]
    mov r1, #0x2
    strb r1, [r9, #0x1d]
    tst r7, #0x8000
    beq .L_4b8
    mov r1, sl
    mov r3, r8
    add r2, r9, #0x20
    stmia sp, {r0, r6}
    bl func_02038e58
    cmp r8, r0
    addne sp, sp, #0x8
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    mov r0, #0x1
    strb r0, [r9, #0x1d]
.L_4b8:
    ldr r0, _LIT1
    mov r1, r9
    bl func_0207d12c
.L_4c4:
    ldr r1, _LIT2
    mov r2, #0x81
    mov r0, r9
    strh r2, [r1]
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_0219b330
_LIT1: .word data_0219c494
_LIT2: .word data_0219c480
