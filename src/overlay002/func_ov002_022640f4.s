; func_ov002_022640f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_ov002_021de480
        .global func_ov002_022640f4
        .arm
func_ov002_022640f4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    ldr r5, _LIT0
    ldr r9, [r5, #0xd28]
    cmp r9, #0xa
    bcs .L_9c
    ldr ip, _LIT1
    ldr r6, _LIT2
    ldr r3, _LIT3
    add r4, ip, #0xda0
    mov r2, #0x5
    mov lr, #0x14
.L_2c:
    umull r7, r1, r9, r3
    mov r1, r1, lsr #0x2
    umull r7, r8, r9, r3
    eor r8, r0, r8, lsr #0x2
    umull r1, r7, r2, r1
    and r7, r8, #0x1
    sub r1, r9, r1
    mla r9, r7, ip, r6
    mla r7, r1, lr, r9
    ldr r7, [r7, #0x30]
    mov r7, r7, lsl #0x13
    cmp r4, r7, lsr #0x13
    bne .L_88
    mov r2, #0x0
    mov r0, r8
    mov r3, r2
    bl func_ov002_021de480
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0xd28]
    add r2, r2, #0x1
    str r2, [r1, #0xd28]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_88:
    ldr r1, [r5, #0xd28]
    add r9, r1, #0x1
    str r9, [r5, #0xd28]
    cmp r9, #0xa
    bcc .L_2c
.L_9c:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf16c
_LIT3: .word 0xcccccccd
