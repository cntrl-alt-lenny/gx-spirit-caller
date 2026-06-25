; func_0202d288 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020be8b8
        .extern data_020c6c18
        .extern data_0219ac68
        .extern func_02006bf0
        .extern func_02006e00
        .extern func_0201d428
        .extern func_0201d4dc
        .extern func_0201e564
        .extern func_02091554
        .extern func_02094410
        .global func_0202d288
        .arm
func_0202d288:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x48
    ldr r1, _LIT0
    add r2, r0, #0x16
    ldr r3, [r1, #0x20]
    cmp r3, r2
    addeq sp, sp, #0x48
    ldmeqia sp!, {r3, pc}
    str r2, [r1, #0x20]
    cmp r0, #0x0
    beq .L_1b8
    ldr r1, _LIT1
    sub r0, r0, #0x1
    ldr r2, [r1, r0, lsl #0x2]
    ldr r1, _LIT2
    add r0, sp, #0x0
    bl func_02091554
    add r0, sp, #0x20
    bl func_0201d428
    add r0, sp, #0x0
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    str r0, [sp, #0x20]
    ldr r0, _LIT0
    ldrh ip, [sp, #0x34]
    ldr r0, [r0, #0x6c]
    ldr r2, _LIT3
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mvn r3, #0x0
    mov r1, #0x60
    bic ip, ip, #0xf
    and r0, r0, #0xf
    orr ip, ip, r0
    add r0, sp, #0x20
    strh ip, [sp, #0x34]
    str r3, [sp, #0x28]
    str r2, [sp, #0x2c]
    strh r1, [sp, #0x30]
    bl func_0201e564
    ldr r0, [sp, #0x20]
    bl func_02006e00
    add sp, sp, #0x48
    ldmia sp!, {r3, pc}
.L_1b8:
    ldr r0, [r1, #0x6c]
    bl func_0201d4dc
    add r0, r0, #0x160
    add r1, r0, #0x2000
    mov r0, #0x0
    mov r2, #0x80
    bl func_02094410
    add sp, sp, #0x48
    ldmia sp!, {r3, pc}
_LIT0: .word data_0219ac68
_LIT1: .word data_020be8b8
_LIT2: .word data_020c6c18
_LIT3: .word 0x00002160
