; func_0206c140 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ec08
        .extern func_0206c09c
        .extern func_0206c114
        .global func_0206c140
        .arm
func_0206c140:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r6, r1
    ldrsb r1, [r6]
    mov r7, r0
    add r4, r7, #0x80
    strb r1, [r7, #0x73]
    ldrsb r0, [r6, #0x1]
    strb r0, [r7, #0x72]
    ldrh r0, [r6, #0x2]
    cmp r0, #0x0
    beq .L_88
    str r4, [r7, #0x64]
    ldrh r2, [r6, #0x4]
    mov r1, r4
    add r0, r4, #0x114
    strh r2, [r4, #0xfc]
    add r2, r6, #0x10
    mov r5, r4
    bl func_0206c09c
    ldrh r2, [r6, #0x2]
    add r1, r7, #0x3c
    bl func_0206c114
    ldrh r2, [r6, #0x8]
    add r1, r7, #0x50
    bl func_0206c114
    ldrh r3, [r6, #0xe]
    add r1, r5, #0x100
    mov r2, #0x0
    strh r3, [r1, #0xa]
    str r2, [r5, #0x110]
    ldr r1, [r5, #0x110]
    mov r4, r0
    str r1, [r5, #0x10c]
.L_88:
    ldrh r0, [r6, #0x6]
    cmp r0, #0x0
    ldreq r0, _LIT0
    ldreq r0, [r0]
    ldreq r0, [r0, #0x68]
    streq r0, [r7, #0x68]
    beq .L_f8
    str r4, [r7, #0x68]
    mov r1, r4
    str r7, [r4, #0x10c]
    add r0, r4, #0x110
    add r2, r6, #0x14
    mov r5, r4
    bl func_0206c09c
    ldrh r2, [r6, #0x6]
    add r1, r7, #0x48
    bl func_0206c114
    ldrh r2, [r6, #0xa]
    add r1, r7, #0x58
    bl func_0206c114
    ldrh r2, [r6, #0xc]
    add r1, r4, #0xf8
    bl func_0206c114
    mov r1, #0x0
    str r1, [r5, #0x108]
    ldr r1, [r5, #0x108]
    mov r4, r0
    str r1, [r5, #0x104]
.L_f8:
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
_LIT0: .word data_0219ec08
