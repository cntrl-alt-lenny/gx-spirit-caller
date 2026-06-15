; func_02074dcc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02070c84
        .extern func_02070ec4
        .extern func_02074e58
        .extern func_02077f8c
        .extern func_020785cc
        .global func_02074dcc
        .arm
func_02074dcc:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4
    mov r9, r0
    ldr r8, [r9, #0xc]
    add r5, r8, #0x2ec
    add r4, r8, #0x3a4
    mov r7, #0x0
    mov r6, #0x1
.L_690:
    mov r0, r9
    bl func_02070ec4
    strb r7, [r8, #0x455]
    str r7, [r8, #0x1d4]
    mov r0, r5
    strb r6, [r8, #0x454]
    bl func_020785cc
    mov r0, r4
    bl func_02077f8c
    mov r0, r9
    bl func_02074e58
    cmp r0, #0x0
    moveq r0, #0x8
    addeq sp, sp, #0x4
    streqb r0, [r8, #0x455]
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bxeq lr
    mov r0, r9
    bl func_02070c84
    ldrh r0, [r9, #0x1a]
    strh r0, [r9, #0x18]
    ldr r0, [r9, #0x20]
    str r0, [r9, #0x1c]
    b .L_690
