; func_02087a08 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a4cb4
        .extern func_0207cfdc
        .extern func_0208771c
        .extern func_02087790
        .extern func_02087824
        .extern func_02087eb0
        .global func_02087a08
        .arm
func_02087a08:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    ldr ip, _LIT0
    mov r3, #0x24
    mov r4, r0
    ldr r5, [r4]
    mla r6, r1, r3, ip
    mov r7, r2
    cmp r5, #0x0
    beq .L_2c
    bl func_02087eb0
.L_2c:
    ldrh r1, [r6, #0x8]
    ldr r0, [r6, #0x18]
    cmp r1, r0
    bcc .L_70
    mov r0, r6
    mov r1, #0x0
    bl func_0207cfdc
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    ldrb r1, [r0, #0x3d]
    cmp r7, r1
    addlt sp, sp, #0x4
    movlt r0, #0x0
    ldmltia sp!, {r4, r5, r6, r7, pc}
    bl func_02087790
.L_70:
    mov r0, r7
    bl func_0208771c
    movs r5, r0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    mov r0, r6
    mov r1, r5
    bl func_02087824
    str r4, [r5]
    mov r0, r5
    str r5, [r4]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_021a4cb4
