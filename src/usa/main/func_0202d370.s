; func_0202d370 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020be8d0
        .extern data_020c6c30
        .extern data_0219ac68
        .extern func_02006bf0
        .extern func_02006e00
        .extern func_0201d428
        .extern func_0201d4dc
        .extern func_0201e564
        .extern OS_SPrintf
        .extern func_02094410
        .global func_0202d370
        .arm
func_0202d370:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x48
    ldr r1, _LIT0
    ldr r2, [r1, #0x1c]
    cmp r2, r0
    addeq sp, sp, #0x48
    ldmeqia sp!, {r3, pc}
    str r0, [r1, #0x1c]
    cmp r0, #0x0
    beq .L_29c
    ldr r1, _LIT1
    sub r0, r0, #0x1
    ldr r2, [r1, r0, lsl #0x2]
    ldr r1, _LIT2
    add r0, sp, #0x28
    bl OS_SPrintf
    add r0, sp, #0x0
    bl func_0201d428
    add r0, sp, #0x28
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    str r0, [sp]
    ldr r0, _LIT0
    ldrh ip, [sp, #0x14]
    ldr r0, [r0, #0x6c]
    ldr r2, _LIT3
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mvn r3, #0x0
    mov r1, #0x40
    bic ip, ip, #0xf
    and r0, r0, #0xf
    orr ip, ip, r0
    add r0, sp, #0x0
    strh ip, [sp, #0x14]
    str r3, [sp, #0x8]
    str r2, [sp, #0xc]
    strh r1, [sp, #0x10]
    bl func_0201e564
    ldr r0, [sp]
    bl func_02006e00
    add sp, sp, #0x48
    ldmia sp!, {r3, pc}
.L_29c:
    ldr r0, [r1, #0x6c]
    bl func_0201d4dc
    add r0, r0, #0xe0
    add r1, r0, #0x2000
    mov r0, #0x0
    mov r2, #0x80
    bl func_02094410
    add sp, sp, #0x48
    ldmia sp!, {r3, pc}
_LIT0: .word data_0219ac68
_LIT1: .word data_020be8d0
_LIT2: .word data_020c6c30
_LIT3: .word 0x000020e0
