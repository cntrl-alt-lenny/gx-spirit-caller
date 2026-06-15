; func_020a078c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a97c0
        .extern func_020928e8
        .extern func_020944a4
        .extern func_0209db88
        .extern func_0209dd30
        .extern func_0209de5c
        .global func_020a078c
        .arm
func_020a078c:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    mov r7, r0
    mov r6, r1
    mov r5, r2
    mov r0, #0x2
    mov r1, #0x7
    mov r2, #0x9
    mov r4, r3
    bl func_0209db88
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, lr}
    bxne lr
    cmp r6, #0x0
    addeq sp, sp, #0xc
    moveq r0, #0x6
    ldmeqia sp!, {r4, r5, r6, r7, lr}
    bxeq lr
    cmp r5, #0x70
    addhi sp, sp, #0xc
    movhi r0, #0x6
    ldmhiia sp!, {r4, r5, r6, r7, lr}
    bxhi lr
    ldr r1, _LIT0
    mov r0, r6
    mov r2, r5
    bl func_020944a4
    ldr r0, _LIT0
    mov r1, r5
    bl func_020928e8
    mov r1, r7
    mov r0, #0x18
    bl func_0209de5c
    ldrh r0, [sp, #0x20]
    str r4, [sp]
    ldrb r1, [sp, #0x24]
    str r0, [sp, #0x4]
    ldr r2, _LIT0
    str r1, [sp, #0x8]
    mov r3, r5
    mov r0, #0x18
    mov r1, #0x5
    bl func_0209dd30
    cmp r0, #0x0
    moveq r0, #0x2
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
_LIT0: .word data_021a97c0
