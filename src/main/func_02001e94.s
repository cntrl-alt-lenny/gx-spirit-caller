; func_02001e94 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02001e94
        .arm
func_02001e94:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r4, [r0, #0x4]
    mov r5, #0x0
    cmp r4, #0x0
    ldmlsia sp!, {r4, r5, r6, pc}
    mov r4, r5
.L_18:
    ldr r6, [r0]
    mov lr, r4
    cmp r6, #0x0
    bls .L_44
.L_28:
    orr ip, r2, r3, lsl #0xc
    strh ip, [r1], #0x2
    ldr r6, [r0]
    add lr, lr, #0x1
    cmp lr, r6
    add r2, r2, #0x1
    bcc .L_28
.L_44:
    ldr ip, [r0, #0x4]
    rsb lr, r6, #0x20
    add r5, r5, #0x1
    cmp r5, ip
    add r1, r1, lr, lsl #0x1
    bcc .L_18
    ldmia sp!, {r4, r5, r6, pc}
