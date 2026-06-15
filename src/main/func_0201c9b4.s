; func_0201c9b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0218ff8c
        .extern data_0219060c
        .extern func_0202048c
        .extern func_020a7440
        .global func_0201c9b4
        .arm
func_0201c9b4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    ldr r9, _LIT0
    ldr r8, _LIT1
    mov r6, r0
    mvn r4, #0x0
    mov r5, #0x0
    mov r7, #0xc
.L_1c:
    ldr r0, [r8, r5, lsl #0x2]
    cmp r0, #0x0
    bne .L_34
    cmp r4, #0x0
    movlt r4, r5
    b .L_7c
.L_34:
    mov r2, r7
    add r0, r9, #0x4
    add r1, r6, #0x4
    bl func_020a7440
    cmp r0, #0x0
    bne .L_7c
    ldr r1, _LIT0
    mov r0, #0xc0
    mla ip, r5, r0, r1
    mov r4, #0xc
.L_5c:
    ldmia r6!, {r0, r1, r2, r3}
    stmia ip!, {r0, r1, r2, r3}
    subs r4, r4, #0x1
    bne .L_5c
    ldr r0, _LIT1
    mov r1, #0x96
    str r1, [r0, r5, lsl #0x2]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_7c:
    add r5, r5, #0x1
    cmp r5, #0x20
    add r9, r9, #0xc0
    blt .L_1c
    cmp r4, #0x0
    ldmltia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r0, r6
    bl func_0202048c
    ldr r1, _LIT0
    mov r0, #0xc0
    mla ip, r4, r0, r1
    mov r5, #0xc
.L_ac:
    ldmia r6!, {r0, r1, r2, r3}
    stmia ip!, {r0, r1, r2, r3}
    subs r5, r5, #0x1
    bne .L_ac
    ldr r0, _LIT1
    mov r1, #0x96
    str r1, [r0, r4, lsl #0x2]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_0219060c
_LIT1: .word data_0218ff8c
