; func_02052160 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219e3ec
        .extern func_02046870
        .extern func_020930b0
        .extern func_02094688
        .global func_02052160
        .arm
func_02052160:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r7, r1
    mov r6, r2
    bl func_02046870
    ldr r1, _LIT0
    mov r4, r0
    ldr r1, [r1]
    mov r0, #0x30
    mla r5, r4, r0, r1
    ldr r1, [r5, #0x4]
    cmp r1, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    ldr r0, [r5, #0x8]
    cmp r0, r6
    addlt sp, sp, #0x4
    ldmltia sp!, {r4, r5, r6, r7, pc}
    mov r0, r7
    mov r2, r6
    bl func_02094688
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r3, [r0, #0x604]
    cmp r3, #0x0
    beq .L_290
    ldr r1, [r5, #0x4]
    mov r0, r4
    mov r2, r6
    blx r3
.L_290:
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r0, [r0, #0x608]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    ldr r0, [r5, #0x2c]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    bl func_020930b0
    str r0, [r5, #0x24]
    str r1, [r5, #0x28]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_0219e3ec
