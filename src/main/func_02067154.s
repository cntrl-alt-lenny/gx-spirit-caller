; func_02067154 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101784
        .extern func_02054c0c
        .extern func_0206ebe8
        .extern func_020aaf40
        .global func_02067154
        .arm
func_02067154:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r4, r1, asr #0x8
    mov r1, r1, lsl #0x8
    mov r6, r2
    mov r5, #0x2
    and r2, r4, #0xff
    and r1, r1, #0xff00
    strb r5, [r6, #0x1]
    orr r1, r2, r1
    strh r1, [r6, #0x2]
    mov r4, #0x0
    movs r7, r0
    mov r5, r3
    streq r4, [r6, #0x4]
    beq .L_50
    bl func_02054c0c
    str r0, [r6, #0x4]
.L_50:
    ldr r1, [r6, #0x4]
    mvn r0, #0x0
    cmp r1, r0
    bne .L_9c
    ldr r1, _LIT0
    mov r0, r7
    bl func_020aaf40
    cmp r0, #0x0
    beq .L_9c
    mov r0, r7
    bl func_0206ebe8
    movs r4, r0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    ldr r0, [r4, #0xc]
    ldr r0, [r0]
    ldr r0, [r0]
    str r0, [r6, #0x4]
.L_9c:
    cmp r5, #0x0
    strne r4, [r5]
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_02101784
