; func_02053a40 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02054b98
        .extern func_0206eb74
        .global func_02053a40
        .arm
func_02053a40:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r3, r1, asr #0x8
    mov r1, r1, lsl #0x8
    mov r4, r2
    mov ip, #0x2
    and r2, r3, #0xff
    and r1, r1, #0xff00
    strb ip, [r4, #0x1]
    orr r1, r2, r1
    strh r1, [r4, #0x2]
    mov r5, r0
    bl func_02054b98
    str r0, [r4, #0x4]
    ldr r1, [r4, #0x4]
    mvn r0, #0x0
    cmp r1, r0
    bne .L_78
    mov r0, r5
    bl func_0206eb74
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, pc}
    ldr r0, [r0, #0xc]
    ldr r0, [r0]
    ldr r0, [r0]
    str r0, [r4, #0x4]
.L_78:
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
