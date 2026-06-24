; func_02001ba8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02001ba8
        .arm
func_02001ba8:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x24
    and r6, r2, #0x3e0
    and r4, r1, #0x3e0
    and r3, r1, #0x7c00
    and ip, r2, #0x1f
    mov r7, r6, asr #0x5
    and r5, r2, #0x7c00
    mov r6, r5, asr #0xa
    and r5, r1, #0x1f
    mov r4, r4, asr #0x5
    mov r3, r3, asr #0xa
    str ip, [sp, #0xc]
    str r3, [sp, #0x20]
    str r7, [sp, #0x10]
    str r6, [sp, #0x14]
    str r5, [sp, #0x18]
    str r4, [sp, #0x1c]
    strh r2, [r0]
    mov lr, #0x1
    add r3, sp, #0xc
    add r2, sp, #0x0
    mov ip, #0x0
.L_5c:
    mov r4, ip
    rsb r5, lr, #0x10
.L_64:
    add r6, r3, r4, lsl #0x2
    ldr r6, [r6, #0xc]
    ldr r7, [r3, r4, lsl #0x2]
    mul r6, lr, r6
    mla r6, r5, r7, r6
    add r7, r6, #0x8
    mov r6, r7, asr #0x3
    add r6, r7, r6, lsr #0x1c
    mov r6, r6, asr #0x4
    str r6, [r2, r4, lsl #0x2]
    add r4, r4, #0x1
    cmp r4, #0x3
    blt .L_64
    ldr r5, [sp]
    ldr r4, [sp, #0x4]
    ldr r6, [sp, #0x8]
    orr r5, r5, r4, lsl #0x5
    mov r4, lr, lsl #0x1
    orr r5, r5, r6, lsl #0xa
    add lr, lr, #0x1
    strh r5, [r0, r4]
    cmp lr, #0xf
    blt .L_5c
    mov r2, lr, lsl #0x1
    strh r1, [r0, r2]
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, r6, r7, pc}
