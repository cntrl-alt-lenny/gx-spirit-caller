; func_0207ef90 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a08f4
        .global func_0207ef90
        .arm
func_0207ef90:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldrh ip, [r0, #0xc]
    ldrh r3, [r0, #0xe]
    mov lr, #0x0
    add r2, ip, #0x1
    cmp r3, r2
    bgt .L_4d8
    ldrh r2, [r0, #0xa]
    cmp r2, ip
    movls lr, #0x1
.L_4d8:
    cmp lr, #0x0
    subne r2, ip, r3
    addne r2, r2, #0x1
    movne r2, r2, lsl #0x10
    movne r2, r2, lsr #0x10
    moveq r2, #0x0
    cmp r2, #0x1
    movcs r2, #0x1
    movcc r2, #0x0
    cmp r2, #0x0
    addeq sp, sp, #0x4
    ldreq r0, _LIT0
    ldmeqfd sp!, {pc}
    ldr lr, [r0]
    ldr r3, _LIT1
    mov r2, #0x540
    mla ip, lr, r2, r3
    ldr r3, [r1]
    ldrh r2, [r0, #0xe]
    add ip, ip, #0x100
    mov r3, r3, asr #0x4
    add ip, ip, r2, lsl #0x5
    strh r3, [ip, #0x6]
    ldr r3, [r1, #0x4]
    mov r3, r3, asr #0x4
    strh r3, [ip, #0xe]
    ldr r3, [r1, #0x8]
    mov r3, r3, asr #0x4
    strh r3, [ip, #0x16]
    ldr r1, [r1, #0xc]
    mov r1, r1, asr #0x4
    strh r1, [ip, #0x1e]
    ldrh r1, [r0, #0xe]
    add r1, r1, #0x1
    strh r1, [r0, #0xe]
    mov r0, r2
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word 0x0000fffe
_LIT1: .word data_021a08f4
